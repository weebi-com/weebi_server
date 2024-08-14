import 'package:fixnum/fixnum.dart';
//import 'package:mongo_dart/mongo_dart.dart' show ObjectId;
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:user_service/src/data/roles_default.dart';

class AddressDummy {
  static final address = Address.create()
    ..street = 'str'
    ..city = 'city'
    ..code = 'code'
    ..country = Country(code2Letters: 'fr');
}

class BoutiqueDummy {
  static final boutiqueNoId = Boutique.create()
    ..id = ObjectIdProto(oid: '665e12f798357783e8000002')
    ..address = AddressDummy.address
    ..name = 'dummy boutique'
    ..phone = Phone(countryCode: 33, number: '773116767');
  static final boutique = Boutique.create()
    ..id = ObjectIdProto(oid: '665e12f798357783e8000002')
    ..address = AddressDummy.address
    ..name = 'dummy boutique'
    ..phone = Phone(countryCode: 33, number: '773116767');
}

class DeviceDummy {
  static final device = Device()
    ..id = ObjectIdProto(oid: '665e12f798357783e8000009')
    ..name = 'dummy device'
    ..serialNumber = 'unique';

  static final deviceNoId = Device()
    ..name = 'dummy device'
    ..serialNumber = 'unique';
}

class ChainDummy {
  static final chainNoId = Chain(
    boutiques: <Boutique>[BoutiqueDummy.boutique],
    devices: <Device>[DeviceDummy.device],
  );
  static final chain = Chain(
    id: ObjectIdProto.create()..oid = '665e12f798357783e8000001',
    firmOid: '665e12f798357783e8000000',
    boutiques: <Boutique>[BoutiqueDummy.boutique],
    devices: <Device>[DeviceDummy.device],
  );
}

class FirmDummy {
  static final firmNoId = Firm(
    name: 'firmDummy',
    chains: <Chain>[ChainDummy.chainNoId],
    subscriptionPlan: 'test',
    subscriptionSeats: 1,
    subscriptionStartTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    subscriptionEndTimestampUTC: null, // everlasting subs
    status: true,
    statusUpdateTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    lastUpdateTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    lastUpdatedByUserOid: '1',
  );

  static final firm = Firm(
    id: ObjectIdProto.create()..oid = '665e12f798357783e8000000',
    name: 'firmDummy',
    chains: <Chain>[ChainDummy.chainNoId],
    subscriptionPlan: 'test',
    subscriptionSeats: 1,
    subscriptionStartTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    subscriptionEndTimestampUTC: null, // everlasting subs
    status: true,
    statusUpdateTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    lastUpdateTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    lastUpdatedByUserOid: '1',
  );
}

class UserInfoDummy {
  static final userInfo = UserInfo(
    userOid: '665e12f798357783e8000008',
    firstname: 'dev',
    lastname: 'tester',
  );
}

class UserPrivateDummy {
  static final userNoId = UserPrivate(
    //userOid: '665e12f798357783e8000008',
    firstname: 'dev',
    lastname: 'tester',
    mail: 'dev@weebi.com',
    passwordEncrypted:
        'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db',
    firmOid: '665e12f798357783e8000000',
    chainOids: Oids(oids: ['665e12f798357783e8000001']),
    boutiqueOids: Oids(oids: ['ALL']),
    articleRights: RightsAdmin.article,
    boutiqueRights: RightsAdmin.boutique,
    chainRights: RightsAdmin.chain,
    firmRights: RightsAdmin.firm,
    contactRights: RightsAdmin.contact,
    ticketRights: RightsAdmin.ticket,
    userManagementRights: RightsAdmin.userManagement,
    boolRights: BoolRights(),
  );

  /// hardcoded ids will not work with tests with mongodb
  /// since the _ids logic is handled by mongodb
  /// this permission will be cloned without ids
  static final adminPermission = UserPermissions.create()
    ..userOid = '665e12f798357783e8000008'
    ..firmOid = userNoId.firmOid
    ..articleRights = userNoId.articleRights
    ..boutiqueRights = userNoId.boutiqueRights
    ..contactRights = userNoId.contactRights
    ..chainRights = userNoId.chainRights
    ..firmRights = userNoId.firmRights
    ..ticketRights = userNoId.ticketRights
    ..boolRights = BoolRights()
    ..userManagementRights = userNoId.userManagementRights
    ..boutiquesAccessible = Oids(oids: ['ALL'])
    ..chainsAccessible = Oids(oids: ['665e12f798357783e8000001']);

  /// hardcoded ids will not work with tests with mongodb
  /// since the _ids logic is handled by mongodb
  /// this permission will be cloned without ids
  static final salesPersonPermission = UserPermissions.create()
    ..userOid = '665e12f798357783e8000008'
    ..firmOid = userNoId.firmOid
    ..articleRights = RightSalesperson.article
    ..boutiqueRights = RightSalesperson.boutique
    ..contactRights = RightSalesperson.contact
    ..ticketRights = RightSalesperson.ticket
    ..boolRights = BoolRights()
    ..boutiquesAccessible = Oids(oids: ['665e12f798357783e8000002'])
    ..chainsAccessible = Oids(oids: ['665e12f798357783e8000001']);
}
