module Calculator
  class LineItemTotal
    class << self
      def calculate(line_item)
        quantity      = line_item.quantity
        artist_markup = line_item.artist_markup
        base_price    = line_item.base_price

        (base_price + ((base_price * artist_markup)/100).round) * quantity
      end
    end
  end
end
