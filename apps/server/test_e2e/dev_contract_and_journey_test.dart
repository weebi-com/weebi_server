/// Fast live contract & multi-actor journey suite against Weebi `dev`
/// (or local server + Envoy via env vars).
///
/// Exercises BOTH transport paths in < 5s with compile-time `protos_weebi` types:
///   1. Browser/Webapp path: `GrpcWebWireClient` -> Envoy proxy (`gRPC-Web`,
///      CORS preflight, `Set-Cookie`, `x-session-id`, BFF zero-JWT-leak audit).
///   2. Mobile/Desktop PoS path: `ClientChannel` -> native gRPC HTTP/2
///      (`dev.weebi.com:443`, direct JWT minting & device pairing).
///
/// Run from `weebi_server`:
/// ```sh
/// melos run test:dev
/// # or directly:
/// cd apps/server && dart test test_e2e
/// ```
///
/// Override endpoints for local/staging runs:
/// - `WEEBI_GRPC_HOST` (default: `dev.weebi.com`)
/// - `WEEBI_GRPC_PORT` (default: `443`)
/// - `WEEBI_GRPC_INSECURE` (`true` for plaintext localhost, default: `false`)
/// - `WEEBI_ENVOY_URL` (default: `https://weebi-envoyproxy-dev-29758828833.europe-west1.run.app`)
library;

import 'dart:io' show Platform;

import 'package:fence_service/fence_service.dart';
import 'package:fence_service/grpc.dart';
import 'package:fence_service/protos_weebi.dart';
import 'package:test/test.dart';

import 'grpc_web_wire_client.dart';

const _fencePrefix = '/weebi.fence.service.FenceService';

String? _extractCookieValue(List<String> setCookies, String cookieName) {
  final prefix = '$cookieName=';
  for (final header in setCookies) {
    for (final segment in header.split(';')) {
      final trimmed = segment.trim();
      if (trimmed.startsWith(prefix)) {
        return trimmed.substring(prefix.length);
      }
    }
  }
  return null;
}

void main() {
  final grpcHost =
      Platform.environment['WEEBI_GRPC_HOST']?.trim().isNotEmpty == true
          ? Platform.environment['WEEBI_GRPC_HOST']!.trim()
          : 'dev.weebi.com';
  final grpcPort =
      int.tryParse(Platform.environment['WEEBI_GRPC_PORT'] ?? '') ?? 443;
  final grpcInsecure =
      Platform.environment['WEEBI_GRPC_INSECURE']?.toLowerCase() == 'true';
  final envoyUrl =
      Platform.environment['WEEBI_ENVOY_URL']?.trim().isNotEmpty == true
          ? Platform.environment['WEEBI_ENVOY_URL']!.trim()
          : 'https://weebi-envoyproxy-dev-29758828833.europe-west1.run.app';

  late ClientChannel nativeChannel;
  late FenceServiceClient nativeFence;
  late GrpcWebWireClient envoyWeb;

  setUpAll(() {
    nativeChannel = ClientChannel(
      grpcHost,
      port: grpcPort,
      options: ChannelOptions(
        credentials: grpcInsecure
            ? const ChannelCredentials.insecure()
            : const ChannelCredentials.secure(),
      ),
    );
    nativeFence = FenceServiceClient(
      nativeChannel,
      options: CallOptions(timeout: const Duration(seconds: 20)),
    );
    envoyWeb = GrpcWebWireClient(envoyUrl);
  });

  tearDownAll(() async {
    envoyWeb.close();
    await nativeChannel.shutdown();
  });

  group('Contract — Health & Envoy CORS', () {
    test('native gRPC healthCheck reports healthy DB and versions', () async {
      final health = await nativeFence.healthCheck(Empty());
      // ignore: avoid_print
      print(
        '[dev native gRPC] server=${health.versions.server} '
        'protos_weebi=${health.versions.protosWeebi} '
        'fence_service=${health.versions.fenceService}',
      );
      expect(health.status, 'healthy');
      expect(health.databaseHealthy, isTrue);
    });

    test('Envoy CORS preflight allows x-session-id + credentials and proxies gRPC-Web healthCheck',
        () async {
      final preflight =
          await envoyWeb.optionsPreflight('$_fencePrefix/createFirm');
      expect(preflight.statusCode, anyOf(200, 204));
      expect(
        preflight.headers['access-control-allow-credentials'],
        'true',
        reason: 'BFF cookies require Access-Control-Allow-Credentials: true',
      );
      final allowHeaders =
          (preflight.headers['access-control-allow-headers'] ?? '')
              .toLowerCase();
      expect(allowHeaders, contains('x-session-id'));
      expect(allowHeaders, contains('x-grpc-web'));

      final webHealth = await envoyWeb.unary(
        '$_fencePrefix/healthCheck',
        Empty().writeToBuffer(),
        HealthCheckWeebiResponse.fromBuffer,
      );
      expect(webHealth.isOk, isTrue,
          reason:
              'HTTP ${webHealth.httpStatus}, grpc-status=${webHealth.grpcStatus}: ${webHealth.grpcMessage}');
      expect(webHealth.message!.status, 'healthy');
      expect(webHealth.message!.databaseHealthy, isTrue);
    });
  });

  group('Journey 1 — Webapp BFF signup -> createFirm -> PoS pairing -> logout',
      () {
    test(
        'BFF session rewrites permissions on createFirm without leaking JWTs, pairs a PoS device, and invalidates on logout',
        () async {
      final stamp = DateTime.now().millisecondsSinceEpoch;
      final mail = 'e2e.web.$stamp@weebi.com';
      const password = 'e2eWebPass!9';
      final firmName = 'E2E Web Firm $stamp';

      // 1. Webapp signUp through Envoy
      final signUpRes = await envoyWeb.unary(
        '$_fencePrefix/signUp',
        SignUpRequest(
          firstname: 'E2E',
          lastname: 'WebBoss',
          mail: mail,
          password: password,
          phone: Phone(countryCode: 221, number: '771234567'),
        ).writeToBuffer(),
        SignUpResponse.fromBuffer,
      );
      expect(signUpRes.isOk, isTrue, reason: signUpRes.grpcMessage);
      expect(signUpRes.message!.statusResponse.type, StatusResponse_Type.CREATED);
      expect(signUpRes.setCookies, isEmpty,
          reason: 'signUp must not set a session cookie');

      // 2. Webapp authenticateWithCredentials(isWebApp: true) through Envoy
      final authRes = await envoyWeb.unary(
        '$_fencePrefix/authenticateWithCredentials',
        Credentials(mail: mail, password: password, isWebApp: true)
            .writeToBuffer(),
        Tokens.fromBuffer,
      );
      expect(authRes.isOk, isTrue, reason: authRes.grpcMessage);
      final tokens = authRes.message!;
      expect(tokens.sessionId, isNotEmpty,
          reason: 'Web login must return a BFF sessionId');
      expect(tokens.accessToken, isEmpty,
          reason: 'Web login must NOT expose accessToken on the wire');
      expect(tokens.refreshToken, isEmpty,
          reason: 'Web login must NOT expose refreshToken on the wire');

      final loginCookie =
          _extractCookieValue(authRes.setCookies, 'weebi_session_id');
      expect(
        loginCookie,
        tokens.sessionId,
        reason: 'Envoy must set HttpOnly weebi_session_id cookie on web login',
      );

      final sessionMeta = <String, String>{
        'x-session-id': tokens.sessionId,
        'cookie': 'weebi_session_id=${tokens.sessionId}',
      };
      var loggedOut = false;
      addTearDown(() async {
        if (!loggedOut) {
          await envoyWeb.unary(
            '$_fencePrefix/logout',
            Empty().writeToBuffer(),
            Empty.fromBuffer,
            metadata: sessionMeta,
          );
        }
      });

      // 3. Webapp createFirm through Envoy (authenticated solely via BFF session)
      final createFirmRes = await envoyWeb.unary(
        '$_fencePrefix/createFirm',
        CreateFirmRequest(
          name: firmName,
          boutiqueMail: mail,
          boutiquePhone: '+221 771234567',
        ).writeToBuffer(),
        CreateFirmResponse.fromBuffer,
        metadata: sessionMeta,
      );
      expect(createFirmRes.isOk, isTrue,
          reason:
              'createFirm failed (${createFirmRes.grpcStatus}): ${createFirmRes.grpcMessage}');
      final firmCreated = createFirmRes.message!;
      expect(firmCreated.statusResponse.type, StatusResponse_Type.CREATED);
      final firmId = firmCreated.firm.firmId;
      expect(firmId, isNotEmpty);
      expect(firmCreated.sessionId, tokens.sessionId,
          reason: 'createFirm must confirm the updated BFF sessionId');

      // 4. Subsequent BFF calls use the SAME sessionId (no second login, no refresh needed)
      final readUserRes = await envoyWeb.unary(
        '$_fencePrefix/readOneUser',
        UserId().writeToBuffer(),
        ReadOneUserResponse.fromBuffer,
        metadata: sessionMeta,
      );
      expect(readUserRes.isOk, isTrue, reason: readUserRes.grpcMessage);
      final perms = readUserRes.message!.user.permissions;
      expect(perms.firmId, firmId,
          reason: 'Rewritten web session must carry the new firmId');
      expect(perms.isFirmCreator, isTrue);
      expect(perms.firmRights.rights.contains(Right.create), isFalse);
      expect(perms.firmRights.rights.contains(Right.read), isTrue);

      final readFirmRes = await envoyWeb.unary(
        '$_fencePrefix/readOneFirm',
        Empty().writeToBuffer(),
        Firm.fromBuffer,
        metadata: sessionMeta,
      );
      expect(readFirmRes.isOk, isTrue, reason: readFirmRes.grpcMessage);
      expect(readFirmRes.message!.firmId, firmId);
      expect(readFirmRes.message!.name, firmName);

      // 5. StatusResponse RPC (with non-empty message check on Envoy cookie filter)
      final updateChainRes = await envoyWeb.unary(
        '$_fencePrefix/updateOneChain',
        ChainRequest(chainId: firmId, name: firmName).writeToBuffer(),
        StatusResponse.fromBuffer,
        metadata: sessionMeta,
      );
      expect(updateChainRes.isOk, isTrue, reason: updateChainRes.grpcMessage);

      // 6. Cross-actor handoff: Webapp generates pairing code -> Mobile PoS pairs over native gRPC
      final codeRes = await envoyWeb.unary(
        '$_fencePrefix/generateCodeForPairingDevice',
        ChainIdAndboutiqueId(chainId: firmId, boutiqueId: firmId)
            .writeToBuffer(),
        CodeForPairingDevice.fromBuffer,
        metadata: sessionMeta,
      );
      expect(codeRes.isOk, isTrue, reason: codeRes.grpcMessage);
      expect(codeRes.message!.code, greaterThan(0));

      // Mobile PoS logs in natively (isWebApp: false -> gets JWT) and pairs the till
      final mobileLogin = await nativeFence.authenticateWithCredentials(
        Credentials(mail: mail, password: password, isWebApp: false),
      );
      expect(mobileLogin.accessToken, isNotEmpty);

      final paired = await nativeFence.createDevice(
        PendingDeviceRequest(
          code: codeRes.message!.code,
          hardwareInfo: HardwareInfo(name: 'E2E PoS Till', baseOS: 'android-e2e'),
        ),
        options: CallOptions(metadata: {'authorization': mobileLogin.accessToken}),
      );
      expect(paired.statusResponse.type, StatusResponse_Type.CREATED);
      expect(paired.firmId, firmId);

      // Webapp sees the newly paired device through Envoy
      final devicesRes = await envoyWeb.unary(
        '$_fencePrefix/readDevices',
        ReadDevicesRequest(chainId: firmId).writeToBuffer(),
        Devices.fromBuffer,
        metadata: sessionMeta,
      );
      expect(devicesRes.isOk, isTrue, reason: devicesRes.grpcMessage);
      expect(
        devicesRes.message!.devices.any((d) => d.deviceId == paired.deviceId),
        isTrue,
        reason: 'Webapp must see the device paired by the mobile PoS',
      );

      // Clean up the test device before logging out
      final pairedDevice = devicesRes.message!.devices
          .firstWhere((d) => d.deviceId == paired.deviceId);
      await nativeFence.deleteOneDevice(
        DeleteDeviceRequest(chainId: firmId, device: pairedDevice),
        options: CallOptions(metadata: {'authorization': mobileLogin.accessToken}),
      );

      // 7. Logout via Envoy invalidates server session and afterward rejects requests
      final logoutRes = await envoyWeb.unary(
        '$_fencePrefix/logout',
        Empty().writeToBuffer(),
        Empty.fromBuffer,
        metadata: sessionMeta,
      );
      expect(logoutRes.isOk, isTrue, reason: logoutRes.grpcMessage);
      loggedOut = true;

      final afterLogout = await envoyWeb.unary(
        '$_fencePrefix/readOneFirm',
        Empty().writeToBuffer(),
        Firm.fromBuffer,
        metadata: sessionMeta,
      );
      expect(
        afterLogout.grpcStatus,
        StatusCode.unauthenticated,
        reason: 'Logged-out BFF sessionId must be rejected as UNAUTHENTICATED',
      );

      // 8. Wire-level BFF security & Envoy cookie invariants (collected so device/session cleanup always runs first)
      final wireViolations = <String>[
        if (firmCreated.accessToken.isNotEmpty)
          'BFF createFirm leaked accessToken (${firmCreated.accessToken.length} chars) over gRPC-Web',
        if (firmCreated.refreshToken.isNotEmpty)
          'BFF createFirm leaked refreshToken (${firmCreated.refreshToken.length} chars) over gRPC-Web',
        if (_extractCookieValue(createFirmRes.setCookies, 'weebi_session_id')
                case final c?
            when c != tokens.sessionId)
          'createFirm overwrote weebi_session_id cookie with unexpected value: $c',
        if (updateChainRes.setCookies.isNotEmpty)
          'Non-session RPC updateOneChain unexpectedly emitted Set-Cookie: ${updateChainRes.setCookies}',
        if (_extractCookieValue(logoutRes.setCookies, 'weebi_session_id') != '')
          'Envoy logout did not clear weebi_session_id cookie (Set-Cookie: ${logoutRes.setCookies})',
      ];
      expect(
        wireViolations,
        isEmpty,
        reason: 'BFF wire/cookie security violations:\n  - ${wireViolations.join('\n  - ')}',
      );
    });
  });

  group('Journey 2 — Mobile/Desktop native gRPC seamless signup', () {
    test('mobile createFirm mints direct JWT with firmId and pairs without second login',
        () async {
      final stamp = DateTime.now().millisecondsSinceEpoch;
      final mail = 'e2e.mob.$stamp@weebi.com';
      const password = 'e2eMobPass!9';

      final signUp = await nativeFence.signUp(
        SignUpRequest(
          firstname: 'E2E',
          lastname: 'MobileBoss',
          mail: mail,
          password: password,
        ),
      );
      expect(signUp.statusResponse.type, StatusResponse_Type.CREATED);

      final firstLogin = await nativeFence.authenticateWithCredentials(
        Credentials(mail: mail, password: password, isWebApp: false),
      );
      expect(firstLogin.accessToken, isNotEmpty);
      expect(firstLogin.sessionId, isEmpty);
      expect(firstLogin.accessToken.userPermissions.firmId, isEmpty);

      final created = await nativeFence.createFirm(
        CreateFirmRequest(name: 'E2E Mobile Firm $stamp'),
        options:
            CallOptions(metadata: {'authorization': firstLogin.accessToken}),
      );
      expect(created.statusResponse.type, StatusResponse_Type.CREATED);
      expect(created.accessToken, isNotEmpty,
          reason: 'Mobile/desktop createFirm MUST return minted accessToken');
      expect(created.refreshToken, isNotEmpty,
          reason: 'Mobile/desktop createFirm MUST return minted refreshToken');
      expect(created.sessionId, isEmpty);

      final mintedPerms = created.accessToken.userPermissions;
      expect(mintedPerms.firmId, created.firm.firmId);
      expect(mintedPerms.isFirmCreator, isTrue);

      // Immediately usable for pairing without a second authenticateWithCredentials
      final code = await nativeFence.generateCodeForPairingDevice(
        ChainIdAndboutiqueId(
          chainId: created.firm.firmId,
          boutiqueId: created.firm.firmId,
        ),
        options: CallOptions(metadata: {'authorization': created.accessToken}),
      );
      expect(code.code, greaterThan(0));
    });
  });
}
