# Redbubble Fullstack Pairing Exercise - Price Calculator

## Functional Requirements

You can find the functional requirements at the following URL:
http://take-home-test.herokuapp.com/new-product-engineer

## Dependencies

* Go 1.16
* Some kind of bash terminal to leverage the `tools.sh` script

## Install & run

Certain functions are not implemented, and when called will panic with
the message "not implemented".

For the application to work, these will need to be completed. Once you are
ready, use the following instructions to run the application.

### The easy way

Use the `tools.sh` script provided (make sure it has executable permissions):

```sh
./tools.sh calculator \
    --base-prices=testdata/base-prices.json \
    --cart=testdata/cart-4560.json
```

### Alternatively

* To build from the project root `GOBIN=$(pwd)/bin go install ./cmd/calculator` 
* Then run `./bin/calculator --cart=<file> --base-prices=<file>`

## Run the test suite

Certain tests will fail due to the `NotImplementedError`. Running the test suite
will show you which parts of the application need to be finished.

### The easy way

* Run tests: `./tools.sh test`
* Run tests with coverage: `./tools.sh cover`

### Alternatively

* Run manually: `go test -v ./...`

## Test data

The required test data can be found in the `./testdata` folder. It contains
a file of product base prices (`base-prices.json`), and several example carts
(`cart-%d.json`). The price calculator program will need both a base prices
file and a cart file.

