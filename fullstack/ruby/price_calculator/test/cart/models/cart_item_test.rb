require 'minitest/autorun'
require 'test_helper'

require_relative '../../../lib/cart/models/cart_item'

class CartItemTest < Minitest::Test
  def test_calculate_price
    hoodie_base_price = ProductBasePrice.new('hoodie', {}, 3800)
    cart_item = CartItem.new('hoodie', {}, 20, 2, hoodie_base_price)
    assert_equal  9120, cart_item.calculate_price
  end
end
