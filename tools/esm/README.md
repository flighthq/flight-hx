# esm — vendored ESM generator

A purpose-built, vendored custom Haxe JS generator (genes is the reference, **not** a fork) that makes
Haxe emit ES modules with **static named imports** for the generated `flight._js` externs, so the web
binding tree-shakes and pay-per-use survives. Haxe's default output uses `require()` (a namespace
import a bundler cannot tree-shake); this replaces that.

## How it works

`EsmGenerator.hx` registers a custom generator via `Compiler.setCustomJSGenerator`. It is *scoped*: it
reuses the compiler's own expression codegen (`JSGenApi.generateValue` / `generateStatement`) and only
owns module structure —

- **`@:jsRequire("pkg")` externs → hoisted `import * as alias from "pkg"`**, with the type accessor
  pointing at `alias`, so every call is a static member access (`alias.addVector2(…)`) the bundler can
  tree-shake. This is the whole point.
- **Our own types → flat top-level `var` bindings** (not nested package-object mutation), so the
  bundler's DCE can drop the unused ones.
- **Fail-loud** on a construct outside the scoped vocabulary (e.g. `@:jsRequire` with a member name).

`buildWeb.mjs` is the one-place web recipe (`--macro EsmGenerator.use() -dce full`, then bundle via
`bundle.mjs`). `-dce full` is load-bearing: it strips the unused `inline` forwarders before emission,
so nothing references the Flight functions the program never calls, and the bundler removes them.
`bundle.mjs` runs esbuild, resolving `@flighthq/*` from the rehydrated Flight workspace (Flight's dist
is bundler-targeted ESM with extensionless imports, so a bundler is required).

## Acceptance = the web-DCE gate

`tests/gates/webDce.mjs` builds `examples/web-geometry` through this pipeline and asserts a used Flight
function is present in the bundle and an unused one is **absent** (tree-shaken). `tests/gates/webBehavioral.mjs`
asserts the same build runs against real Flight and produces the right answer. Both skip (labeled) on a
fresh clone without the built dependencies.

## Scope

Web only. Native/C++ does DCE via the linker (`--gc-sections`/LTO), so there is no equivalent generator
on that side. The generator is scoped to this repo's generated vocabulary today; broaden it as the
generated surface grows, keeping the fail-loud boundary.
