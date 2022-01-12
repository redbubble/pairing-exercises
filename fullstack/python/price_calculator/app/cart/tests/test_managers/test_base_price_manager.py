from app.cart.models.base_price import ProductBasePrice


def test_lookup_single_option_item(base_price_manager):
    result = base_price_manager.lookup(
        product_type='hoodie',
        options={
            'size': 'large',
            'colour': 'white'
        }
    )

    assert result == ProductBasePrice.from_dict({
        'product-type': 'hoodie',
        'options': {
            'size': ['large'],
            'colour': ['white']
        },
        'base-price': 3848
    })


def test_lookup_multiple_option_item(base_price_manager):
    result = base_price_manager.lookup(
        product_type='hoodie',
        options={
            'size': 'small',
            'colour': 'dark'
        }
    )

    assert result == ProductBasePrice.from_dict({
        'product-type': 'hoodie',
        'options': {
            'colour': ['white', 'dark'],
            'size': ['small', 'medium']
        },
        'base-price': 3800
    })


def test_lookup_zero_option_item(base_price_manager):
    result = base_price_manager.lookup(
        product_type='leggings',
    )

    assert result == ProductBasePrice.from_dict({
        'product-type': 'leggings',
        'options': {},
        'base-price': 5000
    })
