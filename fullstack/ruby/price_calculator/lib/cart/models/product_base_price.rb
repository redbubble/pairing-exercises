class ProductBasePrice < Struct.new(:product_type, :options, :price)
  def self.from_hash(hash)
    ProductBasePrice.new(
      hash.fetch('product-type'),
      hash.fetch('options'),
      hash.fetch('base-price')
    )
  end
end

