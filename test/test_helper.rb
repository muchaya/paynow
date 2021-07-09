require "paynow/configuration"
require "paynow/errors"
require "paynow/payment_builder"

#key for generating a test hash
Paynow.setup do |config|
  config.integration_key = "3e9fed89-60e1-4ce5-ab6e-6b1eb2d4f977"
end

