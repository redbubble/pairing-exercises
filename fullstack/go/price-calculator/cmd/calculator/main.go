package main

import (
	"errors"
	"flag"
	"fmt"
	"log"
	"os"

	"redbubble.com/calculator/managers"
)

var errUsage = errors.New("Usage: calculate --cart=<jsonfile> --base-prices=<jsonfile>")

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}
}

func run() error {
	var cartFile string
	var pricesFile string

	fs := flag.NewFlagSet("", 0)
	fs.StringVar(&cartFile, "cart", "", "Path to a JSON file representing a cart")
	fs.StringVar(&pricesFile, "base-prices", "", "Path to a JSON file representing a list of base prices")
	if err := fs.Parse(os.Args[1:]); err != nil {
		return err
	}
	if cartFile == "" || pricesFile == "" {
		return errUsage
	}

	basePriceManager, err := managers.ProductBasePriceManagerFromFile(pricesFile)
	if err != nil {
		return err
	}

	cartManager, err := managers.CartManagerFromFile(
		basePriceManager,
		cartFile,
	)
	if err != nil {
		return err
	}

	total := cartManager.CalculateTotalPrices()
	fmt.Println(total)

	return nil
}
