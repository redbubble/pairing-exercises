import { ProductBasePrice } from "../models/base-price";

export class BasePriceManager {
    data = {};

    constructor(jsonFile) {
        this.data = this.readJson(jsonFile);
    }

    static readJson(jsonFile) {
        let data = {};
        const rawData = require(jsonFile);

        for (raw_item in rawData) {
            const productBasePrice = new ProductBasePrice(raw_item);
            data[productBasePrice.productType] = productBasePrice;
        }

        return data;
    }

    lookup(productType, options = []) {
        throw Error("Not implemented")
    }
}
