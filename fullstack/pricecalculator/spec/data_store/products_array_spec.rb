require 'spec_helper'

require_relative '../../data_store/products_array.rb'

RSpec.describe DataStore::ProductsArray do
  let(:filename) { 'base-prices.json' }

  it 'passes the correct file path to the json parser' do
    allow(DataAdapter::JSONFile).to receive(:parse)
    expected_path = "./public/prices/#{filename}"

    described_class.build_from_file(filename)

    expect(DataAdapter::JSONFile).to have_received(:parse)
      .with(expected_path)
  end
end
