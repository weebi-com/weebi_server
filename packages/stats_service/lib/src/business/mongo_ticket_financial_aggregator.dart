import 'package:mongo_dart/mongo_dart.dart';

import 'chart_time_period.dart';
import 'financial_chart_metric.dart';
import 'financial_chart_query.dart';
import 'ticket_financial_aggregator.dart';

class MongoTicketFinancialAggregator {
  static const String collectionName = 'ticket';

  const MongoTicketFinancialAggregator();

  Future<List<FinancialBucketRow>> aggregate(
    Db db,
    FinancialChartQuery query,
  ) async {
    final collection = db.collection(collectionName);
    final selector = _selectorFor(query);
    final documents = await collection.find(selector).toList();
    // print('Found ${documents.length} documents for query');
    return aggregateTicketDocuments(
      documents: documents.cast<Map<String, dynamic>>(),
      query: query,
    );
  }

  Future<List<FinancialStackedBucketRow>> aggregateStackedByBoutique(
    Db db,
    FinancialChartQuery query,
  ) async {
    final collection = db.collection(collectionName);
    final selector = _selectorFor(query);
    final documents = await collection.find(selector).toList();
    // print('Found ${documents.length} documents for stacked query');
    return aggregateTicketDocumentsStackedByBoutique(
      documents: documents.cast<Map<String, dynamic>>(),
      query: query,
    );
  }

  SelectorBuilder _selectorFor(FinancialChartQuery query) {
    final selector = where
        .eq('firmId', query.firmId)
        .oneFrom('boutiqueId', query.boutiqueIds)
        .and(where.eq('isDeleted', false).or(where.eq('isDeleted', null)))
        // We broaden the range by 1 day to account for potential timezone differences in string comparison
        // The in-memory aggregator will filter exactly.
        .gte('ticket.date',
            query.start.subtract(const Duration(days: 1)).toIso8601String())
        .lte('ticket.date',
            query.end.add(const Duration(days: 1)).toIso8601String());
    
    // print('Query selector: ${selector.map}');
    return selector;
  }
}

List<Map<String, dynamic>> buildMongoAggregationPipeline(
  FinancialChartQuery query,
) {
  final ticketTypes = query.metric.ticketTypeNames;
  final dateUnit = query.timePeriod.mongoDateTruncUnit;

  return [
    {
      r'$match': {
        'firmId': query.firmId,
        'boutiqueId': {r'$in': query.boutiqueIds},
        'isDeleted': false,
        'ticket.status': true,
        'ticket.date': {
          r'$gte':
              query.start.subtract(const Duration(days: 1)).toIso8601String(),
          r'$lte': query.end.add(const Duration(days: 1)).toIso8601String(),
        },
        'ticket.ticketType': {r'$in': ticketTypes},
      },
    },
    {
      r'$addFields': {
        'period': {
          r'$dateTrunc': {
            'date': {r'$toDate': r'$ticket.date'},
            'unit': dateUnit,
          },
        },
        'amount': {
          r'$switch': {
            'branches': [
              {
                'case': {
                  r'$in': [
                    r'$ticket.ticketType',
                    ['sell', 'sellDeferred'],
                  ],
                },
                'then': {
                  r'$ifNull': [
                    r'$ticket.sellTotals.markdownsAndTaxIncluded',
                    0,
                  ],
                },
              },
              {
                'case': {
                  r'$in': [
                    r'$ticket.ticketType',
                    ['spend', 'spendDeferred'],
                  ],
                },
                'then': {
                  r'$ifNull': [
                    r'$ticket.spendTotals.markdownsAndTaxIncluded',
                    0,
                  ],
                },
              },
              {
                'case': {
                  r'$in': [
                    r'$ticket.ticketType',
                    ['sellCovered', 'spendCovered'],
                  ],
                },
                'then': {r'$ifNull': [r'$ticket.received', 0]},
              },
            ],
            'default': 0,
          },
        },
      },
    },
    {
      r'$group': {
        '_id': r'$period',
        'value': {r'$sum': r'$amount'},
      },
    },
    {
      r'$sort': {'_id': 1},
    },
  ];
}

Future<List<FinancialBucketRow>> aggregateWithMongoPipeline(
  Db db,
  FinancialChartQuery query,
) async {
  final collection = db.collection(MongoTicketFinancialAggregator.collectionName);
  final pipeline = buildMongoAggregationPipeline(query)
      .cast<Map<String, Object>>();
  final cursor = collection.aggregateToStream(pipeline);
  final rows = <FinancialBucketRow>[];

  await for (final document in cursor) {
    final id = document['_id'];
    if (id is! DateTime) {
      continue;
    }
    final value = document['value'];
    rows.add(
      FinancialBucketRow(
        period: id,
        value: value is num ? value.toDouble() : 0,
      ),
    );
  }

  return rows;
}
