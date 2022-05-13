# Redbubble Coding Test - Price Calculator

### Development Notes

[Some thoughts before, during and after development](./NOTES.md)

### Dependencies

- ruby 2.6.3
- bundler 2.0.2
- rspec 3.8.0

### Set up

rbenv was used to manage ruby environments in this project.
To install rbenv run:

```shell
brew install rbenv

rbenv init

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
```

Then close your terminal and reopen it.

To install ruby 2.6.3 run:

```shell
rbenv install 2.6.3
```

To use ruby 2.6.3 locally

```shell
rbenv local 2.6.3
```

To install bundler run:

```shell
gem install bundler
```

To install all other gems run:

```shell
bundle install
```

### Running Test

RSpec was used to build the test suite for this application. Please follow the
set up instructions to ensure RSpec is installed.
Tests are configured to run in documentation mode so that contexts and
expectations are easier to understand.

To run the test suite:

```shell
bundle exec rspec spec
```

### Running the application

To run the application with one of the given files.
Available carts:

- `cart-0.json`
- `cart-4560.json`
- `cart-9363.json`
- `cart-9500.json`
- `cart-11356.json`

```shell
ruby app.rb cart-4560.json base-prices.json
```

To run the application with a new cart file, add it to the `/public/carts` folder. To run the application with a new base prices file, add it to the
`/public/prices` folder, then run:

```shell
ruby app.rb <new cart filename> <new base prices filename>
```

### Running benchmarks

```shell
ruby ./benchmark/search.rb
```

[Notes on benchmark results](./NOTES.md#building-a-better-search)
