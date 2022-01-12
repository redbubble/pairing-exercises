from pathlib import Path

import pytest

from app.cart.managers.base_price_manager import ProductBasePriceManager

DATA_DIR = Path(__file__).parent / 'data'


@pytest.fixture
def base_price_manager():
    return ProductBasePriceManager(json_file=DATA_DIR / 'base-prices.json')
