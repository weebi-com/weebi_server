[
  {
    $unwind: "$boutiques"
  },
  {
    $project: {
      firmId: 1,
      boutiquePhone: {
        $concat: [
          "+",
          {
            $toString:
              "$boutiques.boutique.phone.countryCode"
          },
          " ",
          "$boutiques.boutique.phone.number"
        ]
      },
      boutiqueAddress: {
        $concat: [
          "$boutiques.boutique.addressFull.street",
          " - ",
          "$boutiques.boutique.addressFull.city",
          " - ",
          "$boutiques.boutique.addressFull.country.code2Letters"
        ]
      }
    }
  },
  {
    $lookup: {
      from: "user",
      localField: "firmId",
      foreignField: "firmId",
      as: "user_info"
    }
  },
  {
    $unwind: "$user_info"
  },
  {
    $project: {
      userName: {
        $concat: [
          "$user_info.firstname",
          " ",
          "$user_info.lastname"
        ]
      },
      userMail: "$user_info.mail",
      userId: "$user_info.userId",
      userFirmId: "$user_info.firmId",
      boutiquePhone: 1,
      boutiqueAddress: 1
    }
  }
]