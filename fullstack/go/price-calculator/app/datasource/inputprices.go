package datasource

import "sort"

type RawProductPrice struct {
	ProductType string              `json:"product-type"`
	Options     map[string][]string `json:"options"`
	BasePrice   int                 `json:"base-price"`
}

/*RawPriceList and it's associated types are used to unmarshall json data.
	Since the incoming format isn't efficient for price lookups it gets sanitised
    and converted into a more efficient data structure after unmarshalling
*/
type RawPriceList struct {
	Items []RawProductPrice
}

//Hash is used to check for duplicate basePrices
//- this is most likely a bit over the top for this exercise but I was curious
func (r RawProductPrice) Hash() string {
	keys := make([]string, 0, len(r.Options))
	for k := range r.Options {
		keys = append(keys, k)
	}

	sort.Strings(keys)

	hash := r.ProductType
	for _, key := range keys {
		hash += key

		sort.Strings(r.Options[key])

		for _, option := range r.Options[key] {
			hash += option
		}
	}

	return hash
}
