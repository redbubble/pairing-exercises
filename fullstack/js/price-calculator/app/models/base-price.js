export default class ProductBasePrice {
  productType = ''

  /**
   * Key-value pairs of strings.
   * The value is an array and the base-price applies to all the strings in that array.
   */
  options = {}

  /**
   * The base price for this product-type and option combination in cents.
   */
  price = 0

  constructor(productBasePrice) {
    this.productType = productBasePrice['product-type']
    this.options = productBasePrice.options
    this.price = productBasePrice['base-price']
  }
}
