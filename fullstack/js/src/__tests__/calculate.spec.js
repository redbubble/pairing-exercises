import calculate from '../calculate'

describe('calculate', () => {
  it('returns total value correctly when 1 product in the cart', () => {
    expect.assertions(1)

    const result = calculate('cart-4560', 'base-prices')
    expect(result).toBe(4560)
  })

  it('returns total value correctly when product type has price without options', () => {
    expect.assertions(1)

    const result = calculate('cart-5500', 'base-prices')
    expect(result).toBe(5500)
  })

  it('returns total value correctly when products of different type in the cart', () => {
    expect.assertions(1)

    const result = calculate('cart-9363', 'base-prices')
    expect(result).toBe(9363)
  })

  it('returns total value correctly when products of same type in the cart', () => {
    expect.assertions(1)

    const result = calculate('cart-9500', 'base-prices')
    expect(result).toBe(9500)
  })

  it('returns total value correctly when product has price with similar options', () => {
    expect.assertions(1)

    const result = calculate('cart-11356', 'base-prices')
    expect(result).toBe(11356)
  })
})
