import ProductBasePrice from '../../models/base-price'
import BasePriceManager from '../base-price-manager'

describe('basePriceManager', () => {
  const basePriceManager = new BasePriceManager(
    '../../testdata/base-prices.json'
  )

  it('should lookup single option item', () => {
    expect.assertions(1)

    const result = basePriceManager.lookup('hoodie', {
      colour: 'white',
      size: 'large',
    })

    expect(result).toStrictEqual(
      new ProductBasePrice({
        'product-type': 'hoodie',
        options: {
          colour: ['white'],
          size: ['large'],
        },
        'base-price': 3848,
      })
    )
  })

  it('should lookup multiple option item', () => {
    expect.assertions(1)

    const result = basePriceManager.lookup('hoodie', {
      colour: 'dark',
      size: 'small',
    })

    expect(result).toStrictEqual(
      new ProductBasePrice({
        'product-type': 'hoodie',
        options: {
          colour: ['white', 'dark'],
          size: ['small', 'medium'],
        },
        'base-price': 3800,
      })
    )
  })

  it('should lookup zero option item', () => {
    expect.assertions(1)

    const result = basePriceManager.lookup('leggings')

    expect(result).toStrictEqual(
      new ProductBasePrice({
        'product-type': 'hoodie',
        options: {},
        'base-price': 5000,
      })
    )
  })
})
