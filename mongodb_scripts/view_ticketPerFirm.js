[
  {
    "$group": {
      "_id": "$firmId",
      "ticketCount": { "$sum": 1 }
    }
  },
  {
    "$sort": { "ticketCount": -1 }
  },
  {
    "$lookup": {
      "from": "firm",
      "localField": "_id",
      "foreignField": "firmId",
      "as": "firmDetails"
    }
  },
  {
    "$unwind": "$firmDetails"
  },
  {
    "$project": {
      "_id": 0,
      "firmId": "$_id",
      "ticketCount": 1,
      "firmName": "$firmDetails.name"
    }
  }
]