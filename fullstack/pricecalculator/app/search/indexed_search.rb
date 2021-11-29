# frozen_string_literal: true

module Search
  class IndexedSearch
    BASE_PRICE_KEY   = 'base-price'
    OPTIONS_KEY      = 'options'
    PRODUCT_TYPE_KEY = 'product-type'

    attr_accessor :products_array, :product_index

    def initialize(products_array)
      self.products_array = products_array
      self.product_index = {}
      build_index
    end

    def fetch_price_for_item(item)
      item_info = fetch_item_info_for_item(item)

      item_info[BASE_PRICE_KEY]
    end

    def fetch_item_info_for_item(item)
      item_product_type = item[PRODUCT_TYPE_KEY]
      min_index, max_index = product_index[item_product_type]
      if min_index.nil? || max_index.nil?
        raise_item_not_found_error(item_product_type)
      else
        search_for_item_within_range(item, min_index..max_index)
      end
    end

    private

    def build_index
      products_array.each_with_index do |info, index|
        product_type = info[PRODUCT_TYPE_KEY]
        if product_index[product_type].nil?
          set_min_and_max_index(product_type, index, index)
        else
          set_max_index(product_type, index)
        end
      end
    end

    def set_min_and_max_index(product_type, min_index, max_index)
      self.product_index[product_type] = [min_index, max_index]
    end

    def set_max_index(product_type, max_index)
      self.product_index[product_type][1] = max_index
    end

    def search_for_item_within_range(item, range)
      (products_array[range]).find do |product|
        product_and_item_options_match?(product[OPTIONS_KEY], item[OPTIONS_KEY])
      end
    end

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
