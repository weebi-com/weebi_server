# CALLME

install [grpcurl](https://github.com/fullstorydev/grpcurl)

`grpcurl -proto packages\protos\proto\weebi_app_service.proto dev.weebi.com:443 weebi.weebi_app.service.WeebiAppService/readAppMinimumVersion`

grpcurl -proto packages\protos\proto\weebi_app_service.proto 192.0.2.1:443 weebi.weebi_app.service.WeebiAppService/readAppMinimumVersion

grpcurl localhost:8787 list

# Using compiled protoset files
grpcurl -protoset my-protos.bin list

# Using proto sources
grpcurl -import-path ../protos -proto my-stuff.proto list