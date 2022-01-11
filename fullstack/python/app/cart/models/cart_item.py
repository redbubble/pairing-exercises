from typing import Any


class CartItem:

    @staticmethod
    def from_dict(obj: Any) -> 'CartItem':
        raise NotImplementedError

    @staticmethod
    def calculate_price(base_price, artist_markup, quantity) -> float:
        raise NotImplementedError
