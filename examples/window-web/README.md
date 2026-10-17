# window-web — the same real app, on hostWeb

**Stub.** The `_js` backend and vendored ESM generator are live and fully gated. What remains here is
the portable browser window/render sample itself. The native sample currently exercises a
manifest-recorded SDL3/GL platform extension, not a portable API that can honestly be compiled
unchanged for the browser.

The *same* windowed app as [`../window-native/`](../window-native/), using **Flight's own web host**
(the browser), compiled `js` + `flight_esm` → `_js`. This is the only web config where we own the
whole compile→bundle pipeline, so it is the one that showcases pay-per-use on web: static named ESM
imports + a bundler, tree-shaken.

When it lands, it will build with the existing vendored ESM generator, bundle, and run under the
**web-DCE gate**, which already asserts imports are static `import { … }` and that an unused Flight
function is absent from the bundle. Do not pretend the native-only `HostSdlGl` extension is that
cross-platform contract.
