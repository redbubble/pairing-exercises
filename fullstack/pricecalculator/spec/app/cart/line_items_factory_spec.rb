require 'spec_helper'

require_relative '../../../app/cart/line_items_factory.rb'

RSpec.describe Cart::LineItemsFactory do
  let(:products_array) { Array.new }
  let(:items_array) do
    [
      {
        'product-type' => 'hoodie',
        'options' => {
          'size' => 'small',
          'colour' => 'white',
          'print-location' => 'front'
        },
        'artist-markup' => 20,
        'quantity' => 1
      }
    ]
  end

  let(:searcher) do
    instance_double('Search::LinearSearch', fetch_price_for_item: 2000)
  end

  before do
    allow(Search::Factory).to receive(:build_search) { searcher }
  end

  it 'returns an array' do
    response = described_class.build_line_items(items_array, products_array)

    expect(response).to be_an Array
  end

  it 'returns an array of line items' do
    response = described_class.build_line_items(items_array, products_array)

    expect(response[0]).to be_a Cart::LineItem
  end
end
