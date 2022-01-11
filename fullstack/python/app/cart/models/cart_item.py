from dataclasses import dataclass, field
from typing import Any, Dict

from app.cart.models.base_price import ProductBasePrice
from app.common.models.converters import from_dict, from_int, from_str


@dataclass
class CartItem:
    product_type: str
    """Key-value pairs of strings."""
    options: Dict[str, Any] = field(default_factory=dict)
    """The artist markup in float-based percent, for example 0.2 represents a 20% markup."""
    artist_markup: float = 0
    """The quantity of this item."""
    quantity: int = 0
    """The base price object of this item"""
    base_price: ProductBasePrice = None

    @staticmethod
    def from_dict(obj: Any) -> 'CartItem':
        assert isinstance(obj, dict)

        product_type = from_str(obj.get('product-type'))
        artist_markup = from_int(obj.get('artist-markup')) / 100
        quantity = from_int(obj.get('quantity'))
        options = from_dict(obj.get('options'))

        return CartItem(
            product_type=product_type,
            options=options,
            artist_markup=artist_markup,
            quantity=quantity
        )

    def calculate_price(self):
        assert self.base_price

        base_price = self.base_price.price
        return (base_price + round(base_price * self.artist_markup)) * self.quantity
