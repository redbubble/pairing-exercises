from typing import Any


class ProductBasePrice:

    @staticmethod
    def from_dict(obj: Any) -> 'ProductBasePrice':
        raise NotImplementedError

    def __eq__(self, other) -> bool:
        if isinstance(other, ProductBasePrice):
            other = other.__dict__

        return self.__dict__ == other
