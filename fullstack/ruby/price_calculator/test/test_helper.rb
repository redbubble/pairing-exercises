require 'cart/managers/base_price_manager'

DATA_DIR = File.join(__dir__, 'data')

def base_price_manager
  BasePriceManager.new(json_file: File.join(DATA_DIR, 'base-prices.json'))
end