# Redbubble Fullstack Pairing Exercise - Price Calculator

## Functional Requirements

You can find the functional requirements in the [functional-requirements](../../functional-requirements/Readme.md) folder.

## Dependencies

- ruby 3.4.8

## Installation

We recommend installing Ruby via [asdf](https://asdf-vm.com/) or [rbenv](https://github.com/rbenv/rbenv).

Alternatively you can work with Docker:

```shell
docker run -it --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:3.1.2 rake test
```

## Running the application

Certain functions are not implemented, and when called will raise a
`NotImplementedError`.

For the application to work, these will need to be completed. Once you are
ready, use the following instructions to run the application.

```shell
$ ruby main.rb --help
Usage: main [options]
    -c, --cart STRING                Path to a JSON file representing a cart
    -p, --base-prices STRING         Path to a JSON file representing a list of base prices
    -h, --help                       Prints this help


$ ruby main.rb -c test/data/cart-11356.json -p test/data/base-prices.json
11356

```

## Running the tests

Certain tests will fail due to the `NotImplementedError`. Running the test suite
will show you which parts of the application need to be finished.

```shell
rake test
```

To run a single test file:

```shell
rake test TEST=test/cart/managers/cart_manager_test.rb
```

or

```shell
ruby -I test -I lib test/cart/models/base_price_test.rb
```

## Test data

The required test data can be found in the `./test/data` folder. It contains
a file of product base prices (`base-prices.json`), and several example carts
(`cart-%d.json`). The price calculator program will need both a base prices
file and a cart file.

### Schemas

JSON schemas for the test data can be found in the [functional-requirements](../../functional-requirements) folder.
These are provided for reference/documentation purposes only. You will not be
required to use them or integrate them, and they are not used at all by the
existing code. They're just here in case you find them helpful, and can be
safely ignored if you don't.
