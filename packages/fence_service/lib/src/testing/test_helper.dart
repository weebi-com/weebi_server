import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/user_testing.dart';

class TestHelper {
  static final localDb = Db("mongodb://localhost:27017/local");

  /// avoid adding boutique_service depency in ticket_service just to get unit test rolling
  /// also a lot of half-mocked logic to recreate objects prod like
  /// since we delegate id management to mongodb, we need to create firm, then chain, then boutique
  /// and pass their ids to the counterfoil used by the ticket
  static Future<Counterfoil> ticketSetUp(Db db, Connection connection) async {
    await db.open();
    await connection.connect();
    var fenceService = FenceService(
      db,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.createCollection(fenceService.userCollection.collectionName);
    await db.createCollection(fenceService.boutiqueCollection.collectionName);
    final responseUser = await fenceService.addPendingUser(
      null,
      AddPendingUserRequest(
        mail: Dummy.userInfo.mail,
        firstname: Dummy.userInfo.firstname,
        lastname: Dummy.userInfo.lastname,
        permissions: Dummy.userInfo.permissions,
        phone: Dummy.userInfo.phone,
      ),
    );
    final response = await fenceService.createFirm(null, CreateFirmRequest());

    final firm = await fenceService.readOneFirm(null, Empty());

    fenceService..userPermissionIfTest = Dummy.adminPermission;
    return Counterfoil.create()
      ..firmId = response.firmId
      ..chainId = firm.chains.first.chainId
      ..boutiqueId = firm.chains.first.boutiques.first.boutiqueId
      ..userId = Dummy.userInfo.userId;
  }
}
