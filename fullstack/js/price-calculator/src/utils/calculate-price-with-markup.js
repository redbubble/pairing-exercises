import { round } from 'lodash'

/**
 * Computed final price of a product using base price, markup and quantity.
 *
 * @param {Number} quantity - Number of products.
 * @param {Number} basePrice - Price without markup.
 * @param {Number} markup - Percentage value (20 means 20%)
 * @returns {Number}
 */
export default function calculatePriceWithMarkup(quantity, basePrice, markup) {
  return (basePrice + round((basePrice * markup) / 100)) * quantity
}
