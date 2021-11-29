require 'spec_helper'

require_relative '../../app/price_calculator_app.rb'

RSpec.describe PriceCalculatorApp do
  describe '.run' do
    let(:prices_file) { 'base-prices.json' }

    context 'with an empty cart' do
      let(:cart_file) { 'cart-0.json' }

      it 'returns 0' do
        expected_result = 0

        result = described_class.run(cart_file, prices_file)

        expect(result).to eq(expected_result)
      end
    end

    context 'with a $45.60 cart' do
      let(:cart_file) { 'cart-4560.json' }

      it 'returns 4560' do
        expected_result = 4560

        result = described_class.run(cart_file, prices_file)

        expect(result).to eq(expected_result)
      end
    end

    context 'with a $93.63 cart' do
      let(:cart_file) { 'cart-9363.json' }

      it 'returns 9363' do
        expected_result = 9363

        result = described_class.run(cart_file, prices_file)

        expect(result).to eq(expected_result)
      end
    end

    context 'with a $95.00 cart' do
      let(:cart_file) { 'cart-9500.json' }

      it 'returns 9500' do
        expected_result = 9500

        result = described_class.run(cart_file, prices_file)

        expect(result).to eq(expected_result)
      end
    end

    context 'with a $113.56 cart' do
      let(:cart_file) { 'cart-11356.json' }

      it 'returns 11356' do
        expected_result = 11356

        result = described_class.run(cart_file, prices_file)

        expect(result).to eq(expected_result)
      end
    end

    context 'when Search::ItemNotFound is raised' do
      let(:cart_file) { 'cart-item-mangos.json' }

      it 'returns the error message' do
        expected_error_message = 'product-type: mangos not found'

        result = described_class.run(cart_file, prices_file)

        expect(result).to eq(expected_error_message)
      end
    end

    context 'when Cart::ValidationError is raised' do
      let(:cart_file) { 'cart-validation-error.json' }

      it 'returns the error message' do
        expected_error_message = "hoodie quantity can't be nil"

        result = described_class.run(cart_file, prices_file)

        expect(result).to eq(expected_error_message)
      end
    end
  end
end
