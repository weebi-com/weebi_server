# mongo running tests
## mongo macos
$ sudo mongod --dbpath /System/Volumes/Data/data/db

if need to interact with mondb, then in another terminal
$ mongosh

## mongo windows
$ mongosh

# running server
$ cd packages/server
$ dart bin/main.dart
should print : Server running on ip InternetAddress('0.0.0.0', IPv4) port 8080

on the flutter app side, do not set 0.0.0.0 or local host but instead the IP of your machine
in windows : 
Select Start > Settings > Network & internet > Wi-Fi and then select the Wi-Fi network you're connected to
Under Properties, look for your IP address listed next to IPv4 address
ex : 192.168.43.250
use same port (8080)


# dummy data
// no longer used in unit test since mongodb handles _id
firmOid = 665e12f798357783e8000000
chainOid = 665e12f798357783e8000001
boutiqueOid = 665e12f798357783e8000002
userOid = chainOid = 665e12f798357783e8000008


https://github.com/fullstorydev/grpcurl