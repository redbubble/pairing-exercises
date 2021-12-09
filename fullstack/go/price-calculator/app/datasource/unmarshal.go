package datasource

import (
	"encoding/json"
	"errors"
	"io/ioutil"
	"log"

	"redbubble.com/calculator/app/cart"
)

//LoadCartData loads Cart data from a json file and validates the input.
//Any invalid items will stop the process and an error to be logged.
//We wouldn't want to confuse our customers!
func LoadCartData(cartFilePath string) (*cart.Cart, error) {
	cartFileData, err := ioutil.ReadFile(cartFilePath)
	if err != nil {
		return nil, err
	}

	var selections []cart.ProductSelection

	err = json.Unmarshal(cartFileData, &selections)
	if err != nil {
		return nil, err
	}

	cartError := validateCartSelections(selections)
	if cartError != nil {
		log.Printf("Errors were found loading cart %s. This cart was rejected", cartFilePath)
		return &cart.Cart{Items: nil}, nil
	}

	return &cart.Cart{Items: selections}, err
}

func validateCartSelections(selections []cart.ProductSelection) error {
	valid := true

	for _, selection := range selections {
		if !selection.IsValid() {
			valid = false
		}
	}

	var err error

	if !valid {
		err = errors.New("there were errors with the cart. Check logs for details. Cart has been rejected")
	}

	return err
}

//LoadPriceData loads base price data from a json file and validates the input.
//Error items are logged and left off the price list.
//This is because we wouldn't want to block all transactions because of a single dodgy entry
//If duplicates are found only the first item is used and an error logged
func LoadPriceData(priceFilePath string) (*RawPriceList, error) {
	priceFileData, err := ioutil.ReadFile(priceFilePath)
	if err != nil {
		return nil, err
	}

	var priceListData []RawProductPrice

	err = json.Unmarshal(priceFileData, &priceListData)
	if err != nil {
		return nil, err
	}

	priceListData, err = sanitisePrices(priceListData)
	if err != nil {
		log.Printf("Errors were found loading %s, invalid prices were removed. "+
			"Checking input file is recommended", priceFilePath)
	}

	return &RawPriceList{
		Items: priceListData,
	}, nil
}

func sanitisePrices(prices []RawProductPrice) ([]RawProductPrice, error) {
	foundErrors := false
	existingHashes := make(map[string]bool)

	var goodPrices []RawProductPrice

	for _, price := range prices {
		if price.BasePrice < 0 {
			foundErrors = true

			log.Printf("Negative price found, Removing from pricelist %v", price)

			continue
		}

		if price.ProductType == "" {
			foundErrors = true

			log.Printf("product-type property emopty, Removing from pricelist %v", price)

			continue
		}

		hash := price.Hash()

		_, exists := existingHashes[hash]
		if exists {
			foundErrors = true

			log.Printf("Found duplicate base price, ignoring %v", price)

			continue
		} else {
			existingHashes[hash] = true
		}

		goodPrices = append(goodPrices, price)
	}

	var err error

	if foundErrors {
		err = errors.New("invalid data was found in price list. Invalid entries were removed")
	}

	return goodPrices, err
}
