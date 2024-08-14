import 'package:fixnum/fixnum.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:user_service/src/data/roles_default.dart';

/// hardcoded ids can hide gaps in real actual process
/// since the _ids logic is no longer handled by mongodb, some of below could be simplified..

abstract class Dummy {
  static final address = Address.create()
    ..street = 'str'
    ..city = 'city'
    ..code = 'code'
    ..country = Country(code2Letters: 'fr');
  static final boutiqueNoId = Boutique.create()
    ..address = Dummy.address
    ..name = 'dummy boutique'
    ..phone = Phone(countryCode: 33, number: '773116767');
  static final boutique = Boutique.create()
    ..boutiqueId = '665e12f798357783e8000002'
    ..address = Dummy.address
    ..name = 'dummy boutique'
    ..phone = Phone(countryCode: 33, number: '773116767');

  static final device = Device()
    ..id = '665e12f798357783e8000009'
    ..name = 'dummy device'
    ..serialNumber = 'unique';

  static final deviceNoId = Device()
    ..name = 'dummy device'
    ..serialNumber = 'unique';

  static final chainNoId = Chain(
    boutiques: <Boutique>[Dummy.boutique],
    devices: <Device>[Dummy.device],
  );
  static final chain = Chain(
    chainId: '665e12f798357783e8000001',
    firmId: '665e12f798357783e8000000',
    boutiques: <Boutique>[Dummy.boutique],
    devices: <Device>[Dummy.device],
  );

  static final firmNoId = Firm(
    name: 'firmDummy',
    chains: <Chain>[Dummy.chainNoId],
    subscriptionPlan: 'test',
    subscriptionSeats: 1,
    subscriptionStartTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    subscriptionEndTimestampUTC: null, // everlasting subs
    status: true,
    statusUpdateTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    lastUpdateTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    lastUpdatedByuserId: '1',
  );

  static final firm = Firm(
    firmId: '665e12f798357783e8000000',
    name: 'firmDummy',
    chains: <Chain>[Dummy.chainNoId],
    subscriptionPlan: 'test',
    subscriptionSeats: 1,
    subscriptionStartTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    subscriptionEndTimestampUTC: null, // everlasting subs
    status: true,
    statusUpdateTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    lastUpdateTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    lastUpdatedByuserId: '1',
  );

  static final userInfo = UserInfo(
      mail: 'dev@weebi.com',
      firstname: 'dev',
      lastname: 'tester',
      userId: '665e12f798357783e8000008',
      permissions: UserPermissions.create()
        ..firmId = '665e12f798357783e8000000'
        ..userId = '665e12f798357783e8000008'
        ..articleRights = RightsAdmin.article
        ..boutiqueRights = RightsAdmin.boutique
        ..contactRights = RightsAdmin.contact
        ..chainRights = RightsAdmin.chain
        ..firmRights = RightsAdmin.firm
        ..ticketRights = RightsAdmin.ticket
        ..boolRights = BoolRights()
        ..userManagementRights = RightsAdmin.userManagement
        ..boutiquesAccessible = Ids(ids: ['ALL'])
        ..chainsAccessible = Ids(ids: [chain.chainId]));

  static final userInfoNoId = UserInfo(
      mail: 'dev@weebi.com',
      firstname: 'dev',
      lastname: 'tester',
      //userId: '665e12f798357783e8000008',
      permissions: UserPermissions.create()
        ..firmId = '665e12f798357783e8000000'
        //..userId = '665e12f798357783e8000008'
        ..articleRights = RightsAdmin.article
        ..boutiqueRights = RightsAdmin.boutique
        ..contactRights = RightsAdmin.contact
        ..chainRights = RightsAdmin.chain
        ..firmRights = RightsAdmin.firm
        ..ticketRights = RightsAdmin.ticket
        ..boolRights = BoolRights()
        ..userManagementRights = RightsAdmin.userManagement
        ..boutiquesAccessible = Ids(ids: ['ALL'])
        ..chainsAccessible = Ids(ids: [chain.chainId]));

  static final adminPermission = UserPermissions.create()
    ..userId = '665e12f798357783e8000008'
    ..firmId = '665e12f798357783e8000008'
    ..articleRights = RightsAdmin.article
    ..boutiqueRights = RightsAdmin.boutique
    ..contactRights = RightsAdmin.contact
    ..chainRights = RightsAdmin.chain
    ..firmRights = RightsAdmin.firm
    ..ticketRights = RightsAdmin.ticket
    ..boolRights = RightsAdmin.boolRights
    ..userManagementRights = RightsAdmin.userManagement
    ..boutiquesAccessible = Ids(ids: ['ALL'])
    ..chainsAccessible = Ids(ids: [chain.chainId]);

  /// hardcoded ids will not work with tests with mongodb
  /// since the _ids logic is handled by mongodb
  /// this permission will be cloned without ids
  static final salesPersonPermission = UserPermissions.create()
    ..userId = '665e12f798357783e8000008'
    ..firmId = userInfo.permissions.firmId
    ..articleRights = RightSalesperson.article
    ..boutiqueRights = RightSalesperson.boutique
    ..contactRights = RightSalesperson.contact
    ..ticketRights = RightSalesperson.ticket
    ..boolRights = BoolRights()
    ..boutiquesAccessible = Ids(ids: [boutique.boutiqueId])
    ..chainsAccessible = Ids(ids: [chain.chainId]);
}
/* 
class UserPrivateDummy {
  static final userNoId = UserPrivate(
    //userId: '665e12f798357783e8000008',
    firstname: 'dev',
    lastname: 'tester',
    mail: 'dev@weebi.com',
    passwordEncrypted:
        'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db',
    firmId: '665e12f798357783e8000000',
    chainIds: Ids(ids: ['665e12f798357783e8000001']),
    boutiqueIds: Ids(ids: ['ALL']),
    articleRights: RightsAdmin.article,
    boutiqueRights: RightsAdmin.boutique,
    chainRights: RightsAdmin.chain,
    firmRights: RightsAdmin.firm,
    contactRights: RightsAdmin.contact,
    ticketRights: RightsAdmin.ticket,
    userManagementRights: RightsAdmin.userManagement,
    boolRights: BoolRights(),
  );


}
 */
