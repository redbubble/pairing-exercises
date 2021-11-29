require_relative './app/price_calculator_app'

cart_file, prices_file = ARGV

if cart_file.nil? || prices_file.nil?
  puts <<-HEREDOC
Price Calculator App needs a cart file and a price file to run.
Example:
  $ ruby app.rb cart-4560.json base-prices.json
HEREDOC

  exit
end

cart_file, prices_file = ARGV

result = PriceCalculatorApp.run(cart_file, prices_file)

puts result
