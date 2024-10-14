import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/grpc.dart';

import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

void main() {
  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));
  late FenceService fenceService;

  setUpAll(() async {
    await db.open();
    final isConnected = await connection.connect();
    expect(isConnected, true);
    fenceService = FenceService(db);

    await db.createCollection(fenceService.userCollection.collectionName);
    await db.createCollection(fenceService.boutiqueCollection.collectionName);
    await db.createCollection(fenceService.firmCollection.collectionName);
    await db
        .createCollection(fenceService.pairingCodesCollection.collectionName);

    await fenceService.userCollection
        .insertOne((Dummy.userPrivate.toProto3Json() as Map<String, dynamic>));

    await fenceService.boutiqueCollection
        .insertOne((Dummy.chain.toProto3Json() as Map<String, dynamic>));
  });

  tearDownAll(() async {
    await db.collection(fenceService.userCollection.collectionName).drop();
    await db.collection(fenceService.boutiqueCollection.collectionName).drop();
    await db.collection(fenceService.firmCollection.collectionName).drop();
    await db
        .collection(fenceService.pairingCodesCollection.collectionName)
        .drop();
    await connection.close();
  });
  test('testing device enrolment logic', () async {
    final bearer = await fenceService.authenticateWithCredentials(
        null, Credentials(mail: Dummy.userPublic.mail, password: '1234'));
    expect(bearer.accessToken.isNotEmpty, isTrue);

    /// webapp selected the boutique where the device should be enrolled
    final codeResponse = await fenceService.generateCodeForPairingDevice(
        ServiceCallTest(bearer.accessToken),
        ChainIdAndboutiqueId(
            chainId: Dummy.chain.chainId,
            boutiqueId: Dummy.boutique.boutiqueId));

    expect(codeResponse.chainId, Dummy.chain.chainId);
    expect(codeResponse.boutiqueId, Dummy.boutique.boutiqueId);
    expect(codeResponse.code != 0, isTrue);
    // print('codeResponse.code ${codeResponse.code}');

    /// right after creating the code, the web app displays a circularProgressIndicator and listens to changes
    /// which should trigger a response in the webapp request
    /// since this is hard to include in the test
    /// here we assume the webapp user goes to device screen and refreshes accordingly
//    final device = await fenceService.readOnePendingDevice(
//        ServiceCallTest(bearer.accessToken),
//        ReadDeviceBtqRequest(
//            chainId: Dummy.chain.chainId,
//            boutiqueId: Dummy.boutique.boutiqueId));
//

    /// From the PoS app the user types the code which == creating the pending device

    final pendingDevice =
        PendingDeviceRequest(code: codeResponse.code, device: Dummy.device);
    final createPendingDeviceStatusResponse =
        await fenceService.createPendingDevice(
            ServiceCallTest('', path: 'createPendingDevice'), pendingDevice);
    expect(createPendingDeviceStatusResponse.statusResponse.type,
        StatusResponse_Type.CREATED);

    //
    final devices = await fenceService.readDevices(
        ServiceCallTest(bearer.accessToken),
        ReadDevicesRequest(chainId: Dummy.chain.chainId));

    expect(devices.devices.isNotEmpty, isTrue);
    expect(devices.devices.length,
        2); // one device already included in Dummy.boutique

    final device =
        devices.devices.firstWhere((d) => d.dateCreation.seconds != 0);

    /// 14 oct 2024 no need to approve the device to make it faster and simpler
//    final approveDeviceStatus = await fenceService.approveDevice(
//        ServiceCallTest(bearer.accessToken),
//        ApproveDeviceRequest(device: device));
//
//    expect(approveDeviceStatus.type, StatusResponse_Type.UPDATED);

    /// now user from PoS app can authent with min. permission available
    /// allowing them to sync articles, contacts, boutiqueInfo etc.
    final tokens = await fenceService.authenticateWithDevice(
      ServiceCallTest('', path: 'authenticateWithDevice'),
      DeviceCredentials(
          firmId: Dummy.firm.firmId,
          chainId: Dummy.chain.chainId,
          boutiqueId: Dummy.boutique.boutiqueId,
          deviceId: device.deviceId,
          password: ''),
    );

    expect(tokens.accessToken.isNotEmpty, isTrue);
  });
}
