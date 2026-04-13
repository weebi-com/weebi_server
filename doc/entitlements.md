# Entitlements model (Weebi)

Two proofs drive most product gates. Keep this list updated when you add or remove checks.

## 1. Firm creator operational joker (JWT)

- **Meaning:** The user who created the firm may use a **narrow preview path** for core sync without consuming a license seat.
- **Implementation:** `UserPermissions.isFirmCreator` is honored only inside operational access — today [`assertUserHasOperationalLicense`](../../weebi_server/packages/fence_service/lib/src/operational_license_gate.dart) and its callers.
- **Current RPC surfaces (joker OR active seat):**
  - `ticket_service`: create/read/update/delete tickets (`_assertOperationalLicense` in `ticket_service_base.dart`)
  - `article_service`: same pattern (`article_service_base.dart`)
  - `contact_service`: same pattern (`contact_service_base.dart`)

The joker is **not** a blanket “admin can do everything” flag.

## 2. License seat entitlement (`LicenseSeatEntitlement`)

- **Meaning:** Subscription-backed capabilities require an **active seat** on a **currently valid** firm license for this `userId`.
- **No joker:** Firm creator is **not** exempt unless they also have a seat (or you explicitly extend the joker list and update this doc).
- **Examples:** Portal tickets **filter and group by store** — see [`SeatCapability`](../lib/billing/seat_capability.dart) in the webapp.

Server reference: [`license_seat_entitlement.dart`](../../weebi_server/packages/fence_service/lib/src/license_seat_entitlement.dart).

## 3. Naming in code

- **Webapp:** Prefer [`SeatCapability`](../lib/billing/seat_capability.dart) for seat-gated UI instead of ad hoc `LicenseSeatClient` calls.
- **Server:** Prefer [`entitlement_helpers.dart`](../../weebi_server/packages/fence_service/lib/src/entitlement_helpers.dart) names (`firmCreatorOperationalJoker`, `userHasActiveLicensedSeat`) alongside `LicenseSeatEntitlement` for clarity.
- **Dart packages (`users_weebi`):** [`firm_license_seat_utils`](../../weebi/packages/users/lib/src/firm_license_seat_utils.dart) exposes `firmCreatorOperationalJoker` (same meaning as server) and `userHasActiveLicensedSeat` for portal/access UI copy; seat checks stay strict—only messaging distinguishes the joker when `isFirmCreator` and there is no seat.

Future firm-level entitlements (e.g. metered analytics) should be documented here as a third category when introduced.
