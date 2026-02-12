module Paynow
  module Attributes

    PAYMENT_METHODS = { 
      paynow_redirect: "paynow_redirect",
      ecocash: "ecocash",
      onemoney: "onemoney",
      innbucks: "innbucks", 
      omari: "omari",
      zimswitch: "zimswitch",
      vmc: "vmc"
    }.freeze

    def self.for(attrs)
      method = attrs.fetch(:method)
      klass_name = method.to_s.split('_').map(&:capitalize).join
      
      const_get(klass_name).build(attrs).to_h
    rescue KeyError
      raise ArgumentError, "Missing :method attribute"
    rescue NameError
      raise ArgumentError, "Unknown method: #{method}"
    end

    PaynowRedirect = Data.define(:additionalinfo, :authemail, :authphone, :authname, :method) do
      def initialize(additionalinfo: nil, authemail: nil, authphone: nil, authname: nil, method: nil)
        super
      end

      def self.build(attrs)
        new(
          authemail: attrs[:auth_email],
          authphone: attrs[:phone_number],
          authname: attrs[:auth_name],
          additionalinfo: attrs[:additional_info],
          method: nil
        )
      end
    end

    Ecocash = Data.define(:phone, :authemail, :method) do
      def self.build(attrs)
        new(
          authemail: attrs.fetch(:auth_email),
          phone: attrs.fetch(:phone_number),
          method: Attributes::PAYMENT_METHODS.fetch(:ecocash)
        )
      end
    end

    Onemoney = Data.define(:phone, :authemail, :method) do
      def self.build(attrs)
        new(
          authemail: attrs.fetch(:auth_email),
          phone: attrs.fetch(:phone_number),
          method: Attributes::PAYMENT_METHODS.fetch(:onemoney)
        )
      end
    end

    Innbucks = Data.define(:phone, :authemail, :method) do
      def self.build(attrs)
        new(
          authemail: attrs.fetch(:auth_email),
          phone: attrs.fetch(:phone_number),
          method: Attributes::PAYMENT_METHODS.fetch(:innbucks)
        )
      end
    end  

    Omari = Data.define(:phone, :authemail, :method) do
      def self.build(attrs)
        new(
          authemail: attrs.fetch(:auth_email),
          phone: attrs.fetch(:phone_number),
          method: Attributes::PAYMENT_METHODS.fetch(:omari)
        )
      end
    end       

    Zimswitch = Data.define(:tokenize, :token, :authemail, :additionalinfo, :method) do
      def initialize(tokenize: false, token: nil, authemail: nil, additionalinfo: nil, method: nil)
        if !tokenize && token
          raise ArgumentError, "token must not be set when tokenize is false or not set"
        end
      
        if tokenize && token.nil?
          raise ArgumentError, "token is required when tokenize is true"
        end

        super
      end

      def self.build(attrs)
        new(
          tokenize: attrs.fetch(:tokenize, false),
          token: attrs[:token],
          additionalinfo: attrs[:additional_info],
          method: Attributes::PAYMENT_METHODS.fetch(:zimswitch),
          authemail: attrs[:auth_email]
        )
      end
    end

    Vmc = Data.define(:tokenize, :token, :authemail, :additionalinfo, :method) do
      def initialize(tokenize: false, token: nil, authemail: nil, additionalinfo: nil, method: nil)
        
        if !tokenize && token
          raise ArgumentError, "token must not be set when tokenize is false or not set"
        end
      
        if tokenize && token.nil?
          raise ArgumentError, "token is required when tokenize is true"
        end

        super
      end

      def self.build(attrs)
        new(
          tokenize: attrs.fetch(:tokenize, false),
          token: attrs[:token],
          additionalinfo: attrs[:additional_info],
          method: Attributes::PAYMENT_METHODS.fetch(:vmc),
          authemail: attrs[:auth_email]
        )
      end
    end    
  end
end
