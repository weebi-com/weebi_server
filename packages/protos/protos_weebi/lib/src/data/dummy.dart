import 'package:fixnum/fixnum.dart';
import 'package:protos_weebi/protos_weebi_io.dart';
import 'package:protos_weebi/src/data/roles_default.dart';
import 'package:protos_weebi/src/password_encrypter.dart';

/// hardcoded ids can hide gaps in real actual process
/// since the _ids logic is no longer handled by mongodb, some of below could be simplified..

abstract class Dummy {
  static final articleRetail = ArticleRetailPb.create()
    ..id = 1
    ..designation = 'test'
    ..price = 10.0
    ..calibreId = 1;
  static final calibre =
      CalibrePb(id: 1, title: 'test', articlesRetail: [articleRetail]);

  static final password = Encrypter('1234').encrypted;

  static final address = Address.create()
    ..street = 'str'
    ..city = 'city'
    ..code = 'code'
    ..country = Country(code2Letters: 'FR');

  static final boutiquePb = BoutiquePb(
    addressFull: Dummy.address,
    name: 'dummy boutique',
    phone: Phone(countryCode: 33, number: '773116767'),
  );
  static final boutiqueNoId = BoutiqueMongo(
    boutique: boutiquePb,
    devices: <Device>[Dummy.device],
  );

  static final boutiqueMongo = boutiqueNoId
    ..boutiqueId = '123456789'
    ..firmId = firm.firmId
    ..chainId = chain.chainId
    ..boutique.boutiqueId = '123456789';

  static final hardwareInfo = HardwareInfo.create()
    ..name = 'dummy device'
    ..serialNumber = 'unique';

  static final device = Device()
    ..chainId = '123456789'
    ..boutiqueId = '123456789'
    ..deviceId = '665e12f798357783e8000009';

  static final deviceNoId = Device()
    ..chainId = chain.chainId
    ..boutiqueId = boutiqueMongo.boutiqueId
    ..hardwareInfo = hardwareInfo;

  static final chainNoId = Chain(
    boutiques: <BoutiqueMongo>[Dummy.boutiqueNoId],
  );
  static final chain = chainNoId
    ..chainId = '123456789'
    ..firmId = '123456789'
    ..boutiques.first.boutiqueId = '123456789'
    ..boutiques.first.boutique.boutiqueId = '123456789'
    ..boutiques.first.chainId = '123456789'
    ..boutiques.first.firmId = '123456789'
    
    ;

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
      boutiqueIds: BoutiqueIds(ids: [boutiqueMongo.boutiqueId]),
      chainIds: ChainIds(ids: [chain.chainId]),
    );

  static final salesPersonPermission = salesPersonPermissionNoId
    ..userId = '987654321'
    ..firmId = userPublic.permissions.firmId;
}
