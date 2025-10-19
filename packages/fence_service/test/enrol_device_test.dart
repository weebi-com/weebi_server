import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';
import 'package:fence_service/mongo_pool.dart';
import 'package:protos_weebi/data_dummy.dart';
//import 'package:protos_weebi/grpc.dart';

import 'package:test/test.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

import 'service_call_impl.dart';

void main() async {
  final MongoDbPoolService poolService = TestHelper.defaultPoolService;
  await poolService.initialize();
  late FenceService fenceService;

  setUpAll(() async {
    fenceService = FenceService(poolService);
    
    final db = await poolService.acquire();

    await db.createCollection(FenceService.userCollectionName);
    await db.createCollection(FenceService.boutiqueCollectionName);
    await db.createCollection(FenceService.firmCollectionName);
    await db
        .createCollection(FenceService.pairingCodesCollectionName);

    await db.collection(FenceService.userCollectionName)
        .insertOne((Dummy.userPrivate.toProto3Json() as Map<String, dynamic>));

    await db.collection(FenceService.boutiqueCollectionName)
        .insertOne((Dummy.chain.toProto3Json() as Map<String, dynamic>));
    poolService.release(db);
  
  });

  tearDownAll(() async {
    final db = await poolService.acquire();

    await db.collection(FenceService.boutiqueCollectionName).drop();
    await db.collection(FenceService.firmCollectionName).drop();
    await db
        .collection(FenceService.pairingCodesCollectionName)
        .drop();
    poolService.release(db);

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
        ServiceCallTest(bearer.accessToken, path: 'createDevice'),
        pendingDevice);
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
