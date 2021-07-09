require_relative 'test_helper'
require 'minitest/autorun'
require 'paynow'

class Paynow::Payment::Test < Minitest::Test
  def setup
  end

  def test_payment_without_requisite_attribute
    assert_raises(KeyError) { Paynow::Payment.create(amount: 20) }
  end

  def test_payment_with_unknown_payment_method
    assert_raises(Paynow::UnknownAttributeError) { Paynow::Payment.create(amount: 20, reference: 1201, method: "dogecoin")}
  end
end