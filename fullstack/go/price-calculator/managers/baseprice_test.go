package managers

import (
	"reflect"
	"testing"

	"redbubble.com/calculator/models"
)

func TestLookupSingleOptionItem(t *testing.T) {
	mgr := loadBasePriceManager(t)
	result, found := mgr.Lookup(
		"hoodie",
		map[string]string{
			"size":   "large",
			"colour": "white",
		},
	)
	if !found {
		t.Fatal()
	}

	expected := models.ProductBasePrice{
		ProductType: "hoodie",
		Options: map[string][]string{
			"colour": {"white"},
			"size":   {"large"},
		},
		Price: 3848,
	}
	if !reflect.DeepEqual(result, expected) {
		t.Fatal(result, "!=", expected)
	}
}

func TestLookupMultipleOptionItem(t *testing.T) {
	mgr := loadBasePriceManager(t)
	result, found := mgr.Lookup(
		"hoodie",
		map[string]string{
			"size":   "small",
			"colour": "dark",
		},
	)
	if !found {
		t.Fatal()
	}

	expected := models.ProductBasePrice{
		ProductType: "hoodie",
		Options: map[string][]string{
			"colour": {"white", "dark"},
			"size":   {"small", "medium"},
		},
		Price: 3800,
	}
	if !reflect.DeepEqual(result, expected) {
		t.Fatal(result, "!=", expected)
	}
}

func TestLookupZeroOptionItem(t *testing.T) {
	mgr := loadBasePriceManager(t)
	result, found := mgr.Lookup("leggings", nil)
	if !found {
		t.Fatal()
	}

	expected := models.ProductBasePrice{
		ProductType: "leggings",
		Options:     map[string][]string{},
		Price:       5000,
	}
	if !reflect.DeepEqual(result, expected) {
		t.Fatal(result, "!=", expected)
	}
}
