# Static ESM output

`EsmGenerator.hx` is the custom Haxe JS generator used by this package. It maps
generated `@:jsRequire("@flighthq/...")` externs to static namespace imports and
uses Haxe's expression codegen for the consumer body.

Compile with `-D flight_esm --macro EsmGenerator.use() -dce full`. The package
macro adds this generator's classpath. The patched Rust producer targets Flight's
real TypeScript ESM packages, using `flight-compiler`'s naming rules. Object fields
are ordinary JavaScript properties; arrays, callbacks and options use logical JS
signatures. Native synthetic `free*` helpers are no-ops on this GC target. SDK
`release*` calls still execute the actual SDK release/pool function.

`buildWeb.mjs` compiles a consumer with the package macro, ESM generator and full
DCE, then calls `bundle.mjs`. The bundler uses esbuild to compile actual TypeScript
ESM from the pinned Flight checkout. No separate compiler repo, mock module, WASM,
or C ABI-shaped JS compatibility runtime is involved. Missing exports/warnings
fail the build. A consuming app may instead use its own bundler with published,
matching `@flighthq/*` packages; our local pipeline doesn't install those packages.

`npm run gate:web` extracts a bindings-only haxelib ZIP and executes real Flight
math/geometry calls. It covers mutable fields, typed arrays, callbacks/options,
allocation and release; verifies used functions remain and unused functions are
tree-shaken; and proves an empty consumer imports no Flight package. The gate
fails when required inputs are missing. This establishes the core ESM integration,
not runtime parity for every emitted SDK API or browser rendering.
