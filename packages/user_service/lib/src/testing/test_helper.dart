import 'package:boutique_service/boutique_service.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:user_service/user_service.dart';
import 'package:user_service/user_testing.dart';

class TestHelper {
  static final localDb = Db("mongodb://localhost:27017/local");

  /// avoid adding boutique_service depency in ticket_service just to get unit test rolling
  /// also a lot of half-mocked logic to recreate objects prod like
  /// since we delegate id management to mongodb, we need to create firm, then chain, then boutique
  /// and pass their ids to the counterfoil used by the ticket
  static Future<Counterfoil> ticketSetUp(Db db, Connection connection) async {
    await db.open();
    await connection.connect();
    final boutiqueService = BoutiqueService(
      db,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    var userService = UserService(
      db,
      boutiqueService,
      isTest: true,
      userPermissionIfTest: Dummy.adminPermission,
    );
    await db.createCollection(userService.collection.collectionName);
    await db.createCollection(boutiqueService.collection.collectionName);
    final responseUser = await userService.createOne(
      null,
      CreateOneRequest(
        userInfo: Dummy.userInfo,
        password: '1234',
        isFirstUser: true,
      ),
    );
    final response = await boutiqueService.createOneFirm(null, Dummy.firmNoId);

    final firm = await boutiqueService.readOneFirm(null, Empty());

    Dummy.adminPermission.firmId = Dummy.userInfo.permissions.firmId;
    Dummy.adminPermission.userId = responseUser.id;
    Dummy.adminPermission.chainsAccessible =
        Ids(ids: [firm.chains.first.chainId]);
    Dummy.adminPermission.boutiquesAccessible =
        Ids(ids: [firm.chains.first.boutiques.first.boutiqueId]);

    userService..userPermissionIfTest = Dummy.adminPermission;
    return Counterfoil.create()
      ..firmId = response.id
      ..chainId = firm.chains.first.chainId
      ..boutiqueId = firm.chains.first.boutiques.first.boutiqueId
      ..userId = Dummy.userInfo.userId;
  }
}
