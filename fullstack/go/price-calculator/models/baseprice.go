package models

import (
	"reflect"
)

type ProductBasePrice struct {
	ProductType string `json:"product-type"`

	// Key-value pairs of strings. The value is an array and the base-price applies to all
	// the strings in that array.
	Options map[string][]string `json:"options"`

	// The base price for this product-type and option combination in cents.
	Price int `json:"base-price"`
}

func (price ProductBasePrice) Equal(other ProductBasePrice) bool {
	if price.ProductType != other.ProductType {
		return false
	}
	if price.Price != other.Price {
		return false
	}
	if !reflect.DeepEqual(price.Options, other.Options) {
		return false
	}

	return true
}
