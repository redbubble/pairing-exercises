package main

import (
	"flag"
	"log"

	"redbubble.com/calculator/app/cart"
	"redbubble.com/calculator/app/datasource"
	"redbubble.com/calculator/app/prices"
)

/* This command is used to call the calculation from the command line
it has 2 mandatory flags:
* cartFile - the path to the json input file representing a cart of items
* pricesFile - the path to the json input file representing a list of prices used to calculate cost

USAGE: ./calculate -cartFile=<cartFile> -pricesFile=<priceFile>
*/
func main() {
	var (
		cartFile   = flag.String("cartFile", "", "the json shopping cart file to be used in the calculation")
		pricesFile = flag.String("pricesFile", "", "the json price file to be used in the calculation")
	)

	flag.Parse()

	if cartFile == nil || *cartFile == "" || pricesFile == nil || *pricesFile == "" {
		log.Fatal("USAGE command should be in the format: " +
			"`calculate -cartFile=<exampleCart.json> -pricesFile=<examplePriceList.json>`")
	}

	price := calculate(*cartFile, *pricesFile)

	println(price)
}

func calculate(cartFile string, pricesFile string) int {
	cartData, priceList := loadData(cartFile, pricesFile)
	return cartData.CalculateTotalCostCents(priceList)
}

func loadData(cartFilePath string,
	priceListPath string,
) (*cart.Cart, *prices.PriceList) {
	c, err := datasource.LoadCartData(cartFilePath)
	if err != nil {
		log.Fatalf("error loading cart data from %s: %v", cartFilePath, err)
		return nil, nil
	}

	p, err := datasource.LoadPriceData(priceListPath)
	if err != nil {
		log.Fatalf("error loading price data from %s: %v", priceListPath, err)
	}

	//we use and alternative representation for the pricelist for performance reasons
	pl := prices.NewPriceList()

	for _, i := range p.Items {
		pl.AddBasePrice(i.ProductType, i.Options, i.BasePrice)
	}

	return c, pl
}
