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
      userPermissionIfTest: UserPrivateDummy.adminPermission,
    );
    var userService = UserService(
      db,
      boutiqueService,
      isTest: true,
      userPermissionIfTest: UserPrivateDummy.adminPermission,
    );
    await db.createCollection(userService.collection.collectionName);
    await db.createCollection(boutiqueService.collection.collectionName);
    final responseUser = await userService.createOne(
      null,
      CreateOneRequest(
        userInfo: UserInfoDummy.userInfo,
        password: '1234',
        isFirstUser: true,
      ),
    );
    final response =
        await boutiqueService.createOneFirm(null, FirmDummy.firmNoId);

    final firm = await boutiqueService.readOneFirm(null, Empty());

    UserPrivateDummy.adminPermission.firmOid = response.id;
    UserPrivateDummy.adminPermission.userOid = responseUser.id;
    UserPrivateDummy.adminPermission.chainsAccessible =
        Oids(oids: [firm.chains.first.id.oid]);
    UserPrivateDummy.adminPermission.boutiquesAccessible =
        Oids(oids: [firm.chains.first.boutiques.first.id.oid]);

    userService..userPermissionIfTest = UserPrivateDummy.adminPermission;
    return Counterfoil.create()
      ..firmOid = response.id
      ..chainOid = firm.chains.first.id.oid
      ..boutiqueOid = firm.chains.first.boutiques.first.id.oid;
  }
}
