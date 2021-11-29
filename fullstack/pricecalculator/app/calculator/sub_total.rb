require_relative './line_item_total.rb'

module Calculator
  class SubTotal
    def self.calculate(line_items)
      line_items.inject(0) do |total, line_item|
        total += Calculator::LineItemTotal.calculate(line_item)
      end
    end
  end
end
