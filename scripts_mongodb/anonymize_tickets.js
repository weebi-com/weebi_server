[
  {
    
        "$match": {
              "firmId": "xxxxx"
      },
  },{
    $set: {
      "ticket.items.articleRetail.designation":
        "random_string",
      "ticket.contactId": 0,
      "firmId": '0',
      "chainId": '0',
      "boutiqueId": '0',
      "userId": '0',
      "deviceId" : '0'
    }
  }
]