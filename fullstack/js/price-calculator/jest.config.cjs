module.exports = {
  verbose: true,
  clearMocks: true,
  resetMocks: true,
  moduleFileExtensions: ['js', 'json'],
  transform: {
    '^.+\\.(js|jsx)?$': '<rootDir>/node_modules/babel-jest',
  },
  testMatch: ['**/__tests__/*.js?(x)'],
  testPathIgnorePatterns: ['<rootDir>/node_modules/'],
};
