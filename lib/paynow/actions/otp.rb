module Paynow
  module Actions
    class Otp
      class << self
        def complete(remote_otp_url:, otp:, integration_id: )
          
        end
      end

      def initialize(payment)
        @payment = payment
      end

      def type
        :otp
      end

      def reference
        @payment.otp_reference
      end

      def submit(otp:)
        Paynow::Actions::Otp.complete(
          remote_otp_url: @payment.remote_otp_url
          otp: otp,
          integration_id: Paynow::Config.integration_id
        )
      end
    end
  end
end