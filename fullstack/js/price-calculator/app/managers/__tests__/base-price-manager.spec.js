import ProductBasePrice from '../../models/base-price';
import BasePriceManager from '../base-price-manager';

describe('basePriceManager', () => {
  const basePriceManager = new BasePriceManager(
    '../../testdata/base-prices.json'
  );

  it('should lookup single option item', () => {
    expect.assertions(1);

    const result = basePriceManager.lookup('hoodie', {
      colour: 'white',
      size: 'large',
    });

    expect(result).toStrictEqual(
      new ProductBasePrice(
        'hoodie',
        {
          colour: ['white'],
          size: ['large'],
        },
        3848
      )
    );
  });

  it('should lookup multiple option item', () => {
    expect.assertions(1);

    const result = basePriceManager.lookup('hoodie', {
      colour: 'dark',
      size: 'small',
    });

    expect(result).toStrictEqual(
      new ProductBasePrice(
        'hoodie',
        {
          colour: ['white', 'dark'],
          size: ['small', 'medium'],
        },
        3800
      )
    );
  });

  it('should lookup zero option item', () => {
    expect.assertions(1);

    const result = basePriceManager.lookup('leggings');

    expect(result).toStrictEqual(new ProductBasePrice('leggings', {}, 5000));
  });
});
