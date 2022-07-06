# Redbubble Fullstack Pairing Exercise - Price Calculator

## Functional Requirements

You can find the functional requirements at the following URL:
http://take-home-test.herokuapp.com/new-product-engineer

## Dependencies

- ruby 3.1.2 (although it works on 2.7.6)

## Install

We recommend installing Ruby via [asdf](https://asdf-vm.com/) or [rbenv](https://github.com/rbenv/rbenv) however you could also work with Docker.  For example here is how you could run all the tests with Docker:

```shell
docker run -it --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:3.1.2 rake test
```

## Run the micro app

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


## Run the test suite

Certain tests will fail due to the `NotImplementedError`. Running the test suite
will show you which parts of the application need to be finished.

```shell
rake test
```

To run a single test file

```shell
rake test TEST=test/cart/managers/cart_manager_test.rb
```

or

```shell
ruby -I test -I lib test/cart/models/base_price_test.rb
```

## Note

This skeleton project is purposely not great code. We're interested in your opinion on how you would improve it. 