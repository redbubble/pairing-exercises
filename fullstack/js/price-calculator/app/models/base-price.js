export class ProductBasePrice {

    product_type = "";

    /**
     * Key-value pairs of strings.
     * The value is an array and the base-price applies to all the strings in that array.
     */
    options = {};

    /**
     * The base price for this product-type and option combination in cents.
     */
    price = 0;

    constructor(product_type, options, price) {
        this.product_type = product_type;
        this.options = options;
        this.price = price;
    }
}
