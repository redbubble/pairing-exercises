# Fullstack Pairing Exercise - Functional Requirements

Following are the functional requirements for our fullstack pairing exercise.

Please familiarise yourself with the business logic before the interview.

### Inputs

Your program should take two command-line arguments:

- a JSON file representing a *cart*; and
- a JSON file representing a list of *base prices*.

You need not test that the input files conform with their schemas or
handle errors that arise if they don't conform or if they don't go with each other
(e.g. if there is no base price for a product type in the cart).
We'd all want those tests in a production application, but in this exercise they
tend to take time without adding interest.

### Outputs

Your program should output the *total price* of the cart in cents followed by a newline character.

### Data

- The *cart* schema is available at: /cart.schema.json
- Some example carts are available at: /cart-4560.json, /cart-9363.json, /cart-9500.json, and /cart-11356.json
- The *base price* schema is available at: /base-prices.schema.json
- An example of base prices is available at: /base-prices.json

As an aid in testing your program, the name of each example *cart* file mentioned above
includes the expected *total price* for that cart given the *base prices* in the example
base prices file mentioned above.

Note that `artist_markup` is a percentage, so it will need to be divided by 100.

### Products

You can assume that the options for a product-type are constant.

For example, if the first record with the product-type `hoodie` in the list of base prices
only has the options `colour` and `size`, all records with the product-type `hoodie`
in the list of base prices will have the options `colour` and `size` and will have no other options.

Your program should handle products with any options, even ones not found in the sample files.

### Calculation

When calculating the *total price* of the *cart*, your program should calculate
the price for one item as follows:

```
(base_price + round(base_price * artist_markup)) * quantity
```

The time your program takes to calculate a price should be constant with respect
to the number of *base prices*.
(In real life, Redbubble currently has more than `1,000` base prices.)
