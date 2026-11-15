db.firm.updateOne(
    { firmId: "17..." },
    {
      $push: {
        accountingYearPurchases: {
          year: NumberInt(2023),
          paidAtUTC: "2026-11-13T00:00:00.000Z",
          amountCents: NumberInt(0),
          currency: "xof",
          stripeCheckoutSessionId: "complimentary_2023",
          paymentProvider: "complimentary",
          legalTermsVersionDate: "2026-07-27"
        }
      }
    }
  )
  