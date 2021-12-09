# RedBubble price calculator

##Dependencies
* this was written with Go 1.16 but should be fine with 1.13+
* some kind of bash terminal to leverage the `build.sh` script

## Build & run 
###The easy way
use the `build.sh` script provided (make sure it has executable permisiions)
* build and run `./build.sh calculate testdata/provided/cart-4560.json testdata/provided/base-prices.json`
* tests `./build.sh test`
* coverage `./build.sh coverage`

###Alternatively
* to build from the project root `GOBIN=$(pwd)/bin go install ./...` 
* then run `./bin/calculate -cartFile=<cartFile> -pricesFile=<priceFile>`
