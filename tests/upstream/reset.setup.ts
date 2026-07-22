// Per-file hermeticity for the unified `isolate:false` upstream parity run.
//
// The whole suite shares one jsdom environment and one compiled `flight.cjs`
// singleton per worker, so a test file that stubs a global (ResizeObserver,
// matchMedia, timers) or leaves a module mock installed can corrupt a later
// file. Upstream's own suite is hermetic because each file scopes its mocks and
// restores globals; mirror that guarantee centrally here so the shared-registry
// run matches the isolated per-package run.
import { afterEach, vi } from 'vitest';

afterEach(() => {
  vi.useRealTimers();
  vi.restoreAllMocks();
  vi.unstubAllGlobals();
  vi.resetModules();
});
