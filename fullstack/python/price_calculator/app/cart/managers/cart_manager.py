from typing import List

from app.cart.managers.base_price_manager import ProductBasePriceManager
from app.cart.models.cart_item import CartItem
from app.common.models.converters import from_list
from app.common.utils import read_json


class CartManager:
    data: List[CartItem]
    base_price_manager: ProductBasePriceManager

    def __init__(self, base_price_manager=None, json_file=None):
        self.data = self.read_json(json_file) or []
        self.base_price_manager = base_price_manager

    @staticmethod
    def read_json(json_file):
        raw_data = read_json(json_file)

        return from_list(CartItem.from_dict, raw_data)

    def calculate_total_prices(self):
        raise NotImplementedError
