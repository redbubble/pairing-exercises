require_relative './validation_error.rb'

module Cart
  class LineItem
    attr_accessor :product_type, :base_price, :artist_markup, :quantity

    def initialize(args={})
      self.product_type = args[:product_type]
      self.base_price = args[:base_price]
      self.artist_markup = args[:artist_markup]
      self.quantity = args[:quantity]
      validate_attributes
    end

    private

    def validate_attributes
      if base_price.nil?
        raise_error :base_price
      elsif artist_markup.nil?
        raise_error :artist_markup
      elsif quantity.nil?
        raise_error :quantity
      end
    end

    def raise_error(attribute)
      raise ValidationError, "#{product_type} #{attribute} can't be nil"
    end
  end
end
