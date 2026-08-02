import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json-summary'],
    },
    globals: true,
    include: ['tests/**/*.test.ts'],
    // Checker-derived generator censuses can exceed 30 seconds when files run concurrently.
    testTimeout: 180_000,
  },
});
