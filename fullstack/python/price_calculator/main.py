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
def main(cart_json_file, base_prices):
    cart_manager = CartManager(
        base_price_manager=ProductBasePriceManager(json_file=base_prices),
        json_file=cart_json_file
    )

    click.echo(cart_manager.calculate_total_prices())


if __name__ == '__main__':
    main()
