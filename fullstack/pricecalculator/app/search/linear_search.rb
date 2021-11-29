# frozen_string_literal: true

module Search
  class ItemNotFoundError < StandardError
  end

  class LinearSearch
    BASE_PRICE_KEY   = 'base-price'
    OPTIONS_KEY      = 'options'
    PRODUCT_TYPE_KEY = 'product-type'

    attr_accessor :products_array

    def initialize(products_array)
      self.products_array = products_array
    end

    def fetch_price_for_item(item)
      item_info = fetch_item_info_for_item(item)

      item_info[BASE_PRICE_KEY]
    end

    def fetch_item_info_for_item(item)
      item_product_type = item[PRODUCT_TYPE_KEY]
      item_info = products_array.find do |product|
        next if product[PRODUCT_TYPE_KEY] != item_product_type

        product_and_item_options_match?(product[OPTIONS_KEY], item[OPTIONS_KEY])
      end

      item_info || raise_item_not_found_error(item_product_type)
    end

    private

    def product_and_item_options_match?(product_options, item_options)
      product_option_values = product_options.values.flatten
      item_option_values = item_options.values_at(*product_options.keys)

      (item_option_values - product_option_values).empty?
    end

    def raise_item_not_found_error(product_type)
      raise ItemNotFoundError, "product-type: #{product_type} not found"
    end
  end
end
