import mapPrices from '../map-prices'

describe('map-prices', () => {
  it('return map table correctly', () => {
    expect.hasAssertions()

    const prices = [
      {
        'product-type': 'hoodie',
        options: {
          colour: ['white'],
          size: ['small'],
        },
        'base-price': 3800,
      },
    ]

    const expected = new Map([
      ['hoodie:colour:white', 3800],
      ['hoodie:size:small', 3800],
      ['hoodie:colour:white;size:small', 3800],
    ])

    const result = mapPrices(prices)
    expect(result).toStrictEqual(expected)
  })
})
