import 'package:protos_weebi/protos_weebi_io.dart';

abstract class RightsAdmin {
  static final billing = BillingRights(
    rights: const [Right.create, Right.read, Right.update, Right.delete],
  );
  static final userManagement = UserManagementRights(
    rights: const [Right.create, Right.read, Right.update, Right.delete],
    canUpdateUserPassword: true,
  );
  static final article = ArticleRights(
    rights: const [Right.create, Right.read, Right.update, Right.delete],
  );
  static final chain = ChainRights(
    rights: const [Right.create, Right.read, Right.update, Right.delete],
  );
  /// Firm create is retired once the founder is bound to a firm.
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
    canStockMovement: true,
    canStockInventory: true,
    canSellOutOfCatalog: true,
    canSpendOutOfCatalog: true,
    canPurchase: true,
    canImportTickets: true,
    canUpdateContactBalanceOffline: true,
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

/// New self-signup account. Admin rights plus firm-create, no firm yet.
/// [createFirm] replaces firm rights with [RightsAdmin.firm] and sets firmId.
UserPermissions founderPermissions(String userId) => UserPermissions(
      userId: userId,
      articleRights: RightsAdmin.article,
      boutiqueRights: RightsAdmin.boutique,
      contactRights: RightsAdmin.contact,
      chainRights: RightsAdmin.chain,
      firmRights: FirmRights(
        rights: const [
          Right.create,
          Right.read,
          Right.update,
          Right.delete,
        ],
      ),
      ticketRights: RightsAdmin.ticket,
      boolRights: RightsAdmin.boolRights,
      userManagementRights: RightsAdmin.userManagement,
      billingRights: RightsAdmin.billing,
      fullAccess: AccessFull(hasFullAccess: true),
    );
