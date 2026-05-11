# Redbubble Fullstack Pairing Exercise - Price Calculator

## Functional Requirements

You can find the functional requirements at the following URL:
http://take-home-test.herokuapp.com/new-product-engineer

## Dependencies

* Go 1.22
* Some kind of shell terminal (e.g. `bash`, `zsh`) to leverage the `tools.sh` script

## Installation

Use the `tools.sh` script provided (make sure it has executable permissions):

```sh
./tools.sh install
```

Or alternatively, from the project root:

```sh
GOBIN=$(pwd)/bin go install ./cmd/calculator
```

## Running the application

Certain functions are not implemented, and when called will cause the tests to fail
with the message "not implemented".

For the application to work, these will need to be completed. Once you are ready,
use the following instructions to run the application.

```sh
./tools.sh calculator --base-prices=testdata/base-prices.json --cart=testdata/cart-4560.json
```

Or alternatively:

```sh
./bin/calculator --cart=<file> --base-prices=<file>
```

Note: there are many cart test files. The application will need to run with all of them.

## Running the tests

```sh
./tools.sh test
```

To run with coverage:

```sh
./tools.sh cover
```

Or alternatively:

```sh
go test -v ./...
```

## Test data

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
