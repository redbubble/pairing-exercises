import ProductBasePrice from '../models/base-price'

export default class BasePriceManager {
  data = {}

  constructor(jsonFile) {
    this.data = this.readJson(jsonFile)
  }

  readJson(jsonFile) {
    let data = {}
    const rawData = require(jsonFile)

    for (const rawItem in rawData) {
      const productBasePrice = new ProductBasePrice(rawItem)
      data[productBasePrice.productType] = productBasePrice
    }

    return data
  }

  lookup(productType = '', options = {}) {
    throw new Error('Not implemented')
  }
}
