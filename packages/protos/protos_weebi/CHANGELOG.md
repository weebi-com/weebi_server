## 1.0.7+3

- added logo in boutique and in BoutiqueRequest and in BoutiqueResponse
- breaking change on readBoutique

## 1.0.7+2

- removed authenticateWithDevice
- removed readUserPermissionsByToken

## 1.0.7+1

- addMany for article, contact, ticket
- handle photo for articles
- lastTouchTimestampUTC for lighter sync
- breaking change on articleService ArticleRequest->CalibreRequest for more coherence

## 1.0.6+3

- boutique also needs to be decomposed in BoutiquePb and BoutiqueMongo 

## 1.0.6+2

- keep categories within articleservice

## 1.0.6+1

- new offline permission: canUpdateContactBalanceOffline
- new object for article : categories

breaking change : 
- canSpendOutOfCatalog & canSelldOutOfCatalog

## 1.0.5

- createDevice

## 1.0.4

- ArticleUncounable make a stunning apparition
- canQuickSell is in the place !

## 1.0.3

- add creationDate to distinguish ids in article, contact, ticket
- bump versions

## 1.0.2

- add hardwareInfo

## 1.0.1

- complete device enrolment
- add client interceptors

## 1.0.0

- Initial version
