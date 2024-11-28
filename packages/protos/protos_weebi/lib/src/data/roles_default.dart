import 'package:protos_weebi/protos_weebi_io.dart';

abstract class RightsAdmin {
  static final billing = BillingRights(
    rights: const [Right.create, Right.read, Right.update, Right.delete],
  );
  static final userManagement = UserManagementRights(
    rights: const [Right.create, Right.read, Right.update, Right.delete],
  );
  static final article = ArticleRights(
    rights: const [Right.create, Right.read, Right.update, Right.delete],
  );
  static final chain = ChainRights(
    rights: const [Right.create, Right.read, Right.update, Right.delete],
  );
  // Firm creation only available after signup just in case
  static final firm = FirmRights(
    rights: const [Right.read, Right.update, Right.delete],
  );
  static final boutique = BoutiqueRights(
      rights: const [Right.create, Right.read, Right.update, Right.delete]);
  static final contact = ContactRights(
      rights: const [Right.create, Right.read, Right.update, Right.delete]);
  static final ticket = TicketRights(
      rights: const [Right.create, Right.read, Right.update, Right.delete]);

  static final boolRights = BoolRights(
    canExportData: true,
    canGiveDiscount: true,
    canSeeStats: true,
    canSetPromo: true,
  );
}

abstract class RightSalesperson {
  static final article = ArticleRights(rights: const [Right.read]);
  static final boutique = BoutiqueRights(rights: const [Right.read]);
  static final contact =
      ContactRights(rights: const [Right.create, Right.read, Right.update]);
  static final ticket = TicketRights(rights: const [Right.create, Right.read]);
  static final boolRights = BoolRights(
    canExportData: false,
    canGiveDiscount: false,
    canSeeStats: false,
    canSetPromo: false,
  );
}
