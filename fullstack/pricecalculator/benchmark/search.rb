require 'benchmark'
require 'faker'

require_relative '../config/app.rb'
require_relative '../data_store/line_items_array.rb'
require_relative '../data_store/products_array.rb'
require_relative '../app/cart/line_items_factory.rb'

puts <<-HEREDOC
*************************************************
BENCHMARKING SEARCHES UNDER DIFFERENT CONDITIONS
*************************************************

HEREDOC

puts 'Building base prices file with 10,000 products'

# Create 10,000 products with the given base prices
products_array = 1_000.times.inject([]) do |array, _|
  array + DataStore::ProductsArray.build_from_file('base-prices.json')
end

# Rename all product types
products_array.map! do |product|
  product['product-type'] = Faker::Name.unique.name
  product
end

# Add original base prices so that serach works
products_array += DataStore::ProductsArray.build_from_file('base-prices.json')

# Sort by product type
products_array.sort! { |a, b| a['product-type'] <=> b['product-type'] }

puts <<-HEREDOC

CONTEXT: When base prices are loaded each time a cart total is calculated
- Cart:  6 items made up of all of the example files.
- Base Prices: 10,000 products

HEREDOC

cart_names = [
  'cart-4560.json',
  'cart-9363.json',
  'cart-9500.json',
  'cart-11356.json',
]

expanded_cart = cart_names.inject([]) do |array, cart_name|
  array + DataStore::LineItemsArray.build_from_file(cart_name)
end

Benchmark.bmbm do |x|
  x.report('linear search') do
    App.search_class = Search::LinearSearch

    Cart::LineItemsFactory.build_line_items(expanded_cart, products_array)
  end

  x.report('indexed search') do
    App.search_class = Search::IndexedSearch

    Cart::LineItemsFactory.build_line_items(expanded_cart, products_array)
  end

  x.report('dictionary search') do
    App.search_class = Search::DictionarySearch

    Cart::LineItemsFactory.build_line_items(expanded_cart, products_array)
  end
end

puts <<-HEREDOC

CONTEXT: When base prices are loaded each time a cart total is calculated
- Cart: 6 items made up of all products in the base-prices.json file
- Base Prices: 10,000 products

HEREDOC

large_cart = DataStore::LineItemsArray.build_from_file('cart-large.json')

Benchmark.bmbm do |x|
  x.report('linear search') do
    App.search_class = Search::LinearSearch

    Cart::LineItemsFactory.build_line_items(large_cart, products_array)
  end

  x.report('indexed search') do
    App.search_class = Search::IndexedSearch

    Cart::LineItemsFactory.build_line_items(large_cart, products_array)
  end

  x.report('dictionary search') do
    App.search_class = Search::DictionarySearch

    Cart::LineItemsFactory.build_line_items(large_cart, products_array)
  end
end

puts <<-HEREDOC

CONTEXT: When base prices are loaded once and cart total calculated multiple times
- Cart: Combination of items from all example carts
- Base Prices: 10,000 products
- Run 1,000 times

HEREDOC

multiple_carts = cart_names.inject([]) do |array, cart_name|
  array << DataStore::LineItemsArray.build_from_file(cart_name)
end

Benchmark.bmbm do |x|
  x.report('linear search') do
    App.search_class = Search::LinearSearch
    factory = Cart::LineItemsFactory.new(products_array)

    1000.times do
      multiple_carts.each do |cart|
        factory.build_line_items(cart)
      end
    end
  end

  x.report('indexed search') do
    App.search_class = Search::IndexedSearch

    factory = Cart::LineItemsFactory.new(products_array)
    1000.times do
      multiple_carts.each do |cart|
        factory.build_line_items(cart)
      end
    end
  end

  x.report('dictionary search') do
    App.search_class = Search::DictionarySearch
    factory = Cart::LineItemsFactory.new(products_array)

    1000.times do
      multiple_carts.each do |cart|
        factory.build_line_items(cart)
      end
    end
  end
end

puts <<-HEREDOC

CONTEXT: When base prices are loaded once and cart total calculated multiple times
- Cart:  6 items made up of all products in the base-prices.json file.
- Base Prices: 10,000 products
- Run 1,000 times

HEREDOC

Benchmark.bmbm do |x|
  x.report('linear search') do
    App.search_class = Search::LinearSearch
    factory = Cart::LineItemsFactory.new(products_array)

    1000.times do
      factory.build_line_items(large_cart)
    end
  end

  x.report('indexed search') do
    App.search_class = Search::IndexedSearch
    factory = Cart::LineItemsFactory.new(products_array)

    1000.times do
      factory.build_line_items(large_cart)
    end
  end

  x.report('dictionary search') do
    App.search_class = Search::DictionarySearch
    factory = Cart::LineItemsFactory.new(products_array)

    1000.times do
      factory.build_line_items(large_cart)
    end
  end
end
