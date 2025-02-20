import 'dart:io';

import 'package:protos_weebi/compare.dart';
import 'package:protos_weebi/data_dummy.dart';
import 'package:protos_weebi/protos_weebi_io.dart';

void main() {
  if (File('test/differences.html').existsSync()) {
    File('test/differences.html').deleteSync();
  }

  final articleCopy =
      ArticleRetailPb(calibreId: Dummy.calibre.id, id: 1, price: 20);
  final copy = CalibrePb(
      id: Dummy.calibre.id, title: 'test2', articlesRetail: [articleCopy]);

  final html =
      generateHtmlFromDifferences('article', [Pair(Dummy.calibre, copy)]);
  File('test/weebi_article_conflicts_${DateTime.now().millisecondsSinceEpoch}.html')
      .writeAsStringSync(html);
}
