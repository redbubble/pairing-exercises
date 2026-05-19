import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';
import ProductBasePrice from '../models/base-price.js';

export default class BasePriceManager {
  data = {};

  constructor(jsonFile) {
    this.data = this.readJson(jsonFile);
  }

  readJson(jsonFile) {
    const data = new Object();
    const rawData = JSON.parse(readFileSync(resolve(jsonFile), 'utf8'));

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
