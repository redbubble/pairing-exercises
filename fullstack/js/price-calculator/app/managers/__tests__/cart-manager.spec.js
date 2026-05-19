import BasePriceManager from '../base-price-manager.js';
import CartManager from '../cart-manager.js';

describe('cartManager', () => {
  it('should lookup price and calculate total', () => {
    expect.assertions(1);

    const cartManager = new CartManager(
      new BasePriceManager('./testdata/base-prices.json'),
      './testdata/cart-11356.json'
    );

    expect(cartManager.calculateTotalPrices()).toBe(11356);
  });
});
