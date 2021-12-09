package cart

import (
	"log"

	"redbubble.com/calculator/app/prices"
)

//Cart represents a bunch of products a customer selected.
type Cart struct {
	Items []ProductSelection `json:"items"`
}

//ProductSelection represents a product line item of the Cart
type ProductSelection struct {
	ProductType  string            `json:"product-type"`
	Options      map[string]string `json:"options"`
	ArtistMarkup int               `json:"artist-markup"`
	Quantity     int               `json:"quantity"`
}

//IsValid checks that sensible values have been set
func (s ProductSelection) IsValid() bool {
	if s.ProductType == "" {
		log.Printf("ERROR: product selection has empty product type. %v", s)
		return false
	}

	if s.Quantity < 0 {
		log.Printf("ERROR: quantity must be >= 0. %v", s)
		return false
	}

	if s.ArtistMarkup < 0 {
		log.Printf("ERROR: artist markup must be >= 0. %v", s)
		return false
	}

	if s.Options == nil {
		return false
	}

	return true
}

//CalculateTotalCostCents calculates total cost of all items in a cart based on a given base price list
func (c *Cart) CalculateTotalCostCents(priceList *prices.PriceList) int {
	var totalCost int

	for _, item := range c.Items {
		price, err := priceList.GetBasePriceForItem(item.ProductType, item.Options)
		if err != nil {
			log.Printf("%v", err)
		}

		totalCost += c.calculateItemCost(price, item.ArtistMarkup, item.Quantity)
	}

	return totalCost
}

//calculateItemCost calculates the cost of individual items.
//The formula is hard coded here but as an evolution we could inject this calculation or even an alternative one
func (c *Cart) calculateItemCost(price int, artistMarkup int, quantity int) int {
	artistMarkupPercentage := float64(artistMarkup) / 100
	unitCost := float64(price) + float64(price)*artistMarkupPercentage
	selectionCost := unitCost * float64(quantity)

	return int(selectionCost)
}
