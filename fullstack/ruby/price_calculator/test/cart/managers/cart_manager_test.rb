require 'minitest/autorun'
require 'test_helper'

require_relative '../../../lib/cart/managers/cart_manager'

class CartManagerTest < Minitest::Test
  Dir.glob(File.join(DATA_DIR, 'cart-*.json')).each do |test_file|
    match = /.*cart-(?<amount>\d+)\.json/.match(test_file)
    next if match.nil?
    expected_amount = match[:amount].to_i

    define_method("test_lookup_price_and_calculate_total#{expected_amount}") do
      cart_manager = CartManager.new(
        base_price_manager: base_price_manager,
        json_file: test_file
      )

      assert_equal(expected_amount, cart_manager.calculate_total_prices())
    end
  end
end