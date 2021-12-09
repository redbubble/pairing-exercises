package prices

import "testing"

func TestPriceList_GetBasePriceForItem_OK(t *testing.T) {
	//Given: a pricelist with one item
	priceList := NewPriceList()
	expectedPrice := 100
	selectedProduct := "hoodie"
	selectedOptions := map[string]string{"size": "small"}

	priceList.AddBasePrice(selectedProduct, map[string][]string{"size": {"small", "large"}}, expectedPrice)

	priceList.AddBasePrice("socks", map[string][]string{"size": {"small", "large"}}, 101)

	//When: the pricelist is asked to get the price for a selection
	actualBasePrice, err := priceList.GetBasePriceForItem(selectedProduct, selectedOptions)
	if err != nil {
		t.Fatalf("Unexpected error fetching price for %s, %v", selectedProduct, selectedOptions)
	}

	//Then: the correct base price is returned
	if actualBasePrice != expectedPrice {
		t.Errorf("Expected a base price of %d but got %d", expectedPrice, actualBasePrice)
	}
}

func TestPriceList_basePrice_matchesMultipleProperties_OK(t *testing.T) {
	//Given: a selection and associated base price
	basePriceItem := basePrice{
		optionTypes{"size": {"small", "large"}, "colour": {"dark", "green"}},
		100,
	}

	selectedOptions := map[string]string{"size": "small", "colour": "green"}

	//When: the base price checks if selected options are applicable
	if !basePriceItem.appliesToSelection(selectedOptions) { //Then: the correct item is matched
		t.Error("base price was expected to apply to selection but failed")
	}
}

func TestPriceList_basePrice_matchesMissingProperties_FAILS(t *testing.T) {
	//Given: a selection with missing propertied and associated base price
	basePriceItem := basePrice{
		optionTypes{"size": {"small", "large"}, "colour": {"dark", "green"}},
		100,
	}

	selectedOptions := map[string]string{"size": "small"}

	//When: the base price checks if selected options are applicable
	if basePriceItem.appliesToSelection(selectedOptions) { //Then: the price is NOT matched
		t.Error("input with missing properties should return false")
	}
}

func TestPriceList_basePrice_matchingUnknownAdditionalProperties_ignored(t *testing.T) {
	//Given: a selection with an unknown property and associated base price
	basePriceItem := basePrice{
		optionTypes{"size": {"small", "large"}, "colour": {"dark", "green"}},
		100,
	}

	selectedOptions := map[string]string{"size": "small", "colour": "green", "weather": "cloudy"}

	//When: the base price checks if selected options are applicable
	if !basePriceItem.appliesToSelection(selectedOptions) { //Then: the price is matched and unknown property ignored
		t.Error("base price was expected to apply to selection but failed")
	}
}

func TestPriceList_basePrice_matchingInvalidSelection_returnsFalse(t *testing.T) {
	//Given: a selection with an invalid selection and associated base price
	basePriceItem := basePrice{
		optionTypes{"size": {"small", "large"}, "colour": {"dark", "green"}},
		100,
	}

	selectedOptions := map[string]string{"size": "small", "colour": "Whisper of Egyptian Sand"}

	//When: the base price checks if selected options are applicable
	if basePriceItem.appliesToSelection(selectedOptions) { //Then: The base price is NOT matched
		t.Error("base price wasn't supposed to match invalid selection")
	}
}
