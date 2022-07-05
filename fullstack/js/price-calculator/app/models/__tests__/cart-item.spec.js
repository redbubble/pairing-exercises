import ProductBasePrice from '../base-price'
import CartItem from '../cart-item'

describe('cartItemModel', () => {
  it('should calculate price correctly', () => {
    expect.assertions(1)

    const hoodieBasePrice = new ProductBasePrice('hoodie', {}, 3800)
    const cartItem = new CartItem('hoodie', {}, 20, 2, hoodieBasePrice)

    expect(cartItem.calculatePrice()).toBe(9120)
  })
})
