package cart

import (
	"testing"

	"redbubble.com/calculator/app/prices"
)

func TestCart_CalculateCostCents_SingleItem_OK(t *testing.T) {
	//Given: A single item and pricelist
	cartItems := []ProductSelection{
		{
			"hoodie",
			map[string]string{"size": "large"},
			20,
			3,
		},
	}

	priceList := prices.NewPriceList()
	priceList.AddBasePrice("hoodie", map[string][]string{"size": {"large", "small"}}, 100)

	c := &Cart{
		Items: cartItems,
	}

	expectedTotalCost := 360

	//When: the cost is calculated
	got := c.CalculateTotalCostCents(priceList)

	//Then: the cost is what we expect
	if got != expectedTotalCost {
		t.Errorf("CalculateTotalCostCents() = %v, want %v", got, expectedTotalCost)
	}
}

func TestCart_CalculateCostCents_MultipleItems_OK(t *testing.T) {
	//Given: A multiple cart items and pricelist
	cartItems := []ProductSelection{
		{
			"hoodie",
			map[string]string{"size": "large"},
			20,
			3,
		},
		{
			"sticker",
			map[string]string{"size": "huge"},
			10,
			3,
		},
	}

	priceList := prices.NewPriceList()
	priceList.AddBasePrice("hoodie", map[string][]string{"size": {"large", "small"}}, 1000)
	priceList.AddBasePrice("sticker", map[string][]string{"size": {"huge"}}, 100)

	c := &Cart{
		Items: cartItems,
	}

	expectedTotalCost := 3930

	//When: cart cost is calculated
	got := c.CalculateTotalCostCents(priceList)

	//Then: the cost is what we expect
	if got != expectedTotalCost {
		t.Errorf("CalculateTotalCostCents() = %v, want %v", got, expectedTotalCost)
	}
}
