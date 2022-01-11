from app.cart.models.cart_item import CartItem


def test_calculate_price():
    assert CartItem.calculate_price(base_price=3800, artist_markup=20, quantity=2) == 9120
