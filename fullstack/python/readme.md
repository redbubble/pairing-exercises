# Skeleton for Redbubble Pairing Exercise

## Requirements

- Python 3.8.1 or later
- Pipenv (install as instructed [here](https://github.com/pypa/pipenv#installation))
(optional, but it's more convenient than the factory-included `pip`)

## Install dependencies

Make sure you are at the same location with `Pipfile` and `requirements.txt`.

### Using Pipenv

Use Pipenv to install the dependencies with the `--dev` flag so that you can run the test suite later.

```shell script
# Install dependencies with pipenv
# Use --dev flag to run the test suite later
$ pipenv install --dev

# Start a new shell with virtual environment enabled.
$ pipenv shell
```

### Using pip and requirements.txt

Pip of course can be used to install the dependencies. Please follow the steps below to have the micro app up and running.

```shell script
# Create a new virtual environment (Python 3.4+)
$ python -m venv <DIR> 

# Start virtual environment
$ source <DIR>/bin/activate

# Install the dependencies
$ pip install -r requirements.txt
```

## Run the micro app

```shell script
# Now you can run the Python CLI app. Use --help to show the options
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

```shell script
# Run the test suite with coverage
$ pytest --cov
```
