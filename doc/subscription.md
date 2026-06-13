# Subscription & newsletter audience

Two separate concerns — do not conflate them:

| Concern | Owner | Stores |
|---------|-------|--------|
| **Account & newsletter audience** | `fence_service` + `weebi_express` | user + `subscriber.segmentation` |
| **License / billing** | `billing_service` (+ Stripe webhook via express) | `firm.licenses` |

Join key: **email**. Optional back-link: `user.subscriberId` → express subscriber `_id`.

Audience segments (lifecycle): `prospect` → `user` → `client`.

---

## 1. Account signup (newsletter only)

Self-registration in the app. No license involved.

```mermaid
flowchart LR
  App[weebi_app signUp] --> Fence[fence_service]
  Fence -->|POST send-confirmation| Express[weebi_express]
  Express --> Mail[verification email]
  Express --> Seg["segmentation: prospect"]
  Express -.->|new subscriber only| Link[updateSubscriberId]
  Link -.-> Fence
```

Triggered by `_sendConfirmationEmailAsync` in `signUp` (`fence_service_base.dart`). Requires `WEEBI_EXPRESS_BASE_URL`.

---

## 2. Email verification (newsletter + user flag)

User clicks the link in the confirmation email.

```mermaid
flowchart LR
  User[click verify link] --> Express[weebi_express verify]
  Express -->|gRPC markEmailVerified| Fence[fence_service]
  Express --> Seg["segmentation: user"]
```

---

## 3. License acquisition (billing only)

Stripe checkout. Writes the license; audience upgrade is a side effect in express, not in `billing_service`.

```mermaid
flowchart LR
  Stripe[Stripe webhook] --> Express[weebi_express]
  Express -->|gRPC fulfillLicenseFromStripe| Billing[billing_service]
  Billing --> Lic[firm.licenses]
  Express --> Seg["segmentation: client"]
```

Client redirect `fulfillFromStripeCheckoutSession` also creates the license but **does not** update segmentation — rely on the webhook above.

---

## fence_service → weebi_express (HTTP)

JWT via `WEEBI_EXPRESS_JWT_SECRET_KEY` / `AppEnvironment`.

| Trigger | Endpoint | Audience |
|---------|----------|----------|
| `signUp` | `POST /api/v1/emails/send-confirmation` | `prospect` |
| `requestPasswordReset` | `POST /api/v1/emails/send-password-reset` | — |

## Notes

- **`createPendingUser`**: no confirmation email yet — no automatic newsletter entry on invite alone.
- **`WEEBI_EXPRESS_BASE_URL` unset**: signup succeeds; email + `prospect` sync skipped (warning logged).

Refs: [`fence_service_base.dart`](../packages/fence_service/lib/src/fence_service_base.dart), [`weebi_express` README](../../weebi_express/README.md).
