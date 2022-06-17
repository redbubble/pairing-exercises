class CartItem < Struct.new(:product_type, :options, :artist_markup, :quantity, :base_price)
  def calculate_price
    # raise NotImplementedError
  end

  def self.from_hash(hash)
    ProductBasePrice.new(
      hash.fetch('product-type'),
      hash.fetch('options'),
      hash.fetch('artist-markup'),
      hash.fetch('quantity'),
      nil
    )
  end
end

