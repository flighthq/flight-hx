# Static ESM output

`EsmGenerator.hx` is the custom Haxe JS generator used by this package. It maps
generated `@:jsRequire("@flighthq/...")` externs to static namespace imports and
uses Haxe's expression codegen for the consumer body.

Compile with `-D flight_esm --macro EsmGenerator.use() -dce full`. The package
macro adds this generator's classpath. The Flight producer uses the TypeScript
checker to generate public package facades under `flight.esm`, including
published subpaths. The manifest at `generated/externs/flight/esm/exports.json`
maps SDK export names to their Haxe declarations. Use the matching
`flight.esm.types` declarations to construct SDK classes. The `flight.*` API
continues to support callers shared with native builds.

`buildWeb.mjs` compiles a consumer with the package macro, ESM generator and full
DCE, then calls `bundle.mjs`. The bundler uses esbuild to compile actual TypeScript
ESM from the pinned Flight checkout and resolves package subpaths through the
published export maps. Apps that use the SDK's WASM wrappers need the built
payloads from the matching published packages. Missing exports or warnings fail
normal consumer bundles.

`npm run gate:web` compares the installed archive's manifest to the exports
esbuild links from each public SDK entry point. This link-only audit externalizes
generated WASM payloads. Consumer bundles use their actual dependencies.
The gate also executes real SDK math, geometry, app and host functions and
renders a shape through the Canvas APIs with a Node platform double. The
Canvas Haxe program can run in a browser with a real Canvas and verify a pixel.
