[
    {
      "$lookup": {
        "from": "user_copy",
        "let": { "mail": "$mail" },
        "pipeline": [
          {
            "$match": {
              "$expr": { "$eq": ["$mail", "$$mail"] }
            }
          }
        ],
        "as": "user_copy"
      }
    },
    {
      "$match": {
        "user.0": { "$exists": true }
      }
    },
    {
      "$unwind": "$user"
    },
    {
      "$project": {
        "_id": "$user._id",
        "subscriberId": "$subscriberId"
      }
    },
    {
      "$merge": {
        "into": "user_copy",
        "on": "_id",
        "whenMatched": [
          {
            "$set": {
              "subscriberId": "$$new.subscriberId"
            }
          }
        ],
        "whenNotMatched": "discard"
      }
    }
  ]