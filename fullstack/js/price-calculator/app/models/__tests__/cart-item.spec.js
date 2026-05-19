import ProductBasePrice from '../base-price.js';
import CartItem from '../cart-item.js';

describe('cartItemModel', () => {
  it('should calculate price correctly', () => {
    expect.assertions(1);

    const hoodieBasePrice = new ProductBasePrice('hoodie', {}, 3800);
    const cartItem = new CartItem('hoodie', {}, 20, 2, hoodieBasePrice);

    expect(cartItem.calculatePrice()).toBe(9120);
  });
});
