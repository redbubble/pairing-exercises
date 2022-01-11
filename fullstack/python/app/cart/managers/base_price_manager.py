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
            self.add_base_price(product_base_price=ProductBasePrice.from_dict(raw_item))

    def add_base_price(self, product_base_price):
        self.data[product_base_price.product_type].append(product_base_price)

    def lookup(self, product_type, options) -> 'ProductBasePrice':
        """
        Look up and return the first matching ProductBasePrice object in the store
        :param product_type:
        :param options:
        :return:
        """
        return next(
            p for p in self.data[product_type]
            if p.is_matched(product_type, options=options)
        )
