# frozen_string_literal: true

require_relative '../app/search/linear_search.rb'
require_relative '../app/search/indexed_search.rb'
require_relative '../app/search/dictionary_search.rb'

class App
  DEFAULT_SEARCH_CLASS = Search::IndexedSearch
  @@search_class = DEFAULT_SEARCH_CLASS

  class << self
    def search_class
      @@search_class
    end

    def search_class=(search_class)
      @@search_class = search_class || DEFAULT_SEARCH_CLASS
    end
  end
end
