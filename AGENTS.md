# flight-hx

Haxe **bindings** for the [Flight SDK](https://github.com/flighthq/flight). This repo is a thin, generated binding + runtime layer that presents one `flight.*` Haxe surface backed by compiled Flight — **not** a Haxe reimplementation of Flight.

This document is the authoritative entry point. It records the decisions that shaped this repo so they don't have to be rediscovered. Read it before changing structure.

## What changed, and why (the pivot)

The previous flight-hx mechanically transpiled Flight's TypeScript **implementation** into Haxe and compiled that through hxcpp. That path is archived as `flight-hx-archive`. It hit an architectural ceiling: Flight is deliberately C-like (free functions over separate structs, `create<Type>` allocation, `out` params, no OO), which is _foreign_ to Haxe's nominal/GC/reflection model. The result was a steady stream of native-only representation bugs (anonymous records coerced to nominal `@:structInit` classes returning null on hxcpp; static-init-order crashes; reflective field-access tax) and a performance ceiling that could only be raised by OO-ifying the library — i.e. by making it no longer Flight.

The same property that fights Haxe (types separate from implementation = a header/source split) _rewards_ C++. So the native implementation of Flight is [flight-cpp](https://github.com/flighthq/flight-cpp), and **Haxe binds to compiled Flight instead of reimplementing it**:

- **Native / hxcpp** → bind to flight-cpp's C++ via direct C++ externs. Because hxcpp _is_ C++, this is ordinary C++ calls, not a marshaling bridge — native speed, and the whole anon→nominal bug class disappears (Flight is no longer Haxe).
- **Web / JS** → bind to Flight's ESM output via externs, co-bundled and tree-shaken.
- **Transpiled Haxe** → an optional fallback for pure-VM Haxe targets that can't link C++/JS (HashLink/Neko/etc.). Reach, not performance.

TS _types_ → Haxe _externs_ remains the mechanical binding goal. The compiler may refuse a source module it cannot represent; generation records every refusal instead of widening or silently miscompiling it. TS _implementation_ → Haxe is retained only as the optional reach-oriented fallback, and every emitted source is compiled by the real downstream Haxe toolchain.

## The public shape: one `flight.*` over three backends

Every consumer imports the same `flight.*` names. The Haxelib initialization macro selects a
target-specific public facade root by compile define, and each facade forwards to one hidden
backend: `flight._cpp.*`, `flight._js.*`, or `flight._hx.*`. This whole-root selection is important:
Haxe resolves every signature in a loaded module, so a single mixed module with per-function
conditionals would let one unsupported native type poison otherwise usable declarations.

- **Types are target-specific typedefs or exact native handles.** On web, `flight.Vector2` aliases
  the compiler-emitted structural `flight._js.Vector2`; native overrides may use an opaque handle
  when flight-cpp ownership requires it. Types stay structural wherever the backend is structural.
- **Function facades are module-level free functions.** `flight.Math.lerp(...)` forwards to the
  target root's hidden extern holder. Module-level (not class statics) keeps Flight's searchable
  free-function shape, and `inline` makes the forwarding layer zero-cost. A bare
  `import flight.Math` yields its unqualified functions; `import flight.Math.*` does not, because
  Haxe interprets that as a type wildcard.
- **Web is generated complete; native has proven and attempted tiers.** `generated/js/flight`
  contains every current SDK type, function, and value. `src-cpp/manifest.json` remains the exact
  compile/run-proven flight-cpp partition. Alongside it, generated native facades materialize every
  declaration for which flight-cpp exposes a symbol, including compiler-refused experiments; their
  separate attempt ledgers prevent Haxe type-check success from being mistaken for ABI proof.
  Declarations with no compiler/flight-cpp plan locator remain fail-loud and are recorded rather
  than invented; this does not preclude later manual header discovery and promotion.

The selector **fails loud** on an unsupported target (`#error`), never silently resolves to nothing. It keys on the **packaging pipeline, not the raw target** (see the host-axis section) — precedence:

```
flight_hx         -> _hx   // transpiled Flight: pure-VM targets, and cross-target hosts on web
js && flight_esm  -> _js   // ESM Flight: hostWeb only (our ESM generator + bundler own the build)
cpp               -> _cpp  // flight-cpp externs: native, unambiguous (every native host links it)
js (no pipeline)  -> #error naming the two web choices
```

`flight_hx` comes first so it wins even on a `js`/`cpp` target — that is how a Lime/Clay web build (a `js` target) opts out of the ESM path. A bare `js` never auto-selects `_js`: without `flight_esm` it would emit non-tree-shakeable `require()`s into a foreign bundle, so it fails loud instead. `cpp` stays guard==selector (no native ambiguity); the `js` axis is the only one that needs a pipeline define.

Rejected alternatives and why: a Haxe _reimplementation_ (the archive — capped + bug-prone); OO abstracts/wrappers in the core (off-thesis, defeats tree-shaking, the marriage cost lands on hot value types); typedef-to-extern-class-with-statics for facades (can't wildcard-import through the alias, forces value types into extern classes). Fluent value ergonomics, if ever wanted, are an opt-in `using` extension or a facade like openfl-flight layered **on top** — never in the core.

## The host axis is not the target axis

A _host_ is "who provides the platform (window / GL / audio / input) to Flight" — a different axis from the compile target, and the two must not be conflated. The platform layer comes from the _target's_ Flight: **native** links flight-cpp's own host (SDL/etc.); **web** uses the browser. `hostLime` / `hostClay` are the exception — "run Flight, but let Lime/Clay provide the platform instead" — and they are **on-top integrations** (the same category as openfl-flight), consuming flight-hx as a normal `haxelib`, never part of the core binding.

The trap: Lime and Clay are cross-target Haxe frameworks that each fan out to _both_ `js` and `cpp` and **own their own output pipeline**. So a Lime web build reaches the `js` target without granting us the ESM-generator+bundler pipeline the `_js` binding needs — Haxe emits one JS module through one generator per invocation, and Lime's HTML5 packaging isn't a node-resolving bundler. Binding Flight as tree-shakeable ESM there is unreachable. Hence the pipeline-define selector above, and:

- **hostWeb** (`js` + `flight_esm`): we own the whole compile→bundle pipeline → `_js`, tree-shaken. **Bundler-grade pay-per-use on web is a hostWeb-only guarantee.**
- **Any native host** (`cpp`): flight-cpp externs, linker-DCE'd. Pay-per-use holds regardless of host.
- **Lime/Clay on web** (`js` + `flight_hx`): the transpiled `_hx` backend, compiled inline through the host's own Haxe→JS. It _works_ and keeps only Haxe `-dce full` — the "reach, not performance" tier, now covering "any web build whose host owns the output pipeline," not just pure-VM targets.

Teaching Lime/Clay's HTML5 build to consume Flight-as-external-ESM is a real future option, but it is a change to _their_ build, not ours — never a v1 assumption.

## Pay-per-use survives the binding — but only under specific packaging

Flight's "billed for what you buy" property is the crown jewel; the binding preserves it only if you **co-compile Flight's target source into the same unit and let the target's native DCE see through the externs** — never bind to an opaque prebuilt blob.

- **Web:** Flight ESM + Haxe emitting **static named ESM imports** + a bundler. `__init__`/`untyped js` produce runtime `require`/dynamic-`import` which is NOT tree-shakeable — do not use them for imports. This needs a vendored ESM generator (see `tools/esm/`), because native Haxe ESM output is not reliably static-named. A bundler is part of the web pipeline; document that "Flight-on-web" implies compiling with the vendored generator.
- **Native:** static-linked / compile-from-source flight-cpp + direct C++ externs (not CFFI, which pins symbols) + `-ffunction-sections`/`--gc-sections` and/or LTO. Shared `.so` exports everything and defeats DCE — don't. LTO also inlines tiny extern calls, so per-op forwarding is free here; hot-math-inlined-in-Haxe matters on JS, not C++.

Flight's free-function architecture is exactly what makes both collectors effective (individually collectable symbols / named exports). Don't let a monolith form on top.

## Dependencies: lock-file rehydration, not submodules

This repo pins `flight`, `flight-compiler`, and `flight-cpp` in `dependencies.lock.json` and materializes them into a **gitignored** `.dependencies/` via `npm run rehydrate` (scripts adopted verbatim from flight-cpp). The lock is the only thing that decides which revision a gate reads; `--check` gates CI, `--update` re-pins to branch head. Generated bindings are **checked in**, so a consumer `haxelib`s this repo with no Node/compiler dependency — only regeneration needs them. Submodules were dropped: there are three cross-repo pins, and dependencies are disposable inputs, not tree members.

## The generator: rely on flight-compiler

Analysis, IR, lowering, naming, extern emission, and transpiled-source emission live in [flight-compiler](https://github.com/flighthq/flight-compiler). `tools/backend-hx/generate.mjs` is only the downstream integration driver: it constructs the same complete SDK graph as flight-cpp, invokes the compiler's public API in `extern` and `transpile` modes, applies named compatibility corrections, runs the complete transpiled output through Haxe 4.3.7, and owns atomic write/check modes plus manifests and refusal ledgers. Do not reintroduce a local TypeScript parser or lowering implementation here.

The working-package boundary is downstream-first: flight-hx may own narrow, deterministic,
manifest-recorded corrections and explicit native overrides needed to make the published Haxe surface
actually compile and run. That working result is the golden reference for later flight-compiler and
flight-cpp improvements, which should reduce the correction/override inventory over time. Full
TS-to-Haxe transpilation is useful optional reach, not a prerequisite for the web + native SDK.

## What this repo owns

- `dependencies.lock.json` + `scripts/` rehydrate infra.
- `generated/js` — checked-in JavaScript extern bindings; `generated/hx` — checked-in transpiled Haxe fallback sources. Consumers need neither Node nor flight-compiler.
- `src-cpp/` — checked-in native facade overrides, C++ bridge headers, and the exact flight-cpp support/correction manifest.
- `haxelib.json`, `extraParams.hxml`, and `lib/flight_hx/Package.hx` — the installed-package contract: one `-lib flight` entry point that elects exactly one target backend root.
- `src/flight/` — the maintained runtime shim: public unifiers, hidden `_hx` bodies + `_cpp`/`_js` extern drafts, the small inlined-Haxe value primitives (hot math, most valuable on JS).
- `tools/backend-hx/` — the thin flight-compiler integration and downstream compatibility boundary.
- `tools/esm/` — the vendored, purpose-built ESM generator (genes as reference, not a fork; scoped to this repo's generated vocabulary; pinned Haxe underneath).
- `tests/gates/` — the gates below. `tests/haxe/` — consumer-style Haxe fixtures.
- `examples/` — layer examples, scoped per the Examples section (not a port of Flight's catalog).
- Build wiring (hxml + `@:buildXml` DCE flags). Host _backends_ are on-top integrations, not owned here (see the host-axis section).

## Gates (fail-loud, per the Flight discipline)

- **Cross-target behavioral gate** — build the deterministic consumer-only Haxelib ZIP, install it in a clean isolated repository, compile one `-lib flight` consumer against the complete ESM externs and the manifest-recorded flight-cpp subset, run the optional fallback too, compare native signatures to current externs, and inspect generated C++ for direct, adapter, and explicit downstream-override calls. It also builds `Flight::HostSdlGl`, compiles the packaged native window sample, and creates/presents an SDL3/GL surface offscreen. This catches archive, package-layout, host-link, and native-only breakage that byte diffs and the JS oracle cannot.
- **Backend-parity gate** — every available `_hx` function/value must exactly match its `_js` signature, type identities must match in name and generic arity, and every `_js` declaration must occur in exactly one supported/unavailable partition. Haxe treats interface methods and function-valued fields as distinct assignability representations even though calls are equivalent; normalizing that compiler-emission seam belongs upstream. Native support is deliberately a smaller, exact partition in `src-cpp/manifest.json` until flight-cpp catches up.
- **Web-DCE gate** — build a sample, bundle it, assert imports are static `import { … }` and an unused Flight function is absent from the bundle. Defines "the ESM generator works precisely."
- **Binding-existence gate** — the validation type-checking cannot do: a Haxe extern is an unchecked promise, so load the _real_ Flight ESM for every generated contract holder and assert each bound function and value resolves to the right runtime export. Covers the emitted surface (6,906 functions and 1,261 values), not the few an example calls. Types aren't checked at runtime (TS interfaces are erased from ESM); their fidelity rests on the shared inventory + the surface type-check.
- **Generated-surface gate** — type-check all compiler-emitted externs and compiler-derived public aliases at once. Refused legacy facade modules stay outside this dependency-closed output gate.
- **Default-public-API gate** — compare every generated web `flight.*` type, function signature,
  and value in both directions against the hidden compiler extern contract and its per-package
  ledger. Missing, invented, duplicated, or drifted public declarations fail.
- **Native-surface reconciliation gate** — reconcile all 153 web package contracts with
  flight-cpp's complete/dependency-incomplete/refused module inventory and the exact
  `src-cpp/manifest.json` partition plus the symbol-backed type/function/value attempt ledgers.
  The attempt gates load all 3,073 types and all 966 unproven function/value declarations on the
  C++ target. Header-confirmed or Haxe-type-checking declarations remain probe candidates, never
  silently promoted to compile-proven support.
- **Compiler-coverage gate** — reconcile manifests, initialization plans, refusal ledgers, public runtime export partitions, and public type aliases in both directions; ratchet the pinned corpus so support may improve but cannot silently shrink.
- **Runtime-contract gate** — declare and verify `flight-runtime-contract/2`, `flight-runtime-constructor-abi/1`, and `flight-runtime-task-capability-abi/1`; compile every maintained runtime module on JS and execute the host-free portable subset on Haxe eval.
- **Transpiled-source gate** — type-check all 7,224 compiler and compiler-derived backend files, execute public `flight.*` functions on JS, then run public Math/Effects plus compiler-emitted Float32/map/task code on Haxe eval.
- **Differential-behavior gate** — compare deterministic compiler-emitted Haxe results with the same pinned Flight JavaScript functions through a real bundled ESM oracle.

## Examples: for the layer, not for Flight

Examples here prove **the binding is faithful, ergonomic, and pays-per-use** — not "what Flight can do." Capability demos (a particle sim, a game) are the same idea in any language and belong **upstream in Flight**; hand-porting Flight's catalog would be a parallel suite that rots as Flight's evolves, in a repo whose thesis is _bind, don't reimplement_. Litmus test: _does this teach something about flight-hx that the same example in Flight's TypeScript wouldn't?_ If it's just a cool demo → upstream. If it shows the Haxe surface, a pipeline linking, or the bundle staying small → here.

Because the Haxe surface is generated from the same flight-compiler IR that produced Flight's TS, a Flight TS example is near-mechanically translatable to Haxe — so "Flight example N in Haxe" is a _generated artifact on demand_, not a hand-maintained parallel suite.

Tiers (host per the host-axis rule — core examples use no host or Flight's own; never Lime/Clay):

- `examples/cross-target-math/` — one installed-package source file compiled and executed through the complete web externs, all 282 manifest-proven flight-cpp bindings, and the optional pure-Haxe fallback.
- `examples/headless/` — no host; `flight.*` calls under all backends. The bulk lives here.
- `examples/fallback-hx/` — the `_hx` fallback compiling+running on a `js` target (the Lime/Clay-web scenario) via a define flip, **without** a real Lime dependency.
- `examples/window-native/` — Flight's own host, `cpp` → `_cpp`; an executable manifest-recorded platform extension that creates a real SDL3/OpenGL surface, clears it through flight-cpp's adapter, and presents it. This proves the native host seam without claiming the entire generated renderer contract.
- `examples/camera2d/` — one branch-free Haxe-authored deterministic Scene2D graph using public `flight.Scene2dApp`, `Sprite`, `Shape`, and `DisplayObject` names. Those types resolve to current Flight ESM structural externs on web and session-owned flight-cpp handles on native. The gate builds and runs flight-cpp's upstream Camera2D smoke as the control, compiles/links the web bundle, and runs three offscreen native frames with framebuffer coverage and center-player pixel checks.
- `examples/window-web/` — Flight's own browser host, `js` + `flight_esm` → `_js`; still awaiting the portable window/render counterpart. The `_js` backend, `tools/esm`, web behavior, and DCE gates are already live.

## Status

`flight-compiler` is the only source generator. The production lock pins Flight `a627849`, compiler
`804435a`, and flight-cpp `a2fdb53`. The pinned flight-cpp SDK was generated with compiler `806d257`;
both compiler revisions are recorded instead of being treated as equal. Extern mode scans and accepts all 3,144 production modules in the
153-package SDK graph, emits 3,224 compiler files plus 3,197 complete public facade modules, and
records two exact downstream compatibility corrections. Its full surface type-checks; the default
`flight.*` API contains all 3,071 types, 6,906 functions, and 1,254 value fields. Those fields plus
seven runtime type/value identities account for all 8,167 expected ESM declarations, with zero
missing and zero unexpected. `@flighthq/webcam` is retained in the package ledger but currently has
an empty contract.

The optional transpile implementation corpus remains pinned at Flight `65889a` and compiler
`5649642`: it scans all 2,866 non-test modules and emits 1,110 dependency-closed implementation
modules. Its checked-in 7,224-file tree still compiles under Haxe 4.3.7 and its public behavior
matches its pinned Flight JavaScript oracle. Because it now differs from the current production
extern source pin, refresh and parity checks explicitly skip instead of deriving or claiming false
cross-revision parity. Regenerating that optional corpus at `a627849` will re-enable those claims.
The remaining 1,756 source modules stay explicit upstream compiler refusals, never stubs.

The ESM path consumes compiler-emitted `@:jsImport` externs through the vendored static-module
generator. Extern generation (`generate:check:extern`) remains deterministic and part of the
production check; a full new TS-to-Haxe transpile remains an explicit optional compiler-maintenance
task. The compile-proven `_cpp` slice exposes 282 functions across 35 holders. An isolated `-lib flight` consumer compiles and runs the same Haxe source against
current flight-cpp on hxcpp and current Flight ESM on web. The same gate builds the current
`Flight::HostSdlGl`, then compiles and runs the packaged Haxe native sample through a real SDL3 window,
OpenGL context, clear, and present. The portable generated renderer surface remains future work; the
native platform extension does not overstate it.

`src-cpp/reconciliation.json` makes the remaining native work concrete: flight-cpp currently has
1,902 dependency-complete modules, 672 dependency-incomplete modules, and 577 refused modules. The
compile/run-proven native surface has 282 functions and three upstream Scene2D types (plus the
maintained `Scene2dNode` integration handle). The broader default native root attempts every one of
the 4,268 declarations for which flight-cpp provides a locator: 3,073 types, 587 still-unproven
functions, 379 still-unproven values, and 229 already-proven functions are materialized; 44 nested
generic reference types use generated alias-template adapters. Every unproven function/value has a
per-symbol hidden `extern inline` boundary, preventing an imported proven holder from compiling all
of its experimental siblings. The other 6,979 public rows have no compiler/flight-cpp plan locator
and remain explicitly unavailable through the generated path. All attempts type-check on the Haxe
C++ target. The first concrete ABI seams are now covered by 45 compile/run-proven flat/recursive
`Array<Float>` adapters with alias preservation, optional-output identity, and mutation copy-back,
two nullable UTF-8 String adapters, and 113 shared-ownership reference-carrier bindings across 15
packages. Optional
reference-family scalars cross the bridge with explicit presence bits; public native wrappers are
call-site-only `extern inline` functions to avoid hxcpp's reflected-wrapper arity ceiling. The 69 remaining
header-confirmed scalar candidates and every other complex carrier remain unpromoted until
compile/run evidence exists.
