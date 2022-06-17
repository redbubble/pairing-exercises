class CartManager
  def initialize(base_price_manager:, json_file:)
    @base_price_manager = base_price_manager
    @data = JSON.parse(File.read(json_file)).map { |cart_item| CartItem.from_hash(cart_item) }
  end

  def calculate_total_prices
    raise NotImplementedError
  end
end