# flight-hx

Haxe **bindings** for the [Flight SDK](https://github.com/flighthq/flight) — one `flight.*` surface that resolves, by compile define, to compiled Flight: C++ (via [flight-cpp](https://github.com/flighthq/flight-cpp)) on native, ESM on web, and an optional transpiled-Haxe fallback for pure-VM targets.

This is not a Haxe reimplementation of Flight; it binds to it. See [AGENTS.md](AGENTS.md) for the architecture, the rationale, and the decisions behind every part.

## Layout

- `src/flight/` — maintained runtime shim + the `flight.*` backend selectors.
- `generated/js` — compiler-emitted ESM externs; `generated/hx` — compiler-emitted transpiled fallback.
- `tools/backend-hx/` — deterministic flight-compiler integration, compatibility, and provenance.
- `tools/esm/` — the vendored ESM generator (web pay-per-use).
- `tests/gates/` — behavioral, backend-parity, and web-DCE gates.
- `dependencies.lock.json` + `scripts/` — pins `flight`/`flight-compiler`/`flight-cpp`, rehydrated into a gitignored `.dependencies/`.

## Develop

```sh
npm ci && npm run setup     # provision the pinned Haxe (4.3.7)
npm run rehydrate           # materialize pinned flight / flight-compiler / flight-cpp
npm install --prefix .dependencies/flight-compiler && npm run generate
npm run proof               # compile + run the proof-of-shape on the flight_hx backend
npm run gate:proof          # behavioral gate: proof runs, and no-backend fails loud
npm run gate:surface        # type-check every emitted extern and public type alias
npm run gate:bindings       # verify every extern function/value against built real Flight ESM
npm run gate:parity         # exact JS↔HX signatures + supported/unavailable partitions
npm run gate:runtime        # declared compiler runtime ABI + portable behavior
npm run gate:transpile      # compile the full generated HX tree and execute public facades
npm run gate:behavior       # differential HX-vs-pinned-Flight semantic oracle
npm run generate:check      # regenerate both modes in memory and reject drift
npm run check               # run every production gate, including web behavior/DCE and drift
```

The pinned compiler scans the complete 154-package Flight SDK graph. Extern generation accepts 1,635 of 2,855 production modules, emits 2,096 compiler files plus 2,016 public type aliases, and binds 2,625 functions plus 468 values that are checked against real Flight ESM. Its reverse inventory accounts for all 7,082 public contract value exports: 3,093 emitted, 3,989 explicitly missing, and zero unexpected.

Transpilation accepts 1,110 of 2,866 non-test modules and produces 1,110 compiler files plus 4,085 compiler-derived backing/public facade files. The usable `flight.*` fallback surface contains 2,016 compiler-correlated type identities, 175 functions, and 345 values; function/value signatures and type generic arity match the extern backend. The remaining 2,573 extern declarations are explicitly unavailable in `generated/hx/public-surface.json`. Unsupported source modules remain explicit in each mode's `refusals.json`; generated files are never silent stubs.

The complete 5,195-file transpiled tree compiles and executes on JavaScript using the native ECMAScript implementation of `flight-runtime-contract/2`. A host-free public Math/Effects slice plus compiler-emitted easing and Rive table code also runs on Haxe eval through the maintained portable Float32, map, set, symbol, and task shims. Browser-specific modules remain JavaScript-target APIs rather than pretending to be portable DOM implementations.
