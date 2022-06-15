package managers

import (
	"encoding/json"
	"os"

	"redbubble.com/calculator/models"
)

type CartManager struct {
	ProductBasePriceManager ProductBasePriceManager
	Items                   []models.CartItem
}

func CartManagerFromFile(basePriceManager ProductBasePriceManager, cartFile string) (CartManager, error) {
	cartRaw, err := os.ReadFile(cartFile)
	if err != nil {
		return CartManager{}, err
	}

	var items []models.CartItem
	if err := json.Unmarshal(cartRaw, &items); err != nil {
		return CartManager{}, err
	}

	return CartManager{
		ProductBasePriceManager: basePriceManager,
		Items:                   items,
	}, nil
}

func (mgr CartManager) CalculateTotalPrices() int {
	panic("not implemented")
}
