import factory

from . import PRODUCT_TYPE_SEEDS
from ..cart_item import CartItem


class CartItemFactory(factory.Factory):
    product_type = factory.Faker('random_element', elements=PRODUCT_TYPE_SEEDS)
    artist_markup = factory.Faker('pyfloat', min_value=0, max_value=1)
    quantity = factory.Faker('pyint', min_value=0, max_value=9999)
    base_price = factory.SubFactory('app.cart.models.factories.base_price_factory.ProductBasePriceFactory')

    class Meta:
        model = CartItem

    @factory.lazy_attribute
    def options(self):
        return {
            'size': 'small',
            'colour': 'white',
            'print-location': 'front'
        }
