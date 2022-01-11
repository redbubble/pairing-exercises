import pytest

from app.cart.managers.cart_manager import CartManager
from app.cart.tests import DATA_DIR


@pytest.mark.parametrize(
    argnames='amount',
    argvalues=[9363, 9500, 11356]
)
def test_lookup_price_and_calculate_total(base_price_manager, amount):
    cart_manager = CartManager(json_file=DATA_DIR / 'cart-{}.json'.format(amount))

    cart_manager.lookup_price(base_price_manager)

    assert cart_manager.calculate_total_prices() == amount
