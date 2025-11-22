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

A Chain is a group of boutiques
Boutiques in a chain share the same __article catalog__ and __contact directory__
A boutique belongs to a single chain
 _______                          
| Chain1 |        _______        
| BTQ1   |       | Chain2|       
|   Dev1 |       |       |       
| BTQ2   |       | BTQ4  |       
|   Dev2 |       |  Dev4 |
| BTQ3   |       | BTQ5  |       
|   Dev3 |       |  Dev5 |
|________|       |_______|       

User 'Lili', being the boss, can access Chain1 and Chain2 and their boutiques
To create tickets in a boutique she can either : 
    - Log into a boutique's device (i.e. being physically in the boutique)
    - Log in the web app and select the chain and the boutique

User 'Michael' is Chain1's manager
He has permissions over BTQ1, BTQ2 and BTQ3, but not in Boutique4 nor Boutique5
Like Lili he can create tickets by login to a boutique's device, e.g. go to boutique1 and use device1
Or using weebi_web

## explain devices

A device (e.g. android phone) is like a cash register
It needs to be assigned to a chain __and__ a boutique

Why such constraints ?

First, manipulating the same device for different businesses is very error prone,
switching boutiques is also error prone

The device (weebi_app) keeps in local storage : articles, contacts and the boutique's tickets
login in and out of each chains would burn data uselessy redownloading the same things

What about the boutique constraint ?
1 device == 1 boutique limits edge use cases for the weebi_app
The PoS app is designed to be used in a single boutique, 
Changing this behaviour would require rewriting logic around ticket creation
This constraint also brings more ticket traceability (1 ticket == 1 device)

If the manager / the boss need to create tickets from different boutiques, chains
They will be able to do it from the web_app, which is designed to handle multiple chains and boutiques

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

- Since mongodb does not create _id for nested objects we still need to create ids manually
- making the case for a simple handmade id, i.e. milliseconds since epoch saved as a string
- Also I did not find a simple way to parse Mongo ObjectId using .mergeFromProto3Json()
- Which incentivized me to use my own id based for objects such as firm and user 

### mongodb mongodart
stange error message on update "getLastError"
getLastError command has been deprecated in MongoDB and is no longer supported. (as of MongoDB 4.4)
ignore


MONGO_DB_URI
JWT_SECRET_KEY
WEEBI_EXPRESS_BASE_URL