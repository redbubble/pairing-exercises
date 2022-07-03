import CartItem from '../models/cart-item'

export default class CartManager {
  data = []
  basePriceManager

  constructor(basePriceManager, jsonFile) {
    this.data = this.readJson(jsonFile)
    this.basePriceManager = basePriceManager
  }

  readJson(jsonFile) {
    let data = []
    const rawData = require(jsonFile)

    for (const rawItem in rawData) {
      const cartItem = new CartItem(
        rawItem['product-type'],
        rawItem.options,
        rawItem['artist-markup'],
        rawItem.quantity,
        this.basePriceManager
      )
      data.push(cartItem)
    }

    return data
  }

  calculateTotalPrices() {
    throw new Error('Not implemented')
  }
}
