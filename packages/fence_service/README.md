# permissions

## explain standard user journey

1. The boss (company/entreprise/franchise) signs up throught the webapp
2. Authentifies, and get a Bearer token with firmCreation permission 
3. The boss creates a Firm
4. Authentifies again with refresh token to get lastest admin permissions on this firm
5. The boss creates a 2nd boutique
6. The boss setup/imports articles, contacts and past tickets if any
7. The boss creates users 

## explain chains

A chain is a group of boutiques
Boutiques in a chain share the same article catalog and contact directory
A boutique belongs to a single chain
Users who have permissions over two chains need two devices or will need to download articles and contacts every time
 _______                         _______  
| Chain1 |        _______        | Chain3|
| BTQ1   |       | Chain2|       |       |
| BTQ2   |       | BTQ4  |       |  XXX  |
| BTQ3   |       | BTQ5  |       |       |
_________        |_______|       _________


## explain devices

A device (e.g. android phone) is like a cash register
It needs to be assigned to a chain because it keeps in local storage :
articles, contacts and (most) tickets

login in and out of each chains would burn data uselessy redownloading the same things
manipulating the same device for different businesses is error prone

it can be used by each chain's boutiques


### Timestamps ?

DateTimes are used for flutter apps objects (article, boutique, contact, ticket)
Timestamps are not used on purpose for these objects :

- on retrieval the UTC value is converted back to the timezone in effect in the session
- Timestamp in dart != proto != mongo
- DateTime iso String are easier to read

But Timestamps are used for server objects such as user, chain etc
Watch out the class used is not the one in mongo but in protobuf 
import 'package:protos_weebi/protos_weebi_io.dart' show Timestamp
simply use extension .timestampProto ex : DateTime.now().timestampProto

Restrictions permissions = {'uniqueId' : 'pierrot', 'boutiqueId' : 1, 'permissions' : [] };

The upcoming use case is linking boutiques together in a Chain
With permissions set manually at first.

### jwt refresh explained
// client app
// if access token is expired
// use the refresh token on the route authentication/refresh
// and provide the refresh token (that was saved previously in secure_storage)
// server will reply with 1 access_token and 1 new refresh
// use the access_token to auth
// again save the refresh_token in secure_storage

### ObjectId vs ids

- I did not find a way to parse Mongo ObjectId using .mergeFromProto3Json()
- Which 
