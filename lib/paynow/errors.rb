module Paynow
  class UnknownAttributeValueError < StandardError
    def initialize(msg="No such attribute. Refer to docs for an applicable attribute")
      super
    end
  end

  class MissingAttributeError < StandardError
    def initialize(msg="Attribute is missing")
      super
    end
  end  
end