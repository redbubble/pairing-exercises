package main

import (
	"testing"
)

//Test_CalculatesProvidedTestExamples_OK is a general happy path sanity test to validate that the example json data
//is deserialised as expected and passes given criteria
func Test_CalculatesProvidedTestExamples_OK(t *testing.T) {
	type args struct {
		cartFilePath  string
		priceListPath string
	}

	tests := []struct {
		name          string
		args          args
		wantCostCents int
	}{
		{"cart-4560.json",
			args{"../../../testdata/provided/cart-4560.json", "../../../testdata/provided/base-prices.json"},
			4560,
		},
		{"cart-9363.json",
			args{"../../../testdata/provided/cart-9363.json", "../../../testdata/provided/base-prices.json"},
			9363,
		},
		{"cart-9500.json",
			args{"../../../testdata/provided/cart-9500.json", "../../../testdata/provided/base-prices.json"},
			9500,
		},
		{"cart-11356.json",
			args{"../../../testdata/provided/cart-11356.json", "../../../testdata/provided/base-prices.json"},
			11356,
		},
		{"cart-with-errors.json",
			args{"../../../testdata/errors/cart-with-errors.json", "../../../testdata/provided/base-prices.json"},
			0,
		},
		{"base prices with errors",
			args{"../../../testdata/provided/cart-11356.json", "../../../testdata/errors/base-prices-with-errors.json"},
			11356,
		},
		{"base prices with duplicates",
			args{"../../../testdata/provided/cart-11356.json", "../../../testdata/errors/base-prices-with-duplicates.json"},
			13000,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if gotCostCents := calculate(tt.args.cartFilePath, tt.args.priceListPath); gotCostCents != tt.wantCostCents {
				t.Errorf("calculated cost = %v, want %v", gotCostCents, tt.wantCostCents)
			}
		})
	}
}
