from pathlib import Path

from app.cart.managers.base_price_manager import ProductBasePriceManager
from app.cart.models.factories.base_price_factory import ProductBasePriceFactory


def test_init_without_json_file():
    manager = ProductBasePriceManager()
    assert not manager.data


def test_init_with_json_file_correctly():
    manager = ProductBasePriceManager(
        json_file=Path(__file__).parents[1] / 'data' / 'base-prices.json'
    )

    assert set(manager.data.keys()) == {
        'hoodie', 'sticker', 'leggings'
    }
    assert len(manager.data['hoodie']) == 5
    assert len(manager.data['sticker']) == 4
    assert len(manager.data['leggings']) == 1


def test_lookup_matching_item():
    manager = ProductBasePriceManager()
    base_price = ProductBasePriceFactory(options={
        'hello': ['from'],
        'the': ['other', 'side'],
    })

    manager.add_base_price(base_price)
    assert base_price == manager.lookup(
        product_type=base_price.product_type,
        options={
            'hello': 'from',
            'the': 'side'
        }
    )
