import 'package:article_service/article_service.dart';
import 'package:billing_service/billing_service.dart';
import 'package:contact_service/contact_service.dart';
import 'package:fence_service/mongo_dart.dart';

import 'package:ticket_service/ticket_service.dart';
import 'package:fence_service/fence_service.dart';

import 'views/all_views.dart';

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

/// This never run in the server,
/// to be run manually in the mongo shell
main() async {
  final db = await Db.create('mongodb+srv://username:password@xxx.yyy.mongodb.net/dbName');
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

  await db.createCollection(BillingService.billingProductsCollectionName);

  /// WEB_SESSIONS - for web app session storage (cookie-based auth via Envoy)
  /// TTL index: MongoDB automatically deletes expired sessions
  const webSessionsCollectionName = 'web_sessions';
  await db.createCollection(webSessionsCollectionName);
  await db.runCommand({
    'createIndexes': webSessionsCollectionName,
    'indexes': [
      {
        'key': {'expiresAt': 1},
        'name': 'expiresAt_ttl',
        'expireAfterSeconds': 0,
      },
    ],
  });

  // firm
  final d = await db.ensureIndex(FenceService.firmCollectionName,
      name: 'firmId', keys: {'firmId': 1});
  print(d);
  await db.ensureIndex(FenceService.firmCollectionName,
      name: 'name', keys: {'name': -1});
  await db.ensureIndex(FenceService.firmCollectionName,
      name: 'referralCode', keys: {'referralCode': 1}, sparse: true, unique: true);
  await db.ensureIndex(FenceService.firmCollectionName,
      name: 'licenses_licenseId', keys: {'licenses.licenseId': 1});

  // billing_products
  await db.ensureIndex(BillingService.billingProductsCollectionName,
      name: 'stripePriceId', keys: {'stripePriceId': 1});
  await db.ensureIndex(BillingService.billingProductsCollectionName,
      name: 'productId_isDeleted', keys: {'productId': 1, 'isDeleted': 1});

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
      name: 'lastName_firstName_phone_mail',
      keys: {
        'contact.lastName': -1,
        'contact.firstName': -1,
        'contact.phone.number': 1,
        'contact.mail': 1,
      });

  // TOConsider : index contact.address when relevant/needed

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

  /// VIEWS
  /// Create views if they don't exist. MongoDB's create returns success when
  /// view already exists with same definition (idempotent).
  for (final view in allViews) {
    await _ensureView(db, view.name, view.source, view.pipeline);
  }

  print('finished indexes and views');
  await db.close();
  return;
}

/// Creates a view if it doesn't exist. Idempotent: MongoDB returns success
/// when view already exists with same definition.
Future<void> _ensureView(Db db, String viewName, String sourceCollection,
    List<Map<String, dynamic>> pipeline) async {
  try {
    await db.runCommand({
      'create': viewName,
      'viewOn': sourceCollection,
      'pipeline': pipeline,
    });
    print('View $viewName created or already exists');
  } catch (e) {
    // If view exists with different definition, MongoDB throws. Re-throw so
    // user can manually drop the view and re-run.
    print('Failed to ensure view $viewName: $e');
    rethrow;
  }
}
