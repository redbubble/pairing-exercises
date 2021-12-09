require 'spec_helper'

require_relative '../../../config/app.rb'
require_relative '../../../app/search/factory.rb'

RSpec.describe Search::Factory do
  let(:products_array) do
    [
      {
        'product-type' => 'hoodie',
        'options' => {
          'colour' => ['white', 'dark'],
          'size' => ['small', 'medium']
        },
        'base-price' => 3800
      },
      {
        'product-type' => 'sticker',
        'options' => {
          'size' => ['small']
        },
        'base-price' => 221
      },
      {
        'product-type' => 'leggings',
        'options' => {
        },
        'base-price' => 5000
      }
    ]
  end

  subject { described_class.build_search(products_array) }

  after { App.search_class = nil }

  RSpec.shared_examples 'a search' do
    it 'has an array of products' do
      expect(subject.products_array).to eq(products_array)
    end

    describe '#fetch_price_for_item' do
      it 'finds items with no options' do
        expected_price = 5000
        item = {
          'product-type' => 'leggings',
          'options' => {},
          'artist-markup' => 20,
          'quantity' => 1
        }

        price = subject.fetch_price_for_item(item)

        expect(price).to eq(expected_price)
      end

      it 'finds items with one option type' do
        expected_price = 221
        item = {
          'product-type' => 'sticker',
          'options' => {
            'size' => 'small'
          },
          'artist-markup' => 10,
          'quantity' => 1
        }

        price = subject.fetch_price_for_item(item)

        expect(price).to eq(expected_price)
      end

      it 'finds items with multiple option types' do
        expected_price = 3800
        item = {
          'product-type' => 'hoodie',
          'options' => {
            'size' => 'small',
            'colour' => 'dark',
            'print-location' => 'front'
          },
          'artist-markup' => 20,
          'quantity' => 2
        }

        price = subject.fetch_price_for_item(item)

        expect(price).to eq(expected_price)
      end

      context 'when price is not found' do
        it 'raises an exception' do
          expected_message = 'product-type: mangos not found'
          item = {
            'product-type' => 'mangos',
            'options' => {},
            'artist-markup' => 20,
            'quantity' => 1
          }

          expect { subject.fetch_price_for_item(item) }
            .to raise_error Search::ItemNotFoundError
        end
      end
    end
  end

  context 'Search::LinearSearch' do
    before { App.search_class = Search::LinearSearch }

    it_behaves_like 'a search'
  end

  context 'Search::IndexedSearch' do
    before { App.search_class = Search::IndexedSearch }

    it_behaves_like 'a search'
  end

  context 'Search::DictionarySearch' do
    before { App.search_class = Search::DictionarySearch }

    it_behaves_like 'a search'
  end
end
