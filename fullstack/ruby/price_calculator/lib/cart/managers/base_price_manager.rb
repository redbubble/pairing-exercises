require 'json'

require_relative '../../cart/models/product_base_price'

class BasePriceManager
  attr_accessor :data

  def initialize(json_file:)
    @data = JSON.parse(File.read(json_file))
  end

  def lookup(product_type:, options: nil)
    raise NotImplementedError
  end
end