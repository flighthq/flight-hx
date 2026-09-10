# window-web — the same real app, on hostWeb

**Stub.** Blocked on the `_js` backend + the vendored ESM generator ([`../../tools/esm/`](../../tools/esm/)).

The *same* windowed app as [`../window-native/`](../window-native/), using **Flight's own web host**
(the browser), compiled `js` + `flight_esm` → `_js`. This is the only web config where we own the
whole compile→bundle pipeline, so it is the one that showcases pay-per-use on web: static named ESM
imports + a bundler, tree-shaken.

When it lands: build with the vendored ESM generator, bundle, and run under the **web-DCE gate** —
which asserts imports are static `import { … }` and that an unused Flight function is absent from the
bundle. That gate is the executable definition of "the ESM generator works precisely."
