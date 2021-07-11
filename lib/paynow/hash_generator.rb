require 'digest'

module Paynow
  class HashGenerator
    attr_reader :data

    class << self
      def _hmac(data)
        new(data)._hmac
      end
    end

    def initialize(data)
      @data = data
    end

    def _hmac
      return unless data

      hash_data = concatenate_hash_values_and_append_key(data)
      
      _hash = Digest::SHA512.hexdigest(hash_data).upcase 
    end

    private

    def concatenate_hash_values_and_append_key(h)
      str = ""
      h.each { |k,v| str += v.to_s }
      str += key
    end    

    def key
      Paynow.integration_key
    end
  end
end