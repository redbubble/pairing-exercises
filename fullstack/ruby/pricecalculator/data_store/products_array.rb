# frozen_string_literal: true

require_relative '../lib/data_adapter/json_file.rb'

module DataStore
  class ProductsArray
    PATH_TO_PRICES = './public/prices'

    def self.build_from_file(filename)
      prices_path  = "#{PATH_TO_PRICES}/#{filename}"

      DataAdapter::JSONFile.parse(prices_path)
    end
  end
end
