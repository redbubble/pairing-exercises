# Skeleton for Redbubble's Pairing Exercise

## Functional Requirements

You can find the function requirements at the following URL:
http://take-home-test.herokuapp.com/new-product-engineer

## Requirements

- Python 3.8 or later
- Pipenv (install as instructed [here](https://github.com/pypa/pipenv#installation))
(optional, but it's more convenient than the factory-included `pip`)

## Install

During your Code Interview round, you will be given a repository to clone
(where this README.md file came from). Once you have done that, make sure you
are at the same location with `Pipfile` and `requirements.txt`.

### Using Pipenv

Use Pipenv to install the dependencies with the `--dev` flag so that you can run
the test suite later.

```shell script
# Install dependencies with pipenv
# Use --dev flag to run the test suite later
$ pipenv install --dev

# Start a new shell with virtual environment enabled.
$ pipenv shell
```

### Using pip and requirements.txt

Pip of course can be used to install the dependencies. Please follow the steps
below to have the micro app up and running.

```shell script
# Create a new virtual environment (Python 3.4+)
$ python -m venv <DIR> 

# Start virtual environment
$ source <DIR>/bin/activate

# Install the dependencies
$ pip install -r requirements.txt
```

## Run the micro app

Certain functions are not implemented, and when called will raise a
`NotImplementedError`.

For the application to work, these will need to be completed. Once you are
ready, use the following instructions to run the application.

```shell script
# Run the Python CLI app. Use --help to show the options
$ python main.py --help

Usage: main.py [OPTIONS]

Options:
  -c, --cart TEXT         Path to a JSON file representing a cart  [required]
  -p, --base-prices TEXT  Path to a JSON file representing a list of base
                          prices  [required]
  --help                  Show this message and exit.

# For example
$ python main.py -c app/cart/tests/data/cart-9363.json -p app/cart/tests/data/base-prices.json

$ python main.py -c app/cart/tests/data/cart-11356.json -p app/cart/tests/data/base-prices.json
```

## Run the test suite

Certain tests will fail due to the `NotImplementedError`. Running the test suite
will show you which parts of the application need to be finished.

```shell script
# Run the test suite with coverage
$ pytest app/cart
```
