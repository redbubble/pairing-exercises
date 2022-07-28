import BasePriceManager from '../base-price-manager'
import CartManager from '../cart-manager'

describe('cartManager', () => {
  it('should lookup price and calculate total', () => {
    expect.assertions(1)

    const cartManager = new CartManager(
      new BasePriceManager('../../testdata/base-prices.json'),
      '../../testdata/cart-11356.json'
    )

    expect(cartManager.calculateTotalPrices()).toBe(11356)
  })
})
