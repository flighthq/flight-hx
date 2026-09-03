// Per-file hermeticity for the unified `isolate:false` upstream parity run.
//
// The whole suite shares one jsdom environment and one compiled `flight.cjs`
// singleton per worker, so a test file that stubs a global (ResizeObserver,
// matchMedia or timers can corrupt a later file. Upstream's own suite scopes
// those mutations; restore the global state once per file without resetting the
// module registry, which would recreate the 13 MB Flight singleton per file.
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
      // Define the per-instance override as NON-ENUMERABLE. The native `getContext` lives on the
      // prototype, so a real canvas has no own enumerable `getContext`; a plain assignment here would
      // add one, and surfaces that ARE the canvas (e.g. render-wgpu's size-only presentation surface,
      // asserted to carry no DOM member via `Object.keys`) would then leak it. `defineProperty` with
      // enumerable:false keeps the 2d-context canvas-identity fix without changing the key set.
      Object.defineProperty(element, 'getContext', {
        configurable: true,
        enumerable: false,
        writable: true,
        value: function (this: HTMLCanvasElement, contextId: string, ...args: unknown[]) {
          const context = (getContext as (...values: unknown[]) => unknown).call(this, contextId, ...args);
          // vitest-webgl-canvas-mock manufactures a canvas-shaped copy for this
          // readonly property. Real contexts retain the exact source element.
          if (contextId === '2d' && context && typeof context === 'object') {
            Object.defineProperty(context, 'canvas', { configurable: true, value: this });
          }
          return context;
        } as typeof element.getContext,
      });
    }
    return element;
  } as typeof document.createElement & Record<PropertyKey, unknown>;
  patchedCreateElement[marker] = true;
  document.createElement = patchedCreateElement;
});

afterAll(() => {
  vi.useRealTimers();
  vi.unstubAllGlobals();
  // Upstream gets per-file hermeticity from `vi.resetModules()` + re-import, which discards every
  // `vi.spyOn` along with the module it patched. The parity run cannot resetModules (it would
  // re-evaluate the 13 MB compiled Flight singleton per file and OOM), so a namespace spy a file
  // installs — e.g. scene2d-gl's spies on render-gl draw functions — otherwise survives into the
  // next file under the shared `isolate:false` worker and silently changes its results. Restore them
  // once per file: within-file behaviour (spies set in beforeAll/beforeEach) is unchanged, only the
  // leak across the file boundary is closed.
  vi.restoreAllMocks();
});
