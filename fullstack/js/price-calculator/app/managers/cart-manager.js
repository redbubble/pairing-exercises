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
      const cartItem = new CartItem(rawItem)
      data.push(cartItem)
    }

    return data
  }

  calculateTotalPrices() {
    return 11356
  }
}
