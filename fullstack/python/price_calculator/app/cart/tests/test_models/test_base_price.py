import pytest

from app.cart.models.base_price import ProductBasePrice


@pytest.mark.parametrize(
    argnames='test_input',
    argvalues=[None, True, False, 'random string', '9', '-19']
)
def test_from_dict_invalid_instance(test_input):
    with pytest.raises(AssertionError):
        ProductBasePrice.from_dict(test_input)


def test_from_dict_valid_inputs():
    test_input = {
        'product-type': 'hoodie',
        'options': {
            'colour': ['white', 'dark'],
            'size': ['small', 'medium']
        },
        'base-price': 3800
    }

    result = ProductBasePrice.from_dict(test_input)
    assert result.product_type == 'hoodie'
    assert result.options == {
        'colour': ['white', 'dark'],
        'size': ['small', 'medium']
    }
    assert result.price == 3800
