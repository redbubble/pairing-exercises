require 'spec_helper'

require_relative '../../data_store/line_items_array.rb'

RSpec.describe DataStore::LineItemsArray do
  let(:filename) { 'cart-4560.json' }

  it 'passes the correct file path to the json parser' do
    allow(DataAdapter::JSONFile).to receive(:parse)
    expected_path = "./public/carts/#{filename}"

    described_class.build_from_file(filename)

    expect(DataAdapter::JSONFile).to have_received(:parse)
      .with(expected_path)
  end
end
