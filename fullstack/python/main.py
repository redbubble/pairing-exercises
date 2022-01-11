import click

from app.cart.managers.base_price_manager import ProductBasePriceManager
from app.cart.managers.cart_manager import CartManager


@click.command()
@click.option(
    '-c', '--cart',
    required=True,
    type=str,
    help='Path to a JSON file representing a cart'
)
@click.option(
    '-p', '--base-prices',
    required=True,
    type=str,
    help='Path to a JSON file representing a list of base prices'
)
def main(cart, base_prices):
    base_price_manager = ProductBasePriceManager(json_file=base_prices)
    cart_manager = CartManager(json_file=cart)

    cart_manager.lookup_price(base_price_manager)

    click.echo(cart_manager.calculate_total_prices())


if __name__ == '__main__':
    main()
