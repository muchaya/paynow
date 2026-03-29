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

    def initialize(attrs)
      attrs.each do |k,v|
        variable_name = "@#{k}"
        instance_variable_set(variable_name,v) unless v.nil?
      end
    end

    def next_action
      return Actions::Redirect.new(paynow_redirect_url) if requires_redirect?
      return Actions::Otp.new(self) if requires_otp?
      return Actions::Display.new(self) if requires_display?
      nil
    end

    def success?
      status == 'Ok'
    end

    def failed?
      !success?
    end

  end
end
