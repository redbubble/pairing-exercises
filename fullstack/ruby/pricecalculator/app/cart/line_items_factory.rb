# frozen_string_literal: true

require_relative '../search/factory.rb'
require_relative './line_item.rb'

module Cart
  class LineItemsFactory
    ARTIST_MARKUP_KEY = 'artist-markup'
    BASE_PRICE_KEY    = 'base-price'
    PRODUCT_TYPE_KEY  = 'product-type'
    QUANTITY_KEY      = 'quantity'

    class << self
      def build_line_items(items_array, products_array)
        new(products_array).build_line_items(items_array)
      end
    end

    attr_accessor :searcher

    def initialize(products_array)
      self.searcher = Search::Factory.build_search(products_array)
    end

    def build_line_items(items_array)
      items_array.map do |item|
        item_price = searcher.fetch_price_for_item(item)

        LineItem.new(
          base_price: item_price,
          product_type: item[PRODUCT_TYPE_KEY],
          artist_markup: item[ARTIST_MARKUP_KEY],
          quantity: item[QUANTITY_KEY]
        )
      end
    end
  end
end
