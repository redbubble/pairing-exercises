package datasource

import (
	"testing"
)

func Test_UnmarshalsPriceList_OK(t *testing.T) {
	//Given a price file
	path := "../../testdata/provided/base-prices.json"

	//When the file is unmarshalled
	priceList, err := LoadPriceData(path)
	if err != nil {
		t.Fatalf("Failed to load price data from %s: %v", path, err)
	}

	//We expect the number of items unmarshaled to be the same as the input file
	expectedItems := 10
	if len(priceList.Items) != expectedItems {
		t.Errorf("Expected %d items to be unmarshalled but got %d", expectedItems, len(priceList.Items))
	}
}
