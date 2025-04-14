[
  {
    $sort: {
      creationDate: 1,
      lastTouchTimestampUTC: -1
    }
  },
  {
    $group: {
      _id: "$creationDate",
      latestDocument: {
        $first: "$$ROOT"
      }
    }
  },
  {
    $replaceRoot: {
      newRoot: "$latestDocument"
    }
  }
]