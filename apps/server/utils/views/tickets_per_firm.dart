import 'package:ticket_service/ticket_service.dart';

import 'view_definition.dart';

/// View: tickets_per_firm
/// Counts tickets per firm.
const ViewDefinition ticketsPerFirmView = ViewDefinition(
  name: 'tickets_per_firm',
  source: TicketService.collectionName,
  pipeline: [
    {
      '\$group': {
        '_id': '\$firmId',
        'ticketCount': {'\$sum': 1}
      }
    },
    {
      '\$sort': {'ticketCount': -1}
    },
    {
      '\$lookup': {
        'from': 'firm',
        'localField': '_id',
        'foreignField': 'firmId',
        'as': 'firmDetails'
      }
    },
    {'\$unwind': '\$firmDetails'},
    {
      '\$project': {
        '_id': 0,
        'firmId': '\$firmId',
        'ticketCount': 1,
        'firmName': '\$firmDetails.name'
      }
    }
  ],
);
