require 'spec_helper'

require_relative '../../../app/cart/line_item.rb'
require_relative '../../../app/calculator/line_item_total.rb'

RSpec.describe Calculator::LineItemTotal do
  describe '.calculate' do
    let(:expected_total) { (base_price + ((base_price * artist_markup)/100).round) * quantity }
    let(:line_item) do
      Cart::LineItem.new(
        base_price: base_price,
        artist_markup: artist_markup,
        quantity: quantity
      )
    end

    context '0 quantity of a $10 item with 20 percent artist markup' do
      let(:quantity) { 0 }
      let(:artist_markup) { 30 }
      let(:base_price) { 10 }


      it 'returns 0' do
        total = described_class.calculate(line_item)

        expect(total).to eq(expected_total)
      end
    end

    context '1 quantity of a $0.5 item with 30 percent artist markup' do
      let(:quantity) { 1 }
      let(:artist_markup) { 30 }
      let(:base_price) { 50 }

      it 'returns 65' do
        total = described_class.calculate(line_item)

        expect(total).to eq(expected_total)
      end
    end

    context '3 quantity of a $9.99 item with 0.5 percent artist markup' do
      let(:quantity) { 3 }
      let(:artist_markup) { 0.5 }
      let(:base_price) { 999 }

      it 'returns 3012' do
        total = described_class.calculate(line_item)

        expect(total).to eq(expected_total)
      end
    end
  end
end
