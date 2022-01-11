from typing import List

from app.cart.managers.base_price_manager import ProductBasePriceManager
from app.cart.models.cart_item import CartItem
from app.common.models.converters import from_list
from app.common.utils import read_json


class CartManager:
    data: List[CartItem]

    def __init__(self, json_file=None):
        self.data = []
        self.read_json(json_file)

    def read_json(self, json_file):
        raw_data = read_json(json_file)

        self.data = from_list(CartItem.from_dict, raw_data)

    def lookup_price(self, base_price_manager: ProductBasePriceManager):
        for cart_item in self.data:
            cart_item.base_price = base_price_manager.lookup(
                product_type=cart_item.product_type,
                options=cart_item.options
            )

    def calculate_total_prices(self):
        return sum(cart_item.calculate_price() for cart_item in self.data)
