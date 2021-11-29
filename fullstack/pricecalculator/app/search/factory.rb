require_relative '../../config/app.rb'

module Search
  class Factory
    def self.build_search(products_array)
      App.search_class.new(products_array)
    end
  end
end
