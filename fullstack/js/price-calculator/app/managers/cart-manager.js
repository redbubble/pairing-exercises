import { CartItem } from "../models/cart-item";

export class CartManager {
    data = []
    basePriceManager

    constructor(basePriceManager, jsonFile) {
        this.data = readJson(jsonFile)
        this.basePriceManager = basePriceManager
    }

    static readJson(jsonFile) {
        let data = [];
        const rawData = require(jsonFile);

        for (rawItem in rawData) {
            const cartItem = new CartItem(rawItem);
            data.push(cartItem);
        }

        return data;
    }

    calculateTotalPrices() {
        throw new Error("Not implemented");
    }
}
