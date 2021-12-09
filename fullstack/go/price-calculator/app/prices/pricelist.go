package prices

import (
	"fmt"
)

//PriceList is a structure where we do base price lookups.
//it's designed with performance in mind even with the potential of a large number of base prices
type PriceList struct {
	prices productBasePrices
}

type productBasePrices map[string]basePrices

type basePrices []basePrice

type basePrice struct {
	options optionTypes
	price   int
}

type optionTypes map[string]optionList

type optionList []string

func (l optionList) hasOption(selection string) bool {
	for _, option := range l {
		if selection == option {
			return true
		}
	}

	return false
}

func (c basePrice) appliesToSelection(optionsSelected map[string]string) bool {
	//for each relevant selectable option check that a valid option was submitted
	for selectableType, options := range c.options {
		selected, exists := optionsSelected[selectableType]
		if !exists || !options.hasOption(selected) {
			return false
		}
	}

	return true
}

func NewPriceList() *PriceList {
	return &PriceList{prices: make(productBasePrices)}
}

//AddBasePrice is the primary point for adding data to the PriceList data structure
func (priceList *PriceList) AddBasePrice(productType string, options map[string][]string, basePrice int) {
	priceListForProduct, exist := priceList.prices[productType]
	if !exist {
		priceListForProduct = basePrices{}
	}

	pg := createMappedBasePrice(basePrice, options)

	priceListForProduct = append(priceListForProduct, *pg)
	priceList.prices[productType] = priceListForProduct
}

//GetBasePriceForItem looks up the base price for a particular productType & selected option combo
func (priceList *PriceList) GetBasePriceForItem(productType string, options map[string]string) (int, error) {
	productBasePrices := priceList.prices[productType]
	for _, bp := range productBasePrices {
		if bp.appliesToSelection(options) {
			return bp.price, nil
		}
	}

	return 0, fmt.Errorf("couldn't find base price for \"%s\" with options %v", productType, options)
}

func createMappedBasePrice(price int, options map[string][]string) *basePrice {
	pg := basePrice{
		options: make(map[string]optionList),
		price:   price,
	}
	for oType, oList := range options {
		pg.options[oType] = oList
	}

	return &pg
}
