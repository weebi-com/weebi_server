import 'package:article_service/article_service.dart';
import 'package:contact_service/contact_service.dart';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:ticket_service/ticket_service.dart';
import 'package:fence_service/fence_service.dart';
import 'package:fence_service/user_testing.dart';

main() async {
  final db = TestHelper.localDb;
  final connection = Connection(ConnectionManager(db));
  await db.open();
  final isConnected = await connection.connect();
  print(isConnected);

  // TODO ? check if need to create index for _id
  // and if better to have specific indexes

  // TODO check meaning of
  // unique index
  // sparse index
  await db.createCollection(FenceService.userCollectionName);
  await db.createCollection(ArticleService.collectionName);
  await db.createCollection(ContactService.collectionName);
  await db.createCollection(TicketService.collectionName);

  var dd = await db.ensureIndex(FenceService.boutiqueCollectionName,
      name: 'firm_objectIdEtc', keys: {'_id': 1, 'firmId': 1, 'name': 1});
  print(dd);
  dd = await db.ensureIndex(FenceService.userCollectionName,
      name: 'user_objectIdEtc', keys: {'_id': 1, 'userId': 1, 'mail': 1});
  print(dd);
  dd = await db.ensureIndex(ArticleService.collectionName,
      name: 'article_calibreId', keys: {'calibreId': 1});
  print(dd);
  dd = await db.ensureIndex(ArticleService.collectionName,
      name: 'article_chainId', keys: {'chainId': 1});
  print(dd);
  dd = await db.ensureIndex(ContactService.collectionName,
      name: 'contact_contactId', keys: {'contactId': 1, 'userId': 1});
  print(dd);
  dd = await db.ensureIndex(ContactService.collectionName,
      name: 'contact_chainId', keys: {'chainId': 1});
  print(dd);
  dd = await db.ensureIndex(TicketService.collectionName,
      name: 'ticket_ticketId', keys: {'ticketId': 1, 'userId': 1});
  print(dd);
  dd = await db.ensureIndex(TicketService.collectionName,
      name: 'ticket_boutiqueId', keys: {'boutiqueId': 1});
  print(dd);
  dd = await db.ensureIndex(TicketService.collectionName,
      name: 'ticket_chainId', keys: {'chainId': 1});
  print(dd);
  return;
}
