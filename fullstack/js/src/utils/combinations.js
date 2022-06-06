/**
 * Get all combinations of the values in given array.
 * @param {Array} values - Array with values.
 * @returns {Array}
 */
export default function combinations(values) {
  const subsets = [[]]

  for (const value of values) {
    const total = subsets.length - 1

    for (let i = 0; i <= total; i++) {
      subsets.push([...subsets[i], value])
    }
  }

  return subsets.slice(1)
}
