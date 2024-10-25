# mongo running tests
## mongo macos
``` shell
$ sudo mongod --dbpath /System/Volumes/Data/data/db
```
then in another terminal to interact with mongodb, 
``` shell
mongosh
```

## mongo windows
```shell
mongosh
```

# running server
## macos
``` shell
cd packages/server
export MONGO_DB_URI=mongodb://localhost:27017/local
dart bin/main.dart
```

## windows
``` shell
$Env:MONGO_DB_URI="mongodb://localhost:27017/local"
dart bin/main.dart
```

The term 'KEY="hello"' is not recognized as the name of a cmdlet,

should print : Server running on ip InternetAddress('0.0.0.0', IPv4) port 8080

on the flutter app side, do not set 0.0.0.0 or local host but instead the IP of your machine
in windows : 
Select Start > Settings > Network & internet > Wi-Fi and then select the Wi-Fi network you're connected to
Under Properties, look for your IP address listed next to IPv4 address
ex : 192.168.43.250
use same port (8080)


# dummy data
// no longer used in unit test since mongodb handles _id
firmId = 665e12f798357783e8000000
chainId = 665e12f798357783e8000001
boutiqueId = 665e12f798357783e8000002
userId = chainId = 665e12f798357783e8000008


https://github.com/fullstorydev/grpcurl