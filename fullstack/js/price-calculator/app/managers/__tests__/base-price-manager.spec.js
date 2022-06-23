import ProductBasePrice from '../../models/base-price'
import BasePriceManager from '../base-price-manager'

describe('basePriceManager', () => {
  it('should lookup a single option item', () => {
    expect.assertions(1)

    const result = new BasePriceManager(
      '../../testdata/base-prices.json'
    ).lookup('hoodie', {
      size: ['large'],
      colour: ['white'],
    })
    expect(result).toStrictEqual(
      new ProductBasePrice({
        'product-type': 'hoodie',
        options: {
          size: ['large'],
          colour: ['white'],
        },
        'base-price': 3848,
      })
    )
  })
})
