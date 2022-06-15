package managers

import "testing"

func loadBasePriceManager(t *testing.T) ProductBasePriceManager {
	t.Helper()
	mgr, err := ProductBasePriceManagerFromFile("../testdata/base-prices.json")
	if err != nil {
		t.Fatal(err)
	}
	return mgr
}
