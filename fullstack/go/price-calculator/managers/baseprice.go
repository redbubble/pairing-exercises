package managers

import (
	"encoding/json"
	"log"
	"os"

	"redbubble.com/calculator/models"
)

type ProductBasePriceManager struct {
	Data map[string][]models.ProductBasePrice
}

func ProductBasePriceManagerFromFile(pricesFile string) (ProductBasePriceManager, error) {
	pricesRaw, err := os.ReadFile(pricesFile)
	if err != nil {
		return ProductBasePriceManager{}, err
	}

	var items []models.ProductBasePrice
	if err := json.Unmarshal(pricesRaw, &items); err != nil {
		return ProductBasePriceManager{}, err
	}

	mgr := ProductBasePriceManager{
		Data: map[string][]models.ProductBasePrice{},
	}
	for _, item := range items {
		mgr.Data[item.ProductType] = append(mgr.Data[item.ProductType], item)
	}

	return mgr, nil
}

func (mgr ProductBasePriceManager) Lookup(
	productType string,
	options map[string]string,
) (price models.ProductBasePrice, found bool) {
	log.Fatalf("not implemented")
	return models.ProductBasePrice{}, false
}
