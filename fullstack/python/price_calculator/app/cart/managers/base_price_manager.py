from collections import defaultdict
from typing import Dict, List

from app.cart.models.base_price import ProductBasePrice
from app.common.utils import read_json


class ProductBasePriceManager:
    data: Dict[str, List[ProductBasePrice]]

    def __init__(self, json_file=None):
        self.data = defaultdict(list)

        self.read_json(json_file)

    def read_json(self, json_file):
        raw_data = read_json(json_file)

        for raw_item in raw_data:
            product_base_price = ProductBasePrice.from_dict(raw_item)
            self.data[product_base_price.product_type].append(product_base_price)

    def lookup(self, product_type, options=None) -> 'ProductBasePrice':
        raise NotImplementedError