# frozen_string_literal: true

require_relative '../lib/data_adapter/json_file.rb'

module DataStore
  class LineItemsArray
    PATH_TO_CARTS = './public/carts'

    def self.build_from_file(filename)
      carts_path  = "#{PATH_TO_CARTS}/#{filename}"

      DataAdapter::JSONFile.parse(carts_path)
    end
  end
end
