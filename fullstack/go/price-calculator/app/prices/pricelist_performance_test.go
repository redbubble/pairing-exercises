package prices

import (
	"strconv"
	"testing"
	"time"
)

//TestPriceList_Performance_OK validates that the peformance of looking up a price from
//a small or large PriceList is near constant. results are rounded to the nearest millisecond for consistency
func TestPriceList_Performance_OK(t *testing.T) {
	priceList := NewPriceList()
	selectedProduct := "widget"
	selectedOptions := map[string]string{"size": "small", "colour": "blue", "voltage": "12"}

	//add 100,000 base prices
	for i := 0; i < 100000; i++ {
		priceProductType := selectedProduct + strconv.Itoa(i)
		priceList.AddBasePrice(priceProductType, map[string][]string{"size": {"small", "large", "huge"},
			"colour":  {"blue", "green"},
			"voltage": {"5", "12"}}, i)
	}

	start := time.Now().UnixNano()

	_, err := priceList.GetBasePriceForItem("widget99", selectedOptions)

	largeLookupNanos := time.Now().UnixNano() - start

	if err != nil {
		t.Fatalf("Unexpected error fetching price for %s, %v", selectedProduct, selectedOptions)
	}

	priceList = NewPriceList()
	//this time just add one item
	priceList.AddBasePrice(selectedProduct, map[string][]string{"size": {"small", "large", "huge"},
		"colour":  {"blue", "green"},
		"voltage": {"5", "12"}}, 1)

	start = time.Now().UnixNano()
	_, err = priceList.GetBasePriceForItem(selectedProduct, selectedOptions)
	smallLookupNanos := time.Now().UnixNano() - start

	if err != nil {
		t.Fatalf("Unexpected error fetching price for %s, %v", selectedProduct, selectedOptions)
	}

	//Then: the correct base price is returned
	if ms(largeLookupNanos) > ms(smallLookupNanos) {
		t.Errorf("Not fast enough! large pricelist took %d nanos,"+
			" while small pricelist took %d nanos to look up data", largeLookupNanos, smallLookupNanos)
	}
}

func ms(nanos int64) int64 {
	return nanos / 1000000
}
