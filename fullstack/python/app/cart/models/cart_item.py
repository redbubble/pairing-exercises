from dataclasses import dataclass, field
from typing import Any, Dict

from app.cart.models.base_price import ProductBasePrice
from app.common.models.converters import from_dict, from_int, from_str


@dataclass
class CartItem:
    product_type: str
    options: Dict[str, Any] = field(default_factory=dict)
    """The artist markup in percentile. E.g. 20 would be 20% in markup."""
    artist_markup: int = 0
    """The quantity of this item."""
    quantity: int = 0
    """The base price object of this item"""
    base_price: ProductBasePrice = None

    @staticmethod
    def from_dict(obj: Any) -> 'CartItem':
        assert isinstance(obj, dict)

        product_type = from_str(obj.get('product-type'))
        artist_markup = from_int(obj.get('artist-markup'))
        quantity = from_int(obj.get('quantity'))
        options = from_dict(obj.get('options'))

        return CartItem(
            product_type=product_type,
            options=options,
            artist_markup=artist_markup,
            quantity=quantity
        )

    def calculate_price(self) -> int:
        raise NotImplementedError
