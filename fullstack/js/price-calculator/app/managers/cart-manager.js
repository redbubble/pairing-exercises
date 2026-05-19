import { readFileSync } from 'node:fs';
import CartItem from '../models/cart-item.js';

export default class CartManager {
  data = [];

  constructor(basePriceManager, jsonFile) {
    this.data = this.readJson(basePriceManager, jsonFile);
  }

  readJson(basePriceManager, jsonFile) {
    const data = [];

    const rawData = JSON.parse(readFileSync(jsonFile, 'utf8'));

    for (const rawItem of rawData) {
      const basePrice = basePriceManager.lookup(
        rawItem['product-type'],
        rawItem.options
      );

      const cartItem = new CartItem(
        rawItem['product-type'],
        rawItem.options,
        rawItem['artist-markup'],
        rawItem.quantity,
        basePrice
      );

      data.push(cartItem);
    }

    return data;
  }

  calculateTotalPrices() {
    throw new Error('Not implemented');
  }
}
