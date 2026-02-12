require 'securerandom'

module Paynow
  class PaymentBuilder
    def self.build(params)
      new.build(params)
    end

    def build(attrs)
      gateway_attrs = {    
        id: id, 
        returnurl: return_url, 
        resulturl: result_url,
        status: "Message",

      }
      
      request_attrs = { 
        amount: sprintf('%.2f',attrs.fetch(:amount)), 
        reference: attrs.fetch(:reference)
      }
      
      payment_method_specic_attrs = Paynow::Attributes.for(attrs)

      payment = gateway_attrs.merge!(request_attrs, payment_method_specic_attrs)

      payment.compact
    end

    private
      def id
        Paynow.integration_id
      end

      def merchant_trace
        SecureRandom.alphanumeric(16)
      end

      def result_url
        Paynow.result_url
      end

      def return_url
        Paynow.return_url
      end
  end
end
