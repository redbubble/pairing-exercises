module.exports = {
  root: true,
  env: {
    node: true,
    es6: true,
  },
  extends: [
    'eslint:recommended',
    'plugin:prettier/recommended',
    'plugin:jest/all',
  ],
  parserOptions: {
    parser: 'babel-eslint',
    sourceType: 'module',
    ecmaVersion: 2018,
  },
  rules: {
    'array-callback-return': 'warn',
    'block-scoped-var': 'warn',
    complexity: ['warn', { max: 10 }],
    'consistent-return': 'warn',
    curly: 'error',
    'default-case': 'warn',
    'default-param-last': 'warn',
    'dot-location': ['warn', 'property'],
    eqeqeq: ['warn', 'always'],
    'no-eq-null': 'error',
    'no-eval': ['error'],
    yoda: ['error', 'never'],
    'jest/consistent-test-it': ['error', { fn: 'it' }],
  },
  overrides: [
    {
      files: '**/__tests__/*.(js|jsx|ts|tsx)',
      env: {
        jest: true,
      },
    },
  ],
}
