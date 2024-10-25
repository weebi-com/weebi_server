import 'package:fixnum/fixnum.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:protos_weebi/src/data/roles_default.dart';
import 'package:protos_weebi/src/password_encrypter.dart';

/// hardcoded ids can hide gaps in real actual process
/// since the _ids logic is no longer handled by mongodb, some of below could be simplified..

abstract class Dummy {
  static final password = Encrypter('1234').encrypted;

  static final address = Address.create()
    ..street = 'str'
    ..city = 'city'
    ..code = 'code'
    ..country = Country(code2Letters: 'fr');

  static final boutiqueNoId = Boutique(
    addressFull: Dummy.address,
    name: 'dummy boutique',
    phone: Phone(countryCode: 33, number: '773116767'),
    devices: <Device>[Dummy.device],
  );

  static final boutique = boutiqueNoId
    ..boutiqueId = '665e12f798357783e8000002'
    ..firmId = firm.firmId
    ..chainId = chain.chainId;

  static final device = Device()
    ..chainId = '665e12f798357783e8000001'
    ..boutiqueId = '665e12f798357783e8000002'
    ..deviceId = '665e12f798357783e8000009'
    ..hardwareInfo.name = 'dummy device'
    ..hardwareInfo.serialNumber = 'unique';

  static final deviceNoId = Device()
    ..chainId = chain.chainId
    ..boutiqueId = boutique.boutiqueId
    ..hardwareInfo.name = 'dummy device'
    ..hardwareInfo.serialNumber = 'unique';

  static final chainNoId = Chain(
    boutiques: <Boutique>[Dummy.boutiqueNoId],
  );
  static final chain = chainNoId
    ..chainId = '665e12f798357783e8000001'
    ..firmId = '123456789'
    ..boutiques.first.boutiqueId = '665e12f798357783e8000002'
    ..boutiques.first.chainId = '665e12f798357783e8000001'
    ..boutiques.first.firmId = '123456789';

  static final firmNoId = Firm(
    name: 'firmDummy',
    subscriptionPlan: 'test',
    subscriptionSeats: 1,
    subscriptionStartTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    subscriptionEndTimestampUTC: null, // everlasting subs
    status: true,
    statusUpdateTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    lastUpdateTimestampUTC: Timestamp(seconds: Int64.ONE, nanos: 0),
    lastUpdatedByuserId: '1',
  );

  static final firm = firmNoId..firmId = '123456789';

  static final userPublic = UserPublic(
    mail: 'local@weebi.com',
    firstname: 'dev',
    lastname: 'tester',
    userId: '987654321',
    phone: Phone(countryCode: 33, number: '145711299'),
    permissions: adminPermission
      ..firmId = '123456789'
      ..userId = '987654321',
  );

  static final userPrivate = UserPrivate.create()
    ..mergeFromProto3Json(userPublic.toProto3Json(), ignoreUnknownFields: true)
    ..passwordEncrypted = Encrypter('1234').encrypted;

  static final adminPermission = UserPermissions.create()
    ..firmId = '123456789'
    ..userId = '987654321'
    ..articleRights = RightsAdmin.article
    ..boutiqueRights = RightsAdmin.boutique
    ..contactRights = RightsAdmin.contact
    ..chainRights = RightsAdmin.chain
    ..firmRights = RightsAdmin.firm
    ..ticketRights = RightsAdmin.ticket
    ..boolRights = RightsAdmin.boolRights
    ..userManagementRights = RightsAdmin.userManagement
    ..billingRights = RightsAdmin.billing
    ..fullAccess = AccessFull(hasFullAccess: true);

  static final salesPersonPermissionNoId = UserPermissions.create()
    ..articleRights = RightSalesperson.article
    ..boutiqueRights = RightSalesperson.boutique
    ..contactRights = RightSalesperson.contact
    ..ticketRights = RightSalesperson.ticket
    ..boolRights = BoolRights()
    ..limitedAccess = AccessLimited(
      boutiqueIds: BoutiqueIds(ids: [boutique.boutiqueId]),
      chainIds: ChainIds(ids: [chain.chainId]),
    );

  static final salesPersonPermission = salesPersonPermissionNoId
    ..userId = '987654321'
    ..firmId = userPublic.permissions.firmId;
}
