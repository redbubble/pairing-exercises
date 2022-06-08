import arg from 'arg'
import inquirer from 'inquirer'
import calculate from './src/calculate'
import chalk from 'chalk'
import { round } from 'lodash'

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
 * Provide command prompt for missing options from command line arguments.
 * @param {Object} options
 * @returns {Object}
 */
async function promptForMissingOptions(options) {
  const questions = []

  if (!options.cart) {
    questions.push({
      type: 'list',
      name: 'cart',
      message: 'Please select cart file: ',
      choices: [
        'cart-4560',
        'cart-5500',
        'cart-9363',
        'cart-9500',
        'cart-11356',
      ],
    })
  }

  if (!options.prices) {
    questions.push({
      type: 'list',
      name: 'prices',
      message: 'Please select a prices file: ',
      choices: ['base-prices'],
    })
  }

  const answers = await inquirer.prompt(questions)
  return {
    cart: options.cart || answers.cart,
    prices: options.prices || answers.prices,
  }
}

/**
 * Display total price for a cart using base prices.
 * @param {Array} args - Command line arguments.
 */
export async function calculatePriceForCart(args) {
  let options = parseArgumentsIntoOptions(args)
  options = await promptForMissingOptions(options)

  const finalPriceInCents = calculate(options.cart, options.prices)

  console.log(chalk.white.bgRed('Total price:'))
  console.log(
    chalk.red.bgWhite(
      `${finalPriceInCents}c ($${round(finalPriceInCents / 100, 2)})`
    )
  )
}
