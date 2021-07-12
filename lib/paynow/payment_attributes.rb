module Paynow
  class PaymentAttributes
    REQUISITE = [
      :amount,
      :reference,
      :method
    ].freeze

    OPTIONAL = [
      :additionalinfo,
      :authemail,
      :tokenize
    ].freeze

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
    ].freeze

    OPTIONAL_CARD = [
      :billingline2,
      :billingprovince
    ].freeze

    MOBILE = [
      :phone,
      :authemail
    ].freeze
  end
end