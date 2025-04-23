# changelog

## 1.0.11+1 - 2025 april 23rd

- export GeneratedMessage and PbList to use protobuf built-in reflection capabilities

## 1.0.10+3 - 2025 march 21th

- int64 category.color
- int64 contact.overdraft
- contactId in TicketMongo
- split readAll and readIds to avoid 
- breaking change : use ReadReaquest instead of Find for coherence

## 1.0.10 - 2025 march 17th

- ticket.readAll isDeleted param

## 1.0.9+12 - 2025 march 7th

- delete Tickets - softDelete only 
- delete Article & Delete Contacts - hard Delete 
- IsADeviceInChain

## 1.0.9+10 - 2025/02/26

- include enum extension in article photo
- include enum logo extension in boutique and boutiqueResponse
- fence_service_base new method isOneDeviceInChain

## 1.0.9+6 - 2025/01/26

- provide a way to compare a list of pairs of proto objects to help reconciliation in app

## 1.0.9+4 - 2025/01/17

- ticket.proto added contactInfo on ticket 
- article_service.proto added calibreId in FindCalibreRequest
- export grpc web
- clearer chain services using ChainRequest 
- move ServiceCallTest out of protos to avoid errors on web

## 1.0.8 - 2025/01/14

- added in permission bool rights - canUpdateTicketContactInfo

## 1.0.7+5 - 2025/01/04

- added : contact.isClient & contact.isSupplier

## 1.0.7+4 - 2025/01/03

- ticket.creationDate added

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
