module Paynow
  class Payment
    attr_reader :amount,
                :additionalinfo,
                :authemail,
                :authorization_code,
                :authorizationexpires,
                :id,
                :method, 
                :otpreference,
                :remoteotpurl,
                :phone,
                :poll_url,               
                :reference,
                :return_url,
                :result_url,
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
