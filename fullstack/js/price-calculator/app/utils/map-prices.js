import { forEach, flatMapDeep, isEmpty } from 'lodash'
import combinations from './combinations'

/**
 * Create a map table for prices.
 *
 * @param {Array} prices - Follows this schema: http://take-home-test.herokuapp.com/base-prices.schema.json
 * @return {Object} - Map containing as keys all possible options sorted alphabetically and the price as value.
 */
export default function mapPrices(prices) {
  let allOptionsMap = new Map()

  forEach(prices, (price) => {
    // Check if this product price has any options.
    if (isEmpty(price.options)) {
      // Default price is directly matching product type.
      allOptionsMap.set(price['product-type'], price['base-price'])
    } else {
      // Sort keys in alphabetical order.
      const optionsKeysArray = Object.keys(price.options).sort()

      // Return an array with all combinations between key and values.
      // [ 'colour:white', 'colour:dark', 'size:small', 'size:medium' ]
      const keyValueArray = flatMapDeep(
        optionsKeysArray.map((key) => {
          return price.options[key].map((value) => {
            return `${key}:${value}`
          })
        })
      )

      // Get all combinations for the product options.
      const optionsCombinations = combinations(keyValueArray)

      // Add to the map all possible combinations.
      optionsCombinations.forEach((value) => {
        allOptionsMap.set(
          `${price['product-type']}:${value.join(';')}`,
          price['base-price']
        )
      })
    }
  })

  return allOptionsMap
}
