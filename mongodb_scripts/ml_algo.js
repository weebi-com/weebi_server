
[
  {
    "$match": {
      "firmId": "xxxxxxxxxxx",
      "ticket.status": true,
      "ticket.items.articleRetail": { "$ne": {} },
      "$or": [
        { "ticket.ticketType": "sell" },
        { "ticket.ticketType": "sellDeferred" }
      ]
    }
  },
  {
    "$addFields": {
       "ticket.timestamp": { $toLong: { $dateFromString: { dateString: "$ticket.date" } } },
      "ticket.items": {
        "$map": {
          "input": "$ticket.items",
          "as": "item",
          "in": {
            "$mergeObjects": [
              "$$item",
              {
                "articleId": {
                  "$concat": [
                    { "$toString": "$$item.articleRetail.calibreId" },
                    { "$toString": "$$item.articleRetail.id" }
                  ]
                },
                "qt": {
                  "$multiply": [
                    "$$item.quantity",
                    "$$item.articleRetail.unitsInOnePiece"
                  ]
                }
              }
            ]
          }
        }
      }
    }
  },
  {
    "$unset": [
      "ticket.counterfoil",
      "ticket.taxe",
      "ticket.comment",
      "ticket.discountAmount",
      "ticket.promo",
       "ticket.date",
      "ticket.status",
      "ticket.statusUpdateDate",
      "ticket.received",
      "ticket.id",
      "ticket.creationDate",
      "ticket.paymentType",
      "ticket.ticketType",
      "ticket.items.quantity",
      "ticket.items.articleRetail",
      "ticket.items.articleBasket",
      "ticket.items.articleUncountable"
    ]
  },
  {
    "$project": {
      "_id": 0,
      "ticket": 1,
    }
  }
]

