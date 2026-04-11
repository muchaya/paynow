module Paynow
  module TestMode
    module MobileMoney
      SUCCESS            = "0771111111"
      DELAYED_SUCCESS    = "0772222222"
      USER_CANCELLED     = "0773333333"
      INSUFFICIENT_FUNDS = "0774444444"
    end

    # Aliases
    Ecocash = MobileMoney    
    EcoCash = MobileMoney
    OneMoney = MobileMoney
    Onemoney = MobileMoney

    module Visa
      SUCCESS            = "{11111111-1111-1111-1111-111111111111}"
      PENDING            = "{22222222-2222-2222-2222-222222222222}"
      CANCELLED          = "{33333333-3333-3333-3333-333333333333}"
      INSUFFICIENT_FUNDS = "{44444444-4444-4444-4444-444444444444}"
    end

    #Alias
    Mastercard = Visa
    MasterCard = Visa

    module Zimswitch
      SUCCESS            = "11111111111111111111111111111111"
      PENDING            = "22222222222222222222222222222222"
      CANCELLED          = "33333333333333333333333333333333"
      INSUFFICIENT_FUNDS = "44444444444444444444444444444444"
    end
  end
end
