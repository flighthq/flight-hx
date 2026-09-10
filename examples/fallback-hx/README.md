# fallback-hx — the transpiled backend on a `js` target

This tier proves the **Lime/Clay-web scenario**: a `js` target whose host owns the output pipeline,
so Flight rides through as ordinary transpiled Haxe (`_hx`) rather than tree-shakeable ESM. It is the
same source as [`../headless/`](../headless/) under a different pipeline define — no separate copy,
because the point is the *pipeline flip*, not new code:

```sh
# what a Lime/Clay HTML5 build effectively does with Flight:
node tools/haxe.mjs -cp src -cp examples/headless --main Headless -js out.js -D flight_hx
node out.js   # runs; Flight is plain Haxe in the host's own bundle
```

Contrast hostWeb, which adds `-D flight_esm` (and the vendored ESM generator + a bundler) to get
`_js` and bundler-grade DCE. Here you keep only Haxe `-dce full` — "reach, not performance."

The proof gate ([`../../tests/gates/proofShape.mjs`](../../tests/gates/proofShape.mjs), check 4)
compiles+runs exactly this pipeline, and asserts a bare `js` (no pipeline define) fails loud instead
of silently picking `_js`. No hand-maintained example file is needed to keep it honest.
