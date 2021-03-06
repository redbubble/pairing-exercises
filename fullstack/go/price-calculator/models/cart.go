package models

import "log"

type CartItem struct {
	ProductType string                 `json:"product-type"`
	Options     map[string]interface{} `json:"options"`

	// The artist markup in percentile. E.g. 20 would be 20% in markup.
	ArtistMarkup int `json:"artist-markup"`

	// The quantity of this item.
	Quantity int `json:"quantity"`

	// The base price object of this item
	BasePrice *ProductBasePrice `json:"-"`
}

func (item CartItem) CalculatePrice() int {
	log.Fatalf("not implemented")
	return 0
}
