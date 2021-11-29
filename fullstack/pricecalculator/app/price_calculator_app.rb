# frozen_string_literal: true

require_relative '../data_store/line_items_array.rb'
require_relative '../data_store/products_array.rb'

require_relative './cart/line_items_factory.rb'
require_relative './cart/validation_error.rb'
require_relative './calculator/sub_total.rb'

class PriceCalculatorApp
  class << self
    def run(cart_file, prices_file)
      line_items_array = DataStore::LineItemsArray.build_from_file(cart_file)
      prices_array = DataStore::ProductsArray.build_from_file(prices_file)

      line_items = Cart::LineItemsFactory.build_line_items(
        line_items_array,
        prices_array
      )

      Calculator::SubTotal.calculate(line_items)
    rescue Search::ItemNotFoundError, Cart::ValidationError => error
      error.message
    end
  end
end
