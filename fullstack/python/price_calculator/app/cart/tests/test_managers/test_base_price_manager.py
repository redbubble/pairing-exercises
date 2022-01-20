from app.cart.models.base_price import ProductBasePrice


def test_lookup_single_option_item(base_price_manager):
    result = base_price_manager.lookup(
        product_type='hoodie',
        options={
            'size': 'large',
            'colour': 'white'
        }
    )

    assert result == ProductBasePrice(
        product_type='hoodie',
        options={
            'colour': ['white'],
            'size': ['large']
        },
        price=3848
    )


def test_lookup_multiple_option_item(base_price_manager):
    result = base_price_manager.lookup(
        product_type='hoodie',
        options={
            'size': 'small',
            'colour': 'dark'
        }
    )

    assert result == ProductBasePrice(
        product_type='hoodie',
        options={
            'colour': ['white', 'dark'],
            'size': ['small', 'medium']
        },
        price=3800
    )


def test_lookup_zero_option_item(base_price_manager):
    result = base_price_manager.lookup(
        product_type='leggings'
    )

    assert result == ProductBasePrice(
        product_type='leggings',
        options={},
        price=5000
    )
