# evaluation_service

gRPC lead capture for BoutiqueScore (Turso SQL-over-HTTP). Scoring stays client-side.

## Run unit tests

```shell
cd packages/evaluation_service
dart pub get
dart test
```

Uses a mocked Turso `/v2/pipeline` client — no credentials required.

## Deploy new env vars (Cloud Run / prod)

| Variable             | Required | Purpose                                    |
| -------------------- | -------- | ------------------------------------------ |
| `TURSO_DATABASE_URL` | for persist | Turso DB URL (`libsql://…` or `https://…`; converted to HTTPS) |
| `TURSO_AUTH_TOKEN`   | for persist | Bearer token for Turso HTTP pipeline       |

The gRPC process boots without these; `SubmitEvaluation` then returns `UNAVAILABLE` until they are set.

JS encode round-trip (`test/grpc_web_js_encode_roundtrip_test.dart`) uses `tool/encode_sample_request.mjs` in this package (CI). A sibling `boutiquescore` checkout is preferred when present.

### BoutiqueScore HTML → Envoy

- Browser calls Envoy with **gRPC-Web** (`application/grpc-web+proto`) — see `boutiquescore/site/grpc_web_submit.mjs`.
- `SubmitEvaluation` is a **public** RPC (auth interceptor allowlist) — no JWT, no `x-api-key` from the browser.
- Existing Envoy `prefix: "/weebi."` route already forwards this path; no Envoy change required.
- Spam controls (rate limit / captcha) can come later if needed.

### Local server

```shell
$env:TURSO_DATABASE_URL="libsql://your-db.turso.io"
$env:TURSO_AUTH_TOKEN="..."
$env:ENVOY_API_KEY="local-dev-key"   # still required for getSessionInternal / AppEnvironment
$env:MONGO_DB_URI="mongodb://localhost:27017/local"
$env:JWT_SECRET_KEY="test-secret"
# …other existing vars as needed
dart run apps/server/bin/server_local.dart
```
