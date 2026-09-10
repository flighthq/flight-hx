# esm — vendored ESM generator

**Not yet implemented.** A purpose-built, vendored custom JS generator that makes Haxe emit ES
modules with **static named imports/exports**, so the web binding tree-shakes and pay-per-use
survives. [genes](https://github.com/benmerckx/genes) is the reference, **not** a fork.

## Why vendored

The ESM output shape is what pay-per-use rests on; it must not drift with an external library's
releases or Haxe's native-ESM mood. Because we control the generated binding vocabulary (externs +
`@:jsRequire`, module-level forwarders, value typedefs), the generator only has to handle *that*
narrow shape — a fraction of a general Haxe→ESM transform. Pin Haxe alongside it (a custom generator
hooks compiler internals that shift across releases).

## Acceptance = the web-DCE gate

"Works precisely how we want" is defined by `tests/gates/webDce.mjs`: build a sample, bundle it, and
assert (1) Flight imports are static `import { … }` and (2) an unused Flight function is **absent**
from the bundle. Build to that gate; don't chase genes feature-parity. It must see through the
public module-level forwarder → hidden `_js` extern → the named import.

## Scope

Web only. Native/C++ does DCE via the linker (`--gc-sections`/LTO) regardless of how symbols are
referenced, so there is no equivalent generator on that side — don't build symmetric machinery for
C++.
