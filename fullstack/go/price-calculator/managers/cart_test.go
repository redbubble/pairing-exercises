package managers

import (
	"fmt"
	"testing"
)

func TestLookupPriceAndCalculateTotal(t *testing.T) {
	basePriceMgr := loadBasePriceManager(t)

	for idx, expectedTotal := range []int{4560, 9363, 9500, 11356} {
		cartFileName := fmt.Sprintf("../testdata/cart-%d.json", expectedTotal)
		t.Run(fmt.Sprintf("%d", idx), func(t *testing.T) {
			testCartByFile(basePriceMgr, cartFileName, expectedTotal, t)
		})
	}
}

func testCartByFile(basePriceMgr ProductBasePriceManager, fileName string, expectedTotal int, t *testing.T) {
	cartMgr, err := CartManagerFromFile(basePriceMgr, fileName)
	if err != nil {
		t.Fatal(err)
	}

	result := cartMgr.CalculateTotalPrices()
	if result != expectedTotal {
		t.Fatal(result, "!=", expectedTotal)
	}
}
