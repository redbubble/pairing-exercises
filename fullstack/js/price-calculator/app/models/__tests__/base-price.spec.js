import ProductBasePrice from '../base-price'

describe('productBasePriceModel', () => {
  it('has valid inputs', () => {
    expect.assertions(3)

    const testInput = {
      'product-type': 'hoodie',
      options: {
        colour: ['white', 'dark'],
        size: ['small', 'medium'],
      },
      'base-price': 3800,
    }
    const result = new ProductBasePrice(testInput)

    expect(result.productType).toBe('hoodie')
    expect(result.options).toStrictEqual({
      colour: ['white', 'dark'],
      size: ['small', 'medium'],
    })
    expect(result.price).toBe(3800)
  })
})
