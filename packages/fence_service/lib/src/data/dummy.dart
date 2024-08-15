import 'package:fixnum/fixnum.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:fence_service/src/data/roles_default.dart';

/// hardcoded ids can hide gaps in real actual process
/// since the _ids logic is no longer handled by mongodb, some of below could be simplified..

abstract class Dummy {
  static const password = '1234';

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

  static final userInfo = UserPublic(
      mail: 'dev@weebi.com',
      firstname: 'dev',
      lastname: 'tester',
      userId: '665e12f798357783e8000008',
      phone: Phone(countryCode: 33, number: '145711299'),
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
        ..boutiqueIds = BoutiqueIds(ids: ['ALL'])
        ..chainIds = ChainIds(ids: [chain.chainId]));

  static final adminPermission = UserPermissions.create()
    ..articleRights = RightsAdmin.article
    ..boutiqueRights = RightsAdmin.boutique
    ..contactRights = RightsAdmin.contact
    ..chainRights = RightsAdmin.chain
    ..firmRights = RightsAdmin.firm
    ..ticketRights = RightsAdmin.ticket
    ..boolRights = RightsAdmin.boolRights
    ..userManagementRights = RightsAdmin.userManagement
    ..billingRights = RightsAdmin.billing
    ..boutiqueIds = BoutiqueIds(ids: ['ALL'])
    ..chainIds = ChainIds(ids: ['ALL']);

  // TODO rework this accessible to fit
//  chainId and boutiqueWithin

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
    ..boutiqueIds = BoutiqueIds(ids: [boutique.boutiqueId])
    ..chainIds = ChainIds(ids: [chain.chainId]);
}
/* 
    passwordEncrypted:
        'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db',
 */
