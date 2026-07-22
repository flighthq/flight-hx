import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json-summary'],
    },
    globals: true,
    include: ['tests/**/*.test.ts'],
    testTimeout: 30_000,
  },
});
