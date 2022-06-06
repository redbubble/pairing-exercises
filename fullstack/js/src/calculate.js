import calculatePriceWithMarkup from './utils/calculate-price-with-markup'
import combinations from './utils/combinations'
import mapPrices from './utils/map-prices'

/**
 * Calculate total price from a cart.
 * @param {String} cartFile - File name.
 * @param {String} pricesFile - File name.
 */
export default function calculate(cartFile, pricesFile) {
  let total = 0

  const cart = require(`../api/carts/${cartFile}.json`)
  const prices = require(`../api/prices/${pricesFile}.json`)

  const pricesMap = mapPrices(prices)

  // Loop through each product in the cart.
  cart.forEach((product) => {
    // Sort keys in alphabetical order.
    const optionsKeysArray = Object.keys(product.options).sort()

    // Return an array with all combinations between key and values.
    // [ 'colour:white', 'colour:dark', 'size:small', 'size:medium' ]
    const keyValueArray = optionsKeysArray.map((key) => {
      return `${key}:${product.options[key]}`
    })

    // Get all possible combinations for this product options.
    const optionsCombinations = combinations(keyValueArray)

    // Sort combinations alphabetically since prices map has options in alphabetical order too.
    optionsCombinations.sort((a, b) => b.length - a.length)

    // Lastly add product price as base product to match.
    optionsCombinations.push([product['product-type']])

    // Loop through all combinations and try to match as many as possible.
    for (let index = 0; index < optionsCombinations.length; index++) {
      // Default match key is directly the product type.
      let mapKey = product['product-type']

      // If there are options combinations use them as key to search in the prices map.
      if (index < optionsCombinations.length - 1) {
        mapKey = `${product['product-type']}:${optionsCombinations[index].join(
          ';'
        )}`
      }

      // If a price is found in the map add it to the total.
      if (pricesMap.has(mapKey)) {
        // Total is a sum of final prices for each product.
        total += calculatePriceWithMarkup(
          product.quantity,
          pricesMap.get(mapKey),
          product['artist-markup']
        )

        // Stop search for this product if we found the best price for it.
        break
      }
    }
  })

  return total
}
