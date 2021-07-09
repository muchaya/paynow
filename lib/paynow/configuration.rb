require "logger"

module Paynow
  class << self
    attr_accessor :integration_id,
                  :integration_key,
                  :resulturl,
                  :returnurl

    def setup(&block)
      instance_eval(&block)
    end
  end

  class Config
    attr_writer :logger

    class << self
      def client
        Paynow::Client
      end

      def logger
        @logger ||= Logger.new($stdout)
      end

      def payment
        Paynow::Payment
      end

      def payment_builder
        Paynow::PaymentBuilder
      end

      def initiate_transaction_url
        "https://www.paynow.co.zw/interface/initiatetransaction/"
      end
      
      def initiate_express_transaction_url
        "https://www.paynow.co.zw/interface/remotetransaction/"
      end
    end
  end
end

