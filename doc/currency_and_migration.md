# Currency defaults and migration

## Platform default

- Server: [`AppEnvironment.platformDefaultCurrency`](packages/fence_service/lib/src/constants/app_environment.dart) reads `FIRMS_DEFAULT_CURRENCY` (ISO 4217, three letters). If unset, **`EUR`** is used.
- Existing firms or boutiques **without** stored currency resolve to this default in API consumers until documents are backfilled.

## Resolution order

Effective billing currency for a boutique:

1. `BoutiquePb.currency` (when set on the embedded boutique in Mongo)
2. `Chain.currency`
3. `Firm.defaultCurrency`
4. Platform default above

## Dual currency and tickets

- `Firm` / `Chain` may define `dual_currency_enabled` and `secondary_display_currency` (e.g. USD) for product policy; enforcement of licenses is not wired in code yet.
- Each ticket may store an optional FX **snapshot** set at sale time by the client:
  - `snapshot_secondary_currency`
  - `snapshot_local_per_secondary` — units of **local** currency for **one** unit of the secondary currency (e.g. `2800` means 1 USD = 2800 CDF).

The ticket service rejects inconsistent pairs (one field set without the other), non-positive rates, or invalid ISO codes.

## Mongo backfill (optional)

Legacy documents lack the new fields. To stamp defaults without waiting for the next firm update:

- **Firms**: set `defaultCurrency` to your chosen ISO code (e.g. `XOF`) where missing.
- **Chains** (`boutique` collection, chain document): set `currency` where missing.
- **Boutiques**: set `boutique.currency` inside each `boutiques[]` entry where missing.

Alternatively, leave documents unchanged; clients should fall back to the platform default when the proto field is absent.

## Protos

Source of truth lives in the `protos` repo (`firm.proto`, `btq_chain.proto`, `boutique.proto`, `ticket/ticket.proto`). Regenerate Dart with `packages/protos/protos_weebi/tool/generate_protos.ps1` (or `.sh`).
