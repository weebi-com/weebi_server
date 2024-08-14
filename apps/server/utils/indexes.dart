import 'package:article_service/article_service.dart';
import 'package:contact_service/contact_service.dart';
import 'package:boutique_service/boutique_service.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:ticket_service/ticket_service.dart';
import 'package:user_service/user_service.dart';
import 'package:user_service/user_testing.dart';

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
  await db.createCollection(BoutiqueService.collectionName);
  await db.createCollection(UserService.collectionName);
  await db.createCollection(ArticleService.collectionName);
  await db.createCollection(ContactService.collectionName);
  await db.createCollection(TicketService.collectionName);

  var dd = await db.ensureIndex(BoutiqueService.collectionName,
      name: 'firm_objectIdEtc', keys: {'_id': 1, 'oid': 1, 'name': 1});
  print(dd);
  dd = await db.ensureIndex(UserService.collectionName,
      name: 'user_objectIdEtc', keys: {'_id': 1, 'oid': 1, 'mail': 1});
  print(dd);
  dd = await db.ensureIndex(ArticleService.collectionName,
      name: 'article_calibreId', keys: {'calibreId': 1});
  print(dd);
  dd = await db.ensureIndex(ArticleService.collectionName,
      name: 'article_chainOid', keys: {'chainOid': 1});
  print(dd);
  dd = await db.ensureIndex(ContactService.collectionName,
      name: 'contact_contactId', keys: {'contactId': 1});
  print(dd);
  dd = await db.ensureIndex(ContactService.collectionName,
      name: 'contact_chainOid', keys: {'chainOid': 1});
  print(dd);
  dd = await db.ensureIndex(TicketService.collectionName,
      name: 'ticket_ticketId', keys: {'ticketId': 1});
  print(dd);
  dd = await db.ensureIndex(TicketService.collectionName,
      name: 'ticket_boutiqueOid', keys: {'boutiqueOid': 1});
  print(dd);
  dd = await db.ensureIndex(TicketService.collectionName,
      name: 'ticket_chainOid', keys: {'chainOid': 1});
  print(dd);
  return;
}
