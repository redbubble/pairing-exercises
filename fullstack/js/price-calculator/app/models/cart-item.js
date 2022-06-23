export class CartItem {

    productType = "";

    options = {};

    /**
     * The artist markup in percentile. E.g. 20 would be 20% in markup.
     */
    artistMarkup = 0;

    /**
     * The quantity of this item.
     */
    quantity = 0;

    /**
     * The base price object of this item
     */
    basePrice;

    constructor(productType, options, artistMarkup, quantity, basePrice) {
        this.productType = productType;
        this.options = options;
        this.artistMarkup = artistMarkup;
        this.quantity = quantity;
        this.basePrice = basePrice;
    }
}
