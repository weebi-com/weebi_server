import 'package:protos_weebi/protos_weebi_io.dart' hide FinancialChartMetric, ChartTimePeriod;

List<Map<String, dynamic>> demoTicketDocuments({
  required String firmId,
  required DateTime anchor,
}) {
  final boutiqueA = 'boutique-a';
  final boutiqueB = 'boutique-b';

  final specs = <_DemoTicket>[
    _DemoTicket(
      boutiqueId: boutiqueA,
      dayOffset: 0,
      ticket: _sellRetail(anchor: anchor, dayOffset: 0, price: 100, qty: 2, taxPercent: 20),
    ),
    _DemoTicket(
      boutiqueId: boutiqueA,
      dayOffset: 1,
      ticket: TicketPb(
        ticketType: TicketTypePb.sellCovered,
        received: 250,
        status: true,
        date: _dateAt(anchor, 1),
        creationDate: _dateAt(anchor, 1),
        statusUpdateDate: _dateAt(anchor, 1),
      ),
    ),
    _DemoTicket(
      boutiqueId: boutiqueA,
      dayOffset: 2,
      ticket: _sellRetail(anchor: anchor, dayOffset: 2, price: 80, qty: 1, taxPercent: 10),
    ),
    _DemoTicket(
      boutiqueId: boutiqueB,
      dayOffset: 0,
      ticket: _sellRetail(anchor: anchor, dayOffset: 0, price: 50, qty: 3),
    ),
    _DemoTicket(
      boutiqueId: boutiqueB,
      dayOffset: 1,
      ticket: TicketPb(
        ticketType: TicketTypePb.sellDeferred,
        received: 0,
        status: true,
        date: _dateAt(anchor, 1),
        creationDate: _dateAt(anchor, 1),
        statusUpdateDate: _dateAt(anchor, 1),
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(price: 120),
            quantity: 1,
          ),
        ],
      ),
    ),
    _DemoTicket(
      boutiqueId: boutiqueB,
      dayOffset: 2,
      ticket: _spendRetail(anchor: anchor, dayOffset: 2, cost: 40, qty: 2, taxPercent: 5),
    ),
    _DemoTicket(
      boutiqueId: boutiqueB,
      dayOffset: 3,
      ticket: TicketPb(
        ticketType: TicketTypePb.spendCovered,
        received: 90,
        status: true,
        date: _dateAt(anchor, 3),
        creationDate: _dateAt(anchor, 3),
        statusUpdateDate: _dateAt(anchor, 3),
      ),
    ),
    _DemoTicket(
      boutiqueId: boutiqueA,
      dayOffset: 4,
      ticket: _spendRetail(anchor: anchor, dayOffset: 4, cost: 25, qty: 4),
    ),
    _DemoTicket(
      boutiqueId: boutiqueA,
      dayOffset: 5,
      ticket: TicketPb(
        ticketType: TicketTypePb.spendDeferred,
        received: 0,
        status: true,
        date: _dateAt(anchor, 5),
        creationDate: _dateAt(anchor, 5),
        statusUpdateDate: _dateAt(anchor, 5),
        items: [
          ItemCartPb(
            articleRetail: ArticleRetailOnTicketPb(cost: 15),
            quantity: 2,
          ),
        ],
      ),
    ),
  ];

  return [
    for (var i = 0; i < specs.length; i++)
      _toMongoDocument(
        firmId: firmId,
        nonUniqueId: 1000 + i,
        demo: specs[i],
      ),
  ];
}

class _DemoTicket {
  final String boutiqueId;
  final int dayOffset;
  final TicketPb ticket;

  const _DemoTicket({
    required this.boutiqueId,
    required this.dayOffset,
    required this.ticket,
  });
}

String _dateAt(DateTime anchor, int dayOffset) {
  return anchor.subtract(Duration(days: dayOffset)).toIso8601String();
}

TicketPb _sellRetail({
  required DateTime anchor,
  required int dayOffset,
  required double price,
  required double qty,
  double taxPercent = 0,
}) {
  final date = _dateAt(anchor, dayOffset);
  return TicketPb(
    ticketType: TicketTypePb.sell,
    status: true,
    date: date,
    creationDate: date,
    statusUpdateDate: date,
    taxe: TaxPb(percentage: taxPercent),
    items: [
      ItemCartPb(
        articleRetail: ArticleRetailOnTicketPb(price: price),
        quantity: qty,
      ),
    ],
  );
}

TicketPb _spendRetail({
  required DateTime anchor,
  required int dayOffset,
  required double cost,
  required double qty,
  double taxPercent = 0,
}) {
  final date = _dateAt(anchor, dayOffset);
  return TicketPb(
    ticketType: TicketTypePb.spend,
    status: true,
    date: date,
    creationDate: date,
    statusUpdateDate: date,
    taxe: TaxPb(percentage: taxPercent),
    items: [
      ItemCartPb(
        articleRetail: ArticleRetailOnTicketPb(cost: cost),
        quantity: qty,
      ),
    ],
  );
}

Map<String, dynamic> _toMongoDocument({
  required String firmId,
  required int nonUniqueId,
  required _DemoTicket demo,
}) {
  final ticketMongo = TicketMongo.create()
    ..firmId = firmId
    ..boutiqueId = demo.boutiqueId
    ..nonUniqueId = nonUniqueId
    ..creationDate = demo.ticket.date
    ..isDeleted = false
    ..ticket = demo.ticket;

  return ticketMongo.toProto3Json() as Map<String, dynamic>;
}
