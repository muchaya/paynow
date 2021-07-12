require 'net/http'

module Paynow
  class Client
    attr_reader :body

    def self.create_payment(body)
      new(body).create_payment
    end

    def initialize(body)
      @body = body
    end

    def create_payment
      logger.info("[PAYNOW] STARTED POST #{uri}")

      response = Net::HTTP.post(uri, payment_data,headers)

      decoded_response = URI.decode_www_form(response.read_body).to_h.transform_keys(&:to_sym)

      if response.code =~ /^[4-5]/
        logger.error("[PAYNOW] ERROR GET #{uri} status=#{response.code} message=#{decoded_response.error}")
      else
        logger.info("[PAYNOW] COMPLETED  GET #{uri} status=#{response.code} response=#{decoded_response}")
      end

      payment.new(
        raw_payment.merge(
          poll_url: decoded_response[:pollurl],
          paynow_redirect_url: decoded_response[:browserurl],
          status: decoded_response[:status]
          )
        )
    end

    private

    def uri
      if raw_payment.has_key?(:method)
        URI(Paynow::Config.initiate_express_transaction_url)
      else
        URI(Paynow::Config.initiate_transaction_url)
      end
    end

    def payment_data
      URI.encode_www_form(raw_payment.merge({hash: _hash}))
    end

    def raw_payment
      payment_builder.build(body)
    end

    def _hash
      Paynow::HashGenerator._hmac(raw_payment)
    end 

    def headers
      {'content-type': 'application/x-www-form-urlencoded'}
    end

    def payment
      Paynow::Config.payment
    end

    def payment_builder
      Paynow::Config.payment_builder
    end

    def logger
      Paynow::Config.logger
    end
  end
end

 

