# Skeleton for Pairing Exercise (JS)

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

## Usage

Options:

| Option name | Type   | Required | Description           |
| :---------: | ------ | :------: | --------------------- |
|    cart     | String |   Yes    | File name of the cart |
|   prices    | String |   Yes    | File name for prices  |

### Example

---

```
node bin/price-calculator --cart cart-4560 --prices base-prices
```

Using prompts:

```
node bin/price-calculator
```
