# CURLS
> install [grpcurl](https://github.com/fullstorydev/grpcurl)

## localhost - plaintext

_run the server_ : `dart apps/server/bin/server_local.dart`

``` shell
grpcurl -plaintext -import-path packages/protos/proto -proto packages/protos/proto/fence_service.proto localhost:8080 weebi.fence.service.FenceService/healthCheck
```

=> 
``` json
{
  "status": "healthy",
  "timestamp": "2025-10-21T20:48:11.984185",
  "versions": {
    "server": "1.0.3",
    "protos_weebi": "1.0.14",
    "fence_service": "1.0.1",
    "models_weebi": "1.1.14+1"
  },
  "databaseHealthy": true
}
```

cd packages/protos/proto/
grpcurl -plaintext -proto fence_service.proto -d '{\"mail\": \"test@test.test\", \"password\": \"mypassword\"}' localhost:8080 weebi.fence.service.FenceService/authenticateWithCredentials


## dev - TLS /S SSL 
grpcurl -import-path packages/protos/proto -proto packages/protos/proto/fence_service.proto dev.weebi.com:443 weebi.fence.service.FenceService/healthCheck

grpcurl -import-path packages/protos/proto -proto packages/protos/proto/fence_service.proto dev.weebi.com:443 describe weebi.fence.service.FenceService

## prd - TLS /S SSL 
grpcurl -import-path packages/protos/proto -proto packages/protos/proto/fence_service.proto prd.weebi.com:443 weebi.fence.service.FenceService/healthCheck