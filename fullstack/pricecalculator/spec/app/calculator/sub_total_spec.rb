require 'spec_helper'

require_relative '../../../app/cart/line_item.rb'
require_relative '../../../app/calculator/sub_total.rb'

RSpec.describe Calculator::SubTotal do
  let(:hoodie) do
    Cart::LineItem.new(
      base_price: 3800,
      artist_markup: 20,
      quantity: 2
    )
  end

  let(:sticker) do
    Cart::LineItem.new(
      base_price: 221,
      artist_markup: 10,
      quantity: 1
    )
  end

  let(:line_items) { [hoodie, sticker] }

  it 'returns 9363 for the sub total of all line items' do
    sub_total = described_class.calculate(line_items)

    expect(sub_total).to eq(9363)
  end

  context 'where there are no line items' do
    let(:line_items) { [] }

    it 'returns 0 for the sub total of all line items' do
      sub_total = described_class.calculate(line_items)

      expect(sub_total).to eq(0)
    end
  end
end
