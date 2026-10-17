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

Every public module resolves, by compile define, to one of three hidden backends: `flight._cpp.*` (`#if cpp`), `flight._js.*` (`#if js`), `flight._hx.*` (`#if flight_hx`, optional). Two unification mechanisms, because Haxe can alias a type but not a free function:

- **Types are conditional typedefs.** `flight.Vector2` aliases the active backend's type. Types stay **structural typedefs** wherever the backend is structural (not forced into nominal classes).
- **Function facades are module-level free functions whose bodies `#if`-dispatch** to hidden extern classes. `flight.Geom.addVector2(...)` is a module-level free function; its `inline` body forwards to `flight._cpp.Geom.addVector2` / `flight._js.Geom.addVector2` / `flight._hx.Geom.addVector2`. Module-level (not class statics) so that free functions keep Flight's globally-searchable feel and a bare `import flight.Geom` yields unqualified calls to _all_ its free functions (the `.*` wildcard does **not** — it resolves to a type named `Geom`, which the module deliberately lacks; import the module itself, or a named field `import flight.Geom.addVector2`); the hidden `_cpp`/`_js` classes are `extern` because that's where `@:native`/`@:jsImport` binding actually works. `inline` makes the forwarder zero-cost.

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
- `src/flight/` — the maintained runtime shim: public unifiers, hidden `_hx` bodies + `_cpp`/`_js` extern drafts, the small inlined-Haxe value primitives (hot math, most valuable on JS).
- `tools/backend-hx/` — the thin flight-compiler integration and downstream compatibility boundary.
- `tools/esm/` — the vendored, purpose-built ESM generator (genes as reference, not a fork; scoped to this repo's generated vocabulary; pinned Haxe underneath).
- `tests/gates/` — the gates below. `tests/haxe/` — consumer-style Haxe fixtures.
- `examples/` — layer examples, scoped per the Examples section (not a port of Flight's catalog).
- Build wiring (hxml + `@:buildXml` DCE flags). Host _backends_ are on-top integrations, not owned here (see the host-axis section).

## Gates (fail-loud, per the Flight discipline)

- **Cross-target behavioral gate** — compile one Haxe consumer against the complete ESM externs and the manifest-recorded direct flight-cpp subset, link/bundle both backends, run both, and inspect generated C++ for direct calls. This is the check that catches native-only breakage; byte-diffing and the JS oracle are blind to it.
- **Backend-parity gate** — every available `_hx` function/value must exactly match its `_js` signature, type identities must match in name and generic arity, and every `_js` declaration must occur in exactly one supported/unavailable partition. Haxe treats interface methods and function-valued fields as distinct assignability representations even though calls are equivalent; normalizing that compiler-emission seam belongs upstream. Native support is deliberately a smaller, exact partition in `src-cpp/manifest.json` until flight-cpp catches up.
- **Web-DCE gate** — build a sample, bundle it, assert imports are static `import { … }` and an unused Flight function is absent from the bundle. Defines "the ESM generator works precisely."
- **Binding-existence gate** — the validation type-checking cannot do: a Haxe extern is an unchecked promise, so load the _real_ Flight ESM for every generated contract holder and assert each bound function and value resolves to the right runtime export. Covers the emitted surface (6,204 functions and 873 values), not the few an example calls. Types aren't checked at runtime (TS interfaces are erased from ESM); their fidelity rests on the shared inventory + the surface type-check.
- **Generated-surface gate** — type-check all compiler-emitted externs and compiler-derived public aliases at once. Refused legacy facade modules stay outside this dependency-closed output gate.
- **Compiler-coverage gate** — reconcile manifests, initialization plans, refusal ledgers, public runtime export partitions, and public type aliases in both directions; ratchet the pinned corpus so support may improve but cannot silently shrink.
- **Runtime-contract gate** — declare and verify `flight-runtime-contract/2`, `flight-runtime-constructor-abi/1`, and `flight-runtime-task-capability-abi/1`; compile every maintained runtime module on JS and execute the host-free portable subset on Haxe eval.
- **Transpiled-source gate** — type-check all 7,224 compiler and compiler-derived backend files, execute public `flight.*` functions on JS, then run public Math/Effects plus compiler-emitted Float32/map/task code on Haxe eval.
- **Differential-behavior gate** — compare deterministic compiler-emitted Haxe results with the same pinned Flight JavaScript functions through a real bundled ESM oracle.

## Examples: for the layer, not for Flight

Examples here prove **the binding is faithful, ergonomic, and pays-per-use** — not "what Flight can do." Capability demos (a particle sim, a game) are the same idea in any language and belong **upstream in Flight**; hand-porting Flight's catalog would be a parallel suite that rots as Flight's evolves, in a repo whose thesis is _bind, don't reimplement_. Litmus test: _does this teach something about flight-hx that the same example in Flight's TypeScript wouldn't?_ If it's just a cool demo → upstream. If it shows the Haxe surface, a pipeline linking, or the bundle staying small → here.

Because the Haxe surface is generated from the same flight-compiler IR that produced Flight's TS, a Flight TS example is near-mechanically translatable to Haxe — so "Flight example N in Haxe" is a _generated artifact on demand_, not a hand-maintained parallel suite.

Tiers (host per the host-axis rule — core examples use no host or Flight's own; never Lime/Clay):

- `examples/cross-target-math/` — one source file compiled and executed through both the complete web externs and the representative direct flight-cpp native path.
- `examples/headless/` — no host; `flight.*` calls under all backends. The bulk lives here.
- `examples/fallback-hx/` — the `_hx` fallback compiling+running on a `js` target (the Lime/Clay-web scenario) via a define flip, **without** a real Lime dependency.
- `examples/window-native/` — Flight's own host, `cpp` → `_cpp`; the one real end-to-end app on native (feeds the behavioral gate). Stubbed until the `_cpp` backend lands.
- `examples/window-web/` — Flight's own host, `js` + `flight_esm` → `_js`; the same app proving the ESM/bundle/DCE path (feeds the web-DCE gate). Stubbed until the `_js` backend + `tools/esm` land.

## Status

`flight-compiler` is the only source generator. The lock pins compiler revision `9edfcca`. Extern mode scans and accepts all 2,855 production modules in the 154-package SDK graph (excluding eleven `*TestHelper.ts` modules), emits 3,166 compiler files plus 3,012 public aliases, and records two exact downstream syntax corrections. Its full surface type-checks; all 6,204 functions and 873 values resolve to real Flight ESM exports. The reverse inventory records all 7,077 expected runtime exports, zero missing, and zero unexpected.

The optional transpile implementation corpus remains pinned at compiler revision `5649642`: it scans
all 2,866 non-test modules and emits 1,110 dependency-closed implementation modules. The lightweight
`refresh:transpile-surface` step intersects those files with the current extern golden reference and
derives 6,114 backing/public files: 3,012 public types, 237 functions, and 382 values exactly match the
JS signatures, while 6,452 unavailable declarations stay machine-readable. Both compiler revisions
are explicit in the derivation ledger. The complete 7,224-file tree compiles under Haxe 4.3.7; public
fallback behavior matches pinned Flight JavaScript for 39 deterministic results. The maintained
JavaScript runtime implements the complete declared compiler ABI, and the portable host-free subset
executes on Haxe eval. The remaining 1,756 source modules are explicit upstream compiler refusals
recorded in `generated/hx/refusals.json`, never stubs.

The ESM path consumes compiler-emitted `@:jsImport` externs through the vendored static-module generator. Extern generation (`generate:check:extern`) and downstream fallback-surface derivation (`refresh:transpile-surface:check`) are independently deterministic and part of the production check; a full new TS-to-Haxe transpile remains an explicit compiler-maintenance task. The first direct `_cpp` slice is live: one cross-target Haxe Math sample compiles and runs against pinned flight-cpp on hxcpp and against ESM on web. Its exact three-function native partition and correction inventory are recorded in `src-cpp/manifest.json`; expanding that partition and landing the real windowed native example remain follow-up work.
