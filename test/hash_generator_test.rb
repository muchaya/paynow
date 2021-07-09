require_relative 'test_helper'
require 'minitest/autorun'
require 'paynow'

class Paynow::HashGenerator::Test < Minitest::Test
  def setup
    @data = {
      id: 1201,
      reference: "TEST REF",
      amount: 99.99,
      additional_info: "A test ticket transaction",
      returnurl: "http://www.google.com/search?q=returnurl",
      resulturl: "http://www.google.com/search?q=resulturl",
      status: "Message" 
    }
  end

  def test_calculates_correct_hash
    _hash = Paynow::HashGenerator._hmac(@data)

    assert_equal( _hash, "2A033FC38798D913D42ECB786B9B19645ADEDBDE788862032F1BD82CF3B92DEF84F316385D5B40DBB35F1A4FD7D5BFE73835174136463CDD48C9366B0749C689") 
  end
end
