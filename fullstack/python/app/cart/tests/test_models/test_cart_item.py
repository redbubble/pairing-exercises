import pytest

from app.cart.models.cart_item import CartItem
from app.cart.models.factories.base_price_factory import ProductBasePriceFactory
from app.cart.models.factories.cart_item_factory import CartItemFactory


@pytest.mark.parametrize(
    argnames='test_input',
    argvalues=[None, True, False, 'random string', '9', '-19']
)
def test_from_dict_invalid_instance(test_input):
    with pytest.raises(AssertionError):
        CartItem.from_dict(test_input)


def test_from_dict_valid_inputs():
    test_input = {
        'product-type': 'hoodie',
        'options': {
            'size': 'small',
            'colour': 'white',
            'print-location': 'front'
        },
        'artist-markup': 20,
        'quantity': 1
    }

    result = CartItem.from_dict(test_input)
    assert result.product_type == 'hoodie'
    assert result.artist_markup == 0.2
    assert result.quantity == 1
    assert result.options == {
        'size': 'small',
        'colour': 'white',
        'print-location': 'front'
    }


def test_calculate_price_without_base_price():
    cart_item = CartItemFactory(base_price=None)

    with pytest.raises(AssertionError):
        cart_item.calculate_price()


def test_calculate_price_with_base_price():
    base_price = ProductBasePriceFactory(price=3800)
    cart_item = CartItemFactory(
        artist_markup=0.2,
        quantity=1,
        base_price=base_price
    )

    assert cart_item.calculate_price() == 4560
