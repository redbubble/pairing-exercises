from app.cart.models.base_price import ProductBasePrice
from app.cart.models.cart_item import CartItem


def test_calculate_price():
    hoodie_base_price = ProductBasePrice(
        product_type='hoodie',
        price=3800
    )
    cart_item = CartItem(
        base_price=hoodie_base_price,
        artist_markup=20,
        quantity=2,
        product_type='hoodie'
    )
    assert cart_item.calculate_price() == 9120
