import pytest
from pathlib import Path

from app.cart.managers.base_price_manager import ProductBasePriceManager
from app.cart.managers.cart_manager import CartManager


DATA_DIR = Path(__file__).parents[1] / 'data'


def test_init_with_json_file_correctly():
    manager = CartManager(json_file=DATA_DIR / 'cart-9500.json')

    assert len(manager.data) == 2


@pytest.mark.parametrize(
    argnames='amount',
    argvalues=[9363, 9500, 11356]
)
def test_lookup_price_and_calculate_total(amount):
    base_price_manager = ProductBasePriceManager(json_file=DATA_DIR / 'base-prices.json')
    cart_manager = CartManager(json_file=DATA_DIR / 'cart-{}.json'.format(amount))

    cart_manager.lookup_price(base_price_manager)

    assert cart_manager.calculate_total_prices() == amount
