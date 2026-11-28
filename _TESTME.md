# TEST the server locally

Note : on the flutter app side, do not set 0.0.0.0 or local host but instead the IP of your machine
in windows : 
Select Start > Settings > Network & internet > Wi-Fi and then select the Wi-Fi network you're connected to
Under Properties, look for your IP address listed next to IPv4 address
ex : 192.168.43.250
use same port (8080)

https://github.com/fullstorydev/grpcurl

## windows 
### windows mongo
`mongosh`
### windows server

``` shell
cd apps/server
$Env:MONGO_DB_URI="mongodb://localhost:27017/local"
dart bin/server.dart
```

***

## macos
### macos mongo

``` shell
sudo mongod --dbpath /System/Volumes/Data/data/db
```
### macos running server

``` shell
cd apps/server
export MONGO_DB_URI=mongodb://localhost:27017/local
dart bin/server.dart
```

***

## dev — contract & multi-actor journey E2E (~3s)

Runs both **Envoy gRPC-Web BFF** (`weebi-envoyproxy-dev`, CORS, `Set-Cookie`, `x-session-id`, zero-JWT-leak audit) and **native gRPC** (`dev.weebi.com:443`, PoS pairing) in one pass:

``` shell
melos run test:dev
# or directly:
cd apps/server
dart test test_e2e --reporter expanded
```

Override targets via env vars (`WEEBI_GRPC_HOST`, `WEEBI_GRPC_PORT`, `WEEBI_GRPC_INSECURE=true`, `WEEBI_ENVOY_URL`) to run the same suite against local server + local Envoy.


