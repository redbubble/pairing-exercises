# Redbubble Fullstack Pairing Exercise - Price Calculator

## Functional Requirements

You can find the functional requirements in the [functional-requirements](../../functional-requirements/Readme.md) folder.

## Dependencies

- `node (v14.6.0)`
- `npm (v6.14.5)`

## Installation

```
npm install
```

## Running the application

Certain functions are not implemented, and when called will throw a "not implemented"
error.

For the application to work, these will need to be completed. Once you are ready,
use the following instructions to run the application.

Options:

| Option name | Type   | Required | Description               |
| :---------: | ------ | :------: | ------------------------- |
|    cart     | String |   Yes    | File path for cart        |
| base-prices | String |   Yes    | File path for base prices |

```
node bin/price-calculator --cart ../../testdata/cart-4560.json --base-prices ../../testdata/base-prices.json
```

Or using the convenience npm command:

```
npm start
```

## Running the tests

Testing using Jest framework.

```
npm run test
```

## Test data

The required test data can be found in the `./testdata` folder. It contains
a file of product base prices (`base-prices.json`), and several example carts
(`cart-{totalPrice}.json`). The price calculator program will need both a base
prices file and a cart file.

### Schemas

JSON schemas for the test data can be found in the `./testdata/schemas` folder.
These are provided for reference/documentation purposes only. You will not be
required to use them or integrate them, and they are not used at all by the
existing code. They're just here in case you find them helpful, and can be
safely ignored if you don't.

## Linting

Linting provided by ESLint and Prettier.

```
npm run lint
```
