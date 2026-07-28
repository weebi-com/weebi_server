[
  {
    $lookup: {
      from: "boutique",
      localField: "chainId",
      foreignField: "chainId",
      as: "chainInfo"
    }
  },
  {
    $unwind: "$chainInfo"
  },
  {
    $project: {
      chainId: 1,
      chainName: "$chainInfo.name",
      userId: 1,
      contactId: 1,
      //      firmId: 1,
      lastTouchTimestampUTC: 1,
      contact_firstName: "$contact.firstName",
      contact_lastName: "$contact.lastName",
      contact_mail: "$contact.mail",
      contactPhone: {
        $concat: [
          "+",
          {
            $toString:
              "$contact.phone.countryCode"
          },
          " ",
          "$contact.phone.number"
        ]
      },
      contactAddress: {
        $concat: [
          "$contact.addressFull.street",
          " - ",
          "$contact.addressFull.city",
          " - ",
          "$contact.addressFull.country.code2Letters"
        ]
      }
    }
  }
]