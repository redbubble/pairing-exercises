import calculatePriceWithMarkup from '../calculate-price-with-markup'

describe('calculate-price-with-markup', () => {
  it('return correct total price', () => {
    expect.assertions(1)

    expect(calculatePriceWithMarkup(1, 3800, 20)).toBe(4560)
  })
})
