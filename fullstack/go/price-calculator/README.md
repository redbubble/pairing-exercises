# RedBubble price calculator

## Dependencies

* This was written with Go 1.16 but should be fine with 1.13+
* Some kind of bash terminal to leverage the `build.sh` script

## Build & run 

### The easy way
Use the `build.sh` script provided (make sure it has executable permisiions)

* Build and run `./build.sh calculate testdata/provided/cart-4560.json testdata/provided/base-prices.json`
* Tests `./build.sh test`
* Coverage `./build.sh coverage`

### Alternatively

* To build from the project root `GOBIN=$(pwd)/bin go install ./...` 
* Then run `./bin/calculate -cartFile=<cartFile> -pricesFile=<priceFile>`
