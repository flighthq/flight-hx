// Per-file hermeticity for the unified `isolate:false` upstream parity run.
//
// The whole suite shares one jsdom environment and one compiled `flight.cjs`
// singleton per worker, so a test file that stubs a global (ResizeObserver,
// matchMedia, timers) or leaves a module mock installed can corrupt a later
// file. Upstream's own suite is hermetic because each file scopes its mocks and
// restores globals; mirror that guarantee centrally here so the shared-registry
// run matches the isolated per-package run.
import { afterAll, beforeAll, vi } from 'vitest';

beforeAll(() => {
  if (typeof document === 'undefined' || typeof HTMLCanvasElement === 'undefined') return;
  const marker = Symbol.for('flight-hx.upstream-canvas-identity-patch');
  const createElement = document.createElement as typeof document.createElement & Record<PropertyKey, unknown>;
  if (createElement[marker] === true) return;
  const patchedCreateElement = function (this: Document, localName: string, options?: ElementCreationOptions) {
    const element = createElement.call(this, localName, options);
    if (element instanceof HTMLCanvasElement) {
      const getContext = element.getContext;
      element.getContext = function (this: HTMLCanvasElement, contextId: string, ...args: unknown[]) {
        const context = (getContext as (...values: unknown[]) => unknown).call(this, contextId, ...args);
        // vitest-webgl-canvas-mock manufactures a canvas-shaped copy for this
        // readonly property. Real contexts retain the exact source element.
        if (contextId === '2d' && context && typeof context === 'object') {
          Object.defineProperty(context, 'canvas', { configurable: true, value: this });
        }
        return context;
      } as typeof element.getContext;
    }
    return element;
  } as typeof document.createElement & Record<PropertyKey, unknown>;
  patchedCreateElement[marker] = true;
  document.createElement = patchedCreateElement;
});

afterAll(() => {
  vi.useRealTimers();
  vi.unstubAllGlobals();
  vi.resetModules();
});
