import 'package:article_service/article_service.dart';
import 'package:contact_service/contact_service.dart';
import 'package:fence_service/mongo_dart.dart';

import 'package:ticket_service/ticket_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/mongo_local_testing.dart';

/* For compound indexes, this rule of thumb is helpful in deciding the order of fields in the index:

    First, add those fields against which Equality queries are run.
    The next fields to be indexed should reflect the Sort order of the query.
    The last fields represent the Range of data to be accessed.

    o determine whether a query is a covered query, use the explain() method. If the explain() output displays totalDocsExamined as 0, this shows the query is covered by an index.

  - consider partial filtering where relevant, for example : 
db.restaurants.createIndex(
   { cuisine: 1, name: 1 },
   { partialFilterExpression: { rating: { $gt: 5 } } }
)

1 == ascending
-1 == descending


TODO: also include search index
[
  {
    $search: {
      index: "title",
      text: {
        query: "string",
        path: "string"
      }
    }
  }
]

 */
main() async {
  final db = await Db.create(TestHelper.local);
  final isOpened = await db.open();
  print(isOpened);

  await db.createCollection(FenceService.firmCollectionName);
  await db.createCollection(FenceService.userCollectionName);
  await db.createCollection(FenceService.boutiqueCollectionName);

  await db.createCollection(ArticleService.collectionArticleName);
  await db.createCollection(ArticleService.collectionPhotoName);
  await db.createCollection(ArticleService.collectionCategoryName);

  await db.createCollection(ContactService.collectionName);

  await db.createCollection(TicketService.collectionName);

  // firm
  final d = await db.ensureIndex(FenceService.firmCollectionName,
      name: 'firmId', keys: {'firmId': 1});
  print(d);
  await db.ensureIndex(FenceService.firmCollectionName,
      name: 'name', keys: {'name': -1});

  //user
  await db.ensureIndex(FenceService.userCollectionName,
      name: 'firmId_userId', keys: {'firmId': 1, 'userId': 1});
  await db.ensureIndex(FenceService.userCollectionName,
      name: 'mail', keys: {'firmId': 1, 'mail': -1});

  // boutique
  await db.ensureIndex(FenceService.boutiqueCollectionName,
      name: 'firmId_boutiqueId_boutique.name',
      keys: {'firmId': 1, 'boutiqueId': 1, 'name': -1});

  /// ARTICLE INDEXES

  // basic
  await db.ensureIndex(ArticleService.collectionArticleName,
      name: 'firmId_chainId_calibreId_creationDate',
      keys: {'firmId': 1, 'chainId': 1, 'calibreId': 1, 'creationDate': -1});

  // apps resync
  await db.ensureIndex(ArticleService.collectionArticleName,
      name: 'lastTouchTimestampUTC_userId',
      keys: {'lastTouchTimestampUTC': -1, 'userId': 1});

  // apps search
  await db.ensureIndex(ArticleService.collectionArticleName,
      name: 'title', keys: {'calibre.title': -1});

  ///
  /// ARTICLE_PHOTO INDEXES
  ///
  /// basic
  await db.ensureIndex(ArticleService.collectionPhotoName,
      name: 'firmId_chainId_calibreId',
      keys: {'firmId': 1, 'chainId': 1, 'calibreId': -1});

  // apps resync
  await db.ensureIndex(ArticleService.collectionPhotoName,
      name: 'lastTouchTimestampUTC_userId',
      keys: {'lastTouchTimestampUTC': -1, 'userId': 1});

  /// (ARTICLE) CATEGORY INDEXES
  /// basic
  await db.ensureIndex(ArticleService.collectionCategoryName,
      name: 'firmId_chainId_title',
      keys: {'firmId': 1, 'chainId': 1, 'title': -1});

  // apps resync
  await db.ensureIndex(ArticleService.collectionCategoryName,
      name: 'lastTouchTimestampUTC_userId',
      keys: {'lastTouchTimestampUTC': -1, 'userId': 1});

  ///
  /// CONTACT INDEXES
  ///

  /// basic
  await db.ensureIndex(ContactService.collectionName,
      name: 'firmId_chainId_contactId_creationDate',
      keys: {'firmId': 1, 'chainId': 1, 'contactId': 1, 'creationDate': -1});

  /// for apps resync
  await db.ensureIndex(ContactService.collectionName,
      name: 'lastTouchTimestampUTC_userId',
      keys: {'lastTouchTimestampUTC': -1, 'userId': 1});

  /// for search
  await db.ensureIndex(ContactService.collectionName,
      name: 'lastName_firstName_phone.number_mail',
      keys: {
        'contact.lastName': -1,
        'contact.firstName': -1,
        'contact.phone.number': 1,
        'contact.mail': 1,
      });

  // TODO : index contact.address when relevant

  ///
  /// TICKET INDEXES
  ///

  /// basic
  await db.ensureIndex(TicketService.collectionName,
      name: 'firmId_chainId_boutiqueId_isDeleted_nonUniqueId_contactId_isDeleted_creationDate',
      keys: {
        'firmId': 1,
        'chainId': 1,
        'boutiqueId': 1,
        'nonUniqueId': 1,
        'contactId': 1,
        'isDeleted': 1,
        'creationDate': -1
      });

  /// for apps resync
  await db.ensureIndex(TicketService.collectionName,
      name: 'lastTouchTimestampUTC_userId',
      keys: {'lastTouchTimestampUTC': -1, 'userId': 1});

  /// for search
  // need more perf tests to see if we can include article.title/designation
  // since it implies indexing items
  await db.ensureIndex(TicketService.collectionName,
      name: 'date_status_contactId_ticketType_PaymentType',
      keys: {
        'boutiqueId': 1,
        'ticket.date': -1,
        'ticket.status': 1,
        'ticket.contactId': 1,
        'ticket.ticket_type': 1,
        'ticket.payment_type': 1
      });

  return;
}
