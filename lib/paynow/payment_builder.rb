require 'securerandom'

module Paynow
  class PaymentBuilder
    def self.build(params)
      new.build(params)
    end

    def build(attrs)
      payment = { id: id, returnurl: returnurl, resulturl: resulturl, status: "Message"}

      payment.merge!(
        required_info(attrs),
        optional_info(attrs)
      )

      payment.tap do |p|
        p.delete(:method) if p[:method] == pay_with_paynow
        p.merge!(card_info(attrs), optional_card_info(attrs)) if p[:method] == visa_or_mastercard
        p.merge!(mobile_info(attrs)) if p[:method] == mobile_money
      end
    end

    private

    PAYMENT_METHOD_TYPES = %w[ecocash onemoney vmc pay_with_paynow]

    def id
      Paynow.integration_id
    end

    def merchanttrace
      SecureRandom.alphanumeric(32)
    end

    def resulturl
      Paynow.resulturl
    end

    def returnurl
      Paynow.returnurl
    end

    def required_info(attrs)
      data = {}

      Paynow::PaymentAttributes::REQUISITE.each do |attr|
        data.merge!({attr => attrs.fetch(attr)})
      end
      
      data.update(amount: sprintf('%.2f',attrs[:amount]),method: payment_method(attrs))
    end

    def optional_info(attrs)
      data = {}

      Paynow::PaymentAttributes::OPTIONAL.each do |attr|
        data.merge!({attr => attrs.fetch(attr)}) if attrs.has_key?(attr)
      end

      data
    end

    def card_info(attrs)
      data = {}

      Paynow::PaymentAttributes::CARD.each do |attr|
        data.merge!({attr => attrs.fetch(attr)})
      end

      data
    end

    def optional_card_info(attrs)
      data = {}

      Paynow::PaymentAttributes::OPTIONAL_CARD.each do |attr|
        data.merge!({attr => attrs.fetch(attr)}) if attrs.has_key?(attr)
      end

      data
    end

    def mobile_info(attrs)
      data = {}

      Paynow::PaymentAttributes::MOBILE.each do |attr|
        data.merge!({attr => attrs.fetch(attr)})
      end

      data
    end

    def payment_method(attrs)
      if attrs.has_key?(:method) && !PAYMENT_METHOD_TYPES.include?(attrs[:method])
        raise Paynow::UnknownAttributeValueError, "Payment method should either be ecocash, onemoney, vmc or other"
      elsif !attrs.has_key?(:method)
        raise Paynow::MissingAttributeError, "Payment method is missing"
      else
        attrs.fetch(:method)
      end
    end

    def mobile_money
      "ecocash" || "onemoney"
    end

    def visa_or_mastercard
      "vmc"
    end

    def pay_with_paynow
      "pay_with_paynow"
    end
  end
end
