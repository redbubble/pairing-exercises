import combinations from '../combinations'

combinations

describe('combinations', () => {
  it('returns combinations for array values', () => {
    expect.hasAssertions()

    expect(combinations([1, 2, 3])).toStrictEqual([
      [1],
      [2],
      [1, 2],
      [3],
      [1, 3],
      [2, 3],
      [1, 2, 3],
    ])
  })
})
