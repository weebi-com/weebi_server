import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:protos_weebi/data_dummy.dart';
//import 'package:protos_weebi/grpc.dart';

import 'package:test/test.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

import 'service_call_impl.dart';

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
    // await db.collection(fenceService.userCollection.collectionName).drop();
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
            boutiqueId: Dummy.boutiqueMongo.boutiqueId));

    expect(codeResponse.chainId, Dummy.chain.chainId);
    expect(codeResponse.boutiqueId, Dummy.boutiqueMongo.boutiqueId);
    expect(codeResponse.code != 0, isTrue);
    // print('codeResponse.code ${codeResponse.code}');

    final hardwareInfo = HardwareInfo.create()
      ..name = 'testDevice'
      ..baseOS = 'testOS';
    final pendingDevice = PendingDeviceRequest(
        code: codeResponse.code, hardwareInfo: hardwareInfo);

    final createPendingDeviceStatusResponse = await fenceService.createDevice(
        ServiceCallTest(bearer.accessToken, path: 'createDevice'), pendingDevice);
    expect(createPendingDeviceStatusResponse.statusResponse.type,
        StatusResponse_Type.CREATED);

    //
    final devices = await fenceService.readDevices(
        ServiceCallTest(bearer.accessToken),
        ReadDevicesRequest(chainId: Dummy.chain.chainId));

    expect(devices.devices.isNotEmpty, isTrue);
    expect(devices.devices.length,
        2); // one device already included in Dummy.boutique

    //final device = devices.devices.firstWhere((d) => d.timestamp.seconds != 0);

    /// 14 oct 2024 no need to approve the device to make it faster and simpler
//    final approveDeviceStatus = await fenceService.approveDevice(
//        ServiceCallTest(bearer.accessToken),
//        ApproveDeviceRequest(device: device));
//
//    expect(approveDeviceStatus.type, StatusResponse_Type.UPDATED);

    /// now user from PoS app can login
    /// or if offline use app with min. permission available
    /// allowing them to read articles, read contacts, read boutiqueInfo, read and create tickets
  });
}
