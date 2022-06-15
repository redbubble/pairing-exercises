package managers

import (
	"fmt"
	"testing"
)

func TestLookupPriceAndCalculateTotal(t *testing.T) {
	basePriceMgr := loadBasePriceManager(t)

	for idx, tc := range []struct {
		amount int
	}{
		{9363},
		{9500},
		{11356},
	} {
		t.Run(fmt.Sprintf("%d", idx), func(t *testing.T) {
			cartFileName := fmt.Sprintf("../testdata/cart-%d.json", tc.amount)
			cartMgr, err := CartManagerFromFile(basePriceMgr, cartFileName)
			if err != nil {
				t.Fatal(err)
			}
			result := cartMgr.CalculateTotalPrices()
			if result != tc.amount {
				t.Fatal(result, "!=", tc.amount)
			}
		})
	}
}
