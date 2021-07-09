module Paynow
  class Payment
    attr_reader :amount,
                :additionalinfo,
                :authemail, 
                :billingline1, 
                :billingline2, 
                :billingcity,
                :billingprovince, 
                :billingcountry,
                :cardnumber, 
                :cardname, 
                :cardcvv, 
                :cardexpiry,   
                :id,
                :merchanttrace,
                :method, 
                :phone,
                :poll_url,               
                :reference,
                :returnurl,
                :resulturl,
                :status,                
                :token,
                :tokenize,
                
    def self.create(*args)
      Paynow::Config.client.create_payment(*args)
    end

    def initialize(attrs)
      attrs.each do |k,v|
        variable_name = "@#{k}"
        instance_variable_set(variable_name,v) unless v.nil?
      end
    end

    def success?
      status == 'Ok'
    end

    def failed?
      !success?
    end

  end
end


