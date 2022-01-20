from collections import defaultdict
from typing import Dict, List

from app.cart.models.base_price import ProductBasePrice
from app.common.utils import read_json


class ProductBasePriceManager:
    data: Dict[str, List[ProductBasePrice]]

    def __init__(self, json_file=None):
        self.data = self.read_json(json_file)

    @staticmethod
    def read_json(json_file):
        data = defaultdict(list)
        raw_data = read_json(json_file)

        for raw_item in raw_data:
            product_base_price = ProductBasePrice.from_dict(raw_item)
            data[product_base_price.product_type].append(product_base_price)

        return data

    def lookup(self, product_type, options=None) -> 'ProductBasePrice':
        raise NotImplementedError
