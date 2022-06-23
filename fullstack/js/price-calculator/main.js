import arg from 'arg'
import CartManager from './app/managers/cart-manager'
import BasePriceManager from './app/managers/base-price-manager'

/**
 * Get cart and price from command line arguments.
 *
 * @param {Array} rawArgs - Command line arguments.
 * @returns {Object}
 */
function parseArgumentsIntoOptions(rawArgs) {
  const args = arg(
    {
      '--cart': String,
      '--prices': String,
      '-c': '--cart',
      '-p': '--prices',
    },
    {
      argv: rawArgs.slice(2),
    }
  )
  return {
    cart: args['--cart'] || '',
    prices: args['--prices'] || '',
  }
}

/**
 * Display total price for a cart using base prices.
 * @param {Array} args - Command line arguments.
 */
export function main(args) {
  const options = parseArgumentsIntoOptions(args)
  const cartManager = new CartManager(
    new BasePriceManager(options.prices),
    options.cart
  )

  console.log(cartManager.calculateTotalPrices())
}
