# Freemium full-dump throttle

Caps **full collection downloads** for users without an active license seat.
Incremental sync, portal paging, auth, and billing stay unlimited.

Orthogonal to [`LICENSE_CHECK_ENFORCED`](entitlements.md): that flag hard-blocks
ticket/article/contact/stats. This throttle meters freemium dumps while that
flag stays off.

## When it is on

**Off by default.** The gate runs only when **both** are true:

| Variable | Required in prod |
|----------|------------------|
| `ENV=PRD` | yes |
| `FREEMIUM_THROTTLE_ENFORCED=true` | yes |

Local, CI, staging, and any non-`PRD` `ENV` stay **off**, even if
`FREEMIUM_THROTTLE_ENFORCED` is copied into the env.

| Variable | Default | Meaning |
|----------|---------|---------|
| `FREEMIUM_FULL_DUMP_PERIOD_DAYS` | `1` | UTC period length. Set `7` later for weekly. |

Unit tests: `AppEnvironment.debugFreemiumThrottleOverride`.

Cloud Run (production) checklist:

```text
ENV=PRD
FREEMIUM_THROTTLE_ENFORCED=true
FREEMIUM_FULL_DUMP_PERIOD_DAYS=1
```

## Who is freemium

- **Throttled:** authenticated user with **no active license seat** (firm creator
  without a seat included — the operational joker is not a licence).
- **Not throttled:** active seat; service-account JWT.

Quota key: **`userId` + collection** (`ticket` / `article` / `contact` /
`article_photo`). One dump burns the period for all chains, boutiques, and
devices of that user.

## What counts as a full dump

| RPC | Full dump (quota) | Not a dump |
|-----|-------------------|------------|
| `TicketService.readAll` | `limit == 0` **and** empty `lastFetchTimestampUTC` | `limit > 0` (portal); lastFetch set (incremental) |
| `ArticleService.readAll` | same | same |
| `ContactService.readAll` | same | same |
| `ArticleService.readAllPhotos` | empty lastFetch **and** `offset == 0` | lastFetch set; later pages (`offset > 0`) |

Storage: Mongo collection `freemium_full_dump_quota`, unique index
`(userId, resource, periodStartUtc)`. Atomic insert; duplicate key → quota
exceeded. A failed query after consume still spends the token (abuse-safe).

## Client error contract (stable API)

gRPC status: **`RESOURCE_EXHAUSTED`**

Message **starts with** token `FREEMIUM_FULL_DUMP_QUOTA_EXCEEDED`, then
order-stable fields:

```text
FREEMIUM_FULL_DUMP_QUOTA_EXCEEDED resource=ticket periodDays=1 retryAfterUtc=2026-09-10T00:00:00.000Z
```

Changing the token or field names is a **breaking** client change.

Shared Dart parser: `FreemiumDumpQuotaError.tryParse` in `entitlements_weebi`.
Webapp: client interceptor + binding (subscribe). weebi_app: parse on sync/pull
errors and show retry copy using `retryAfterUtc`.

## Weekly later

Set `FREEMIUM_FULL_DUMP_PERIOD_DAYS=7` in production env only — no code change.

## Code

- Gate: `packages/fence_service/lib/src/freemium_dump_quota.dart`
- Call sites: `ticket_service` / `article_service` / `contact_service` `readAll`
  (+ `readAllPhotos`)
