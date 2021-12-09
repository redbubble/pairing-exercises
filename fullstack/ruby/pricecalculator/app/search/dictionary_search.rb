# frozen_string_literal: true

module Search
  class DictionarySearch
    BASE_PRICE_KEY   = 'base-price'
    OPTIONS_KEY      = 'options'
    PRODUCT_TYPE_KEY = 'product-type'

    attr_accessor :products_array, :product_dictionary, :product_option_types

    def initialize(products_array)
      self.products_array = products_array
      self.product_option_types = {}
      self.product_dictionary = {}
      build_dictionary
    end

    def fetch_price_for_item(item)
      product_type = item[PRODUCT_TYPE_KEY]
      option_types = product_option_types[product_type]
      item_options = item[OPTIONS_KEY].values_at(*option_types)
      search_key = build_search_key([product_type] + item_options)

      product_dictionary[search_key] || raise_item_not_found_error(product_type)
    end

    private

    def build_dictionary
      products_array.each do |info|
        product_type = info[PRODUCT_TYPE_KEY]
        base_price = info[BASE_PRICE_KEY]
        option_keys = info[OPTIONS_KEY].keys.sort
        option_values = info[OPTIONS_KEY].values

        if product_options_missing?(product_type)
          store_product_option_types(product_type, option_keys)
        end
        store_product_combinations_with_prices(product_type, option_values, base_price)
      end
    end

    def product_options_missing?(product_type)
      product_option_types[product_type].nil?
    end

    def store_product_option_types(product_type, keys)
      self.product_option_types[product_type] = keys
    end

    def store_product_combinations_with_prices(product_type, option_values, base_price)
      combinations = build_options_combinations(product_type, option_values)

      combinations.each do |combination|
        search_key = build_search_key(combination)
        self.product_dictionary[search_key] = base_price
      end
    end

    def build_options_combinations(product_type, option_values)
      [product_type].product(*option_values)
    end

    def build_search_key(array)
      array.join('-')
    end

    def raise_item_not_found_error(product_type)
      raise ItemNotFoundError, "product-type: #{product_type} not found"
    end
  end
end
