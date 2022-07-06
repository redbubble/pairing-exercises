require 'minitest/autorun'
require 'test_helper.rb'

class BasePriceManagerTest < Minitest::Test
  def setup
    @base_price_manager = base_price_manager
  end

  def test_lookup_single_option_item
    result = @base_price_manager.lookup(
      product_type: 'hoodie',
      options: {
        'size' => 'large',
        'colour' => 'white'
      }
    )

    assert_equal(result, ProductBasePrice.new('hoodie',
                                                {
                                                  'colour' => ['white'],
                                                  'size' => ['large']
                                                },
                                                3848
                                              ))
  end

  def test_lookup_multiple_option_item
    result = @base_price_manager.lookup(
      product_type: 'hoodie',
      options: {
        'size' => 'small',
        'colour' => 'dark'
      }
    )

    assert result == ProductBasePrice.new(
                                          'hoodie',
                                          {
                                              'colour' => ['white', 'dark'],
                                              'size' => ['small', 'medium']
                                            },
                                          3800
                                          )
  end

  def test_lookup_zero_option_item
    result = base_price_manager.lookup(
      product_type: 'leggings'
    )

    assert result == ProductBasePrice.new('leggings', {}, 5000)

  end
end