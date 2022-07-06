require 'minitest/autorun'
require 'test_helper'

require_relative '../../../lib/cart/models/product_base_price'

class BasePriceTest < Minitest::Test

  [nil, true, false, 'random string', '9', '-19'].each do |test_input|
    define_method("test_from_dict_invalid_#{test_input}") do
      assert_raises {
        ProductBasePrice.from_hash(test_input)
      }
    end
  end

  def test_from_valid_input
    test_input = {
      'product-type' => 'hoodie',
      'options' => {
        'colour' => ['white', 'dark'],
        'size' => ['small', 'medium']
      },
      'base-price' => 3800
    }

    result = ProductBasePrice.from_hash(test_input)
    assert_equal 'hoodie', result.product_type
    assert_equal Hash( 'colour' => ['white', 'dark'], 'size' => ['small', 'medium']), result.options
    assert 3800, result.price
  end
end
