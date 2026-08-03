# Upstream `7333e825` Nested Function Hoisting

Status: implemented and locally verified; independent parity validation remains with review.

## Root cause and general rule

The 16 remaining `effects-gl` failures were one lowering defect. `explainGlRenderEffectApplication` returns an object whose `status` field calls the nested `getStatus` function before that declaration's textual position. JavaScript creates and initializes a nested function declaration when its containing scope is entered. The previous Haxe lowering predeclared a `Void->Dynamic` variable as `_Runtime.UNDEFINED`, preserved the source-order `return`, and emitted the closure assignment afterward. The generated JavaScript consequently attempted `undefined.apply(...)`; neither the render-effect registry nor the bridge was missing.

The repair applies to every translated statement scope:

- lower all statements in their original order first, preserving deterministic temporary allocation and diagnostics;
- stably move named function-declaration statements to the start of that same lexical statement list;
- preserve source order among multiple declarations;
- leave arrow functions, named function expressions, and ordinary variable initializers in source order;
- retain lowered parameter initialization before body declarations, matching JavaScript's parameter-before-body setup;
- apply the same rule recursively to function and method bodies, explicit blocks, switch clauses, object methods, and function-expression bodies.

The focused fixture calls a nested declaration before its textual position, requires its assignment before both a named function-expression initializer and the call, and compiles/runs the result through Haxe Eval. The named function expression is the negative control: it must not acquire declaration-hoisting semantics.

## Census and generated delta

The translated production scope contains 41 nested function declarations across 13 generated modules: 39 synchronous declarations retain named closure syntax, and two async declarations use the async lowering's anonymous closure form. Regeneration moves every initialization to the containing scope entry. This is deliberately broader than the single GL manifestation: declarations that happened not to be called early receive the same JavaScript rule instead of relying on source placement.

In `GlRenderTextureEffect.explainGlRenderEffectApplication`, `getStatus` is now initialized before `unregisteredKinds`, `requestedCount`, and `registeredCount` are computed and before the returned object calls it. The closure still observes those bindings after their initialization at call time.

| Artifact                          | SHA-256                                                            |
| --------------------------------- | ------------------------------------------------------------------ |
| Generated `.hx` tree              | `39c8368162c903b63c58a562366821e7743bb120d570450cb6b2fc385e87a6ec` |
| `build/haxe-js/flight.cjs`        | `c04283ff26ada4d96d17c40e6346b05f8c10131d47a2dcb356e9876b42bb13d5` |
| Primary-only generated `.hx` tree | `60aee396833ef0875ff684ce4e2d23afc6d609f28886cb7585cd0c179dac2a3f` |

## Verification

- Baseline `effects-gl`: 16 failed and 250 passed. Every failure reached the same uninitialized `getStatus` call in the compiled bundle.
- Candidate `effects-gl`: all 266 tests across 58 files pass. `reports/upstream-parity-effects-gl.json` records exit code 0 and zero failed packages.
- The focused lowering file passes 63/63, including textual positive/negative ordering checks and the executable Haxe Eval fixture.
- Regeneration plus repeated `npm run generate:check` is deterministic. `npm run check`, all 119 maintained generator tests, and complete Haxe namespace compilation pass.
- The committed `CoreSmoke` passes Eval, JavaScript, Python, Neko, and C++/hxcpp. A report-free post-commit `effects-gl` rerun independently confirms 58/58 files and 266/266 tests.
