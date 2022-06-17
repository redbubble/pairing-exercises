package models

import "testing"

func TestCalculatePrice(t *testing.T) {
	basePrice := ProductBasePrice{
		ProductType: "hoodie",
		Price:       3800,
	}
	cartItem := CartItem{
		BasePrice:    &basePrice,
		ArtistMarkup: 20,
		Quantity:     2,
		ProductType:  "hoodie",
	}
	result := cartItem.CalculatePrice()
	expected := 9120
	if result != expected {
		t.Fatal(expected, "!=", result)
	}
}
