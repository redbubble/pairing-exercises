import pytest

from app.cart.models.base_price import ProductBasePrice
from app.cart.models.factories.base_price_factory import ProductBasePriceFactory


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


def test_is_matched_wrong_product_type():
    base_price = ProductBasePriceFactory(product_type='Foo')

    assert base_price.is_matched(product_type='Bar', options={}) is False


def test_is_matched_options():
    base_price = ProductBasePriceFactory(options={
        'colour': ['white', 'dark'],
        'size': ['small', 'medium']
    })

    assert base_price.is_matched(
        product_type=base_price.product_type,
        options={
            'colour': 'black',
            'size': 'large'
        }
    ) is False
    assert base_price.is_matched(
        product_type=base_price.product_type,
        options={
            'colour': 'white',
            'size': 'large'
        }
    ) is False
    assert base_price.is_matched(
        product_type=base_price.product_type,
        options={
            'colour': 'black',
            'size': 'small'
        }
    ) is False
    assert base_price.is_matched(
        product_type=base_price.product_type,
        options={
            'colour': 'white',
            'size': 'small'
        }
    ) is True
