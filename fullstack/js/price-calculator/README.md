# Redbubble Fullstack Pairing Exercise - Price Calculator

## Functional Requirements

You can find the function requirements at the following URL:
http://take-home-test.herokuapp.com/new-product-engineer

## Pre-requisite

- `node (v14.6.0)`
- `npm (v6.14.5)`

## Installation

```
npm install
```

## Usage

Options:

| Option name | Type   | Required | Description               |
| :---------: | ------ | :------: | ------------------------- |
|    cart     | String |   Yes    | File path for cart        |
| base-prices | String |   Yes    | File path for base prices |

### Example

---

```
node bin/price-calculator --cart ../../testdata/cart-4560.json --base-prices ../../testdata/base-prices.json
```

## Linting and formatting

Linting provided by ESLint and Prettier.

```
npm run lint
```

## Testing

Testing using Jest framework.

```
npm run test
```

## Test data

The required test data can be found in the `./testdata` folder.

It contains a file of product base prices (`base-prices.json`), and several
example carts (`cart-{totalPrice}.json`). The price calculator program will need
both a base prices file and a cart file.

### Schemas

JSON schemas for the test data can be found in the `./testdata/schemas` folder.

These are provided for reference/documentation purposes only.

You will not be required to use them or integrate them, and they are not used at
all by the existing code. They're just here in case you find them helpful, and
can be safely ignored if you don't.
