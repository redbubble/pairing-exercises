import ProductBasePrice from '../base-price';

describe('productBasePriceModel', () => {
  it('has valid inputs', () => {
    expect.assertions(3);

    const result = new ProductBasePrice(
      'hoodie',
      {
        colour: ['white', 'dark'],
        size: ['small', 'medium'],
      },
      3800
    );

    expect(result.productType).toBe('hoodie');
    expect(result.options).toStrictEqual({
      colour: ['white', 'dark'],
      size: ['small', 'medium'],
    });
    expect(result.price).toBe(3800);
  });
});
