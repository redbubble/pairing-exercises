require 'optparse'

require_relative 'lib/cart/managers/base_price_manager'
require_relative 'lib/cart/managers/cart_manager'

Options = Struct.new(:cart, :base_prices)

class Parser
  def self.parse(options)
    args = Options.new

    opt_parser = OptionParser.new do |parser|
      parser.on('-c STRING', '--cart STRING', 'Path to a JSON file representing a cart') do |n|
        args.cart = n
      end

      parser.on('-p STRING', '--base-prices STRING', 'Path to a JSON file representing a list of base prices') do |n|
        args.base_prices = n
      end

      parser.on("-h", "--help", "Prints this help") do
        puts parser
        exit
      end
    end

    opt_parser.parse!(options)

    if args.base_prices.nil? && args.cart.nil?
      puts opt_parser
      exit
    end
    return args
  end
end


def main(cart, base_prices)
  cart_manager = CartManager.new(
    base_price_manager: BasePriceManager.new(json_file: base_prices),
    json_file: cart
  )
  puts(cart_manager.calculate_total_prices)
end

if __FILE__ == $0
  options = Parser.parse(ARGV)
  main(*options)
end