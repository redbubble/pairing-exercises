require 'spec_helper'

require_relative '../../../app/cart/line_item.rb'

RSpec.describe Cart::LineItem do
  let(:product_type) { 'hoodie' }
  let(:base_price) { 999 }
  let(:artist_markup) { 20 }
  let(:quantity) { 3 }

  subject do
    described_class.new(
      product_type: product_type,
      base_price: base_price,
      artist_markup: artist_markup,
      quantity: quantity
    )
  end

  describe '#base_price' do
    it 'returns the base price' do
      expect(subject.base_price).to eq(base_price)
    end
  end

  describe '#artist_markup' do
    it 'returns the artist markup' do
      expect(subject.artist_markup).to eq(artist_markup)
    end
  end

  describe '#quantity' do
    it 'returns the quantity' do
      expect(subject.quantity).to eq(quantity)
    end
  end

  RSpec.shared_examples 'when argument is nil' do |parameter|
    let(parameter) { nil }

    it 'raises a validation error' do
      expected_error_message = "#{product_type} #{parameter} can't be nil"

      expect { subject }
        .to raise_error(Cart::ValidationError, expected_error_message)
    end
  end

  context 'when base_price is nil' do
    it_behaves_like 'when argument is nil', :base_price
  end

  context 'when artist_markup is nil' do
    it_behaves_like 'when argument is nil', :artist_markup
  end

  context 'when quantity is nil' do
    it_behaves_like 'when argument is nil', :quantity
  end
end
