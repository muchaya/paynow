module Paynow
  class Payment
    attr_reader :amount,
                :additional_info,
                :auth_email,
                :authorization_code,
                :authorization_expires,
                :id,
                :method, 
                :otp_reference,
                :remote_otp_url,
                :phone,
                :paynow_reference,
                :poll_url,               
                :reference,
                :return_url,
                :result_url,
                :status,              
                :token,
                :tokenize
                
    def self.create(*args)
      Paynow::Config.client.create_payment(*args)
    end

    def self.check(poll_url:)
      Paynow::Config.client.check_payment(poll_url)
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

    private
      def innbucks?
        method == "innbucks"
      end

      def omari?
        method == "omari"
      end
  end
end
