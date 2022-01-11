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

    def set_base_price(self, base_price_manager: ProductBasePriceManager):
        raise NotImplementedError

    def calculate_total_prices(self):
        raise NotImplementedError
