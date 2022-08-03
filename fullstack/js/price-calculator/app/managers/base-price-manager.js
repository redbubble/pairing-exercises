import ProductBasePrice from '../models/base-price';

export default class BasePriceManager {
  data = {};

  constructor(jsonFile) {
    this.data = this.readJson(jsonFile);
  }

  readJson(jsonFile) {
    let data = new Object();
    const rawData = require(jsonFile);

    for (const rawItem of rawData) {
      const productBasePrice = new ProductBasePrice(
        rawItem['product-type'],
        rawItem.options,
        rawItem['base-price']
      );

      if (data[productBasePrice.productType]) {
        data[productBasePrice.productType].basePrices.push(productBasePrice);
      } else {
        data[productBasePrice.productType] = {};
        data[productBasePrice.productType].basePrices = [];
        data[productBasePrice.productType].basePrices = [productBasePrice];
      }
    }

    return data;
  }

  lookup(productType = '', options = {}) {
    throw new Error('Not implemented');
  }
}
