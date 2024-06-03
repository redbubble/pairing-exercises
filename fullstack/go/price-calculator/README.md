# Redbubble Fullstack Pairing Exercise - Price Calculator

## Functional Requirements

You can find the functional requirements at the following URL:
http://take-home-test.herokuapp.com/new-product-engineer

## Dependencies

* Go 1.22
* Some kind of shell terminal (e.g. `bash`, `zsh`) to leverage the `tools.sh` script

## Your mission, 007

Some functions are not implemented (that's where you come in!). These will cause the
tests to fail with the message "not implemented".

For the application to work, these will need to be implemented. Once you are ready,
see below on how to run the application and its tests.

We recommend implementing the functions in the below order. It is of course up to you!

* managers.ProductBasePriceManager.Lookup
* models.CartItem.CalculatePrice
* managers.CartManager.CalculateTotalPrices

We also highly recommend using an IDE with Golang autocomplete enabled. It is a very
useful feature and can save time for more interesting things during your interview!

## The data

The required test data can be found in the `./testdata` folder. It contains
a file of product base prices (`base-prices.json`), and several example carts
(`cart-%d.json`). The price calculator program will need both a base prices
file and a cart file.

### Schemas

JSON schemas for the test data can be found in the `./schemas` folder. These
are provided for reference/documentation purposes only. You will not be required
to use them or integrate them, and they are not used at all by the existing code.
They're just here in case you find them helpful, and can be safely ignored if
you don't.

## Running the application

### The easy way

Use the `tools.sh` script provided (make sure it has executable permissions).

To build the application:

```sh
./tools.sh install
```

To run it:

```sh
./tools.sh calculator --base-prices=testdata/base-prices.json --cart=testdata/cart-4560.json
```

Note: there are many cart test files. The application will need to run with all of them.

### The alternative way

* To build from the project root `GOBIN=$(pwd)/bin go install ./cmd/calculator` 
* Then run `./bin/calculator --cart=<file> --base-prices=<file>`

## Running the test suite

### The easy way

* Run tests: `./tools.sh test`
* Run tests with coverage: `./tools.sh cover`

### The alternative way

* Run manually: `go test -v ./...`
