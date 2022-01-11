import factory

from . import PRODUCT_TYPE_SEEDS
from ..base_price import ProductBasePrice


class ProductBasePriceFactory(factory.Factory):
    product_type = factory.Faker('random_element', elements=PRODUCT_TYPE_SEEDS)
    price = factory.Faker('pyint', min_value=0)

    class Meta:
        model = ProductBasePrice

    @factory.lazy_attribute
    def options(self):
        return {
            'colour': ['white', 'dark'],
            'size': ['small', 'medium']
        }
