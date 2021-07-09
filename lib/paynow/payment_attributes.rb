module Paynow
  class PaymentAttributes
    REQUISITE = [
      :amount,
      :reference,
      :method
    ]

    OPTIONAL = [
      :additionalinfo,
      :authemail,
      :tokenize
    ]

    CARD = [
      :cardnumber,
      :cardname,
      :cardcvv,
      :cardexpiry,
      :billingline1,
      :billingcity,
      :billingcountry,
      :token,
      :authemail
    ]

    OPTIONAL_CARD = [
      :billingline2,
      :billingprovince
    ]

    MOBILE = [
      :phone,
      :authemail
    ]
  end
end