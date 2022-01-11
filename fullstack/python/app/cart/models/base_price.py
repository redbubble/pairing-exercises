from collections import defaultdict
from dataclasses import dataclass, field
from typing import Dict, List

from app.common.models.converters import from_dict, from_int, from_str


@dataclass
class ProductBasePrice:
    product_type: str
    """Key-value pairs of strings. The value is an array and the base-price applies to all the strings in that array."""
    options: Dict[str, List[str]] = field(default_factory=lambda: defaultdict(list))
    """The base price for this product-type and option combination in cents."""
    price: int = 0

    @staticmethod
    def from_dict(obj: Dict) -> 'ProductBasePrice':
        assert isinstance(obj, dict)

        product_type = from_str(obj.get('product-type'))
        options = from_dict(obj.get('options'))
        price = from_int(obj.get('base-price'))

        return ProductBasePrice(
            product_type=product_type,
            options=options,
            price=price
        )

    def __eq__(self, other) -> bool:
        if isinstance(other, self.__class__):
            other = other.__dict__

        return self.__dict__ == other
