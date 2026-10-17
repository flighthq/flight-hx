# flight-hx

Haxe **bindings** for the [Flight SDK](https://github.com/flighthq/flight) — one `flight.*` surface that resolves, by compile define, to compiled Flight: C++ (via [flight-cpp](https://github.com/flighthq/flight-cpp)) on native, ESM on web, and an optional transpiled-Haxe fallback for pure-VM targets.

This is not a Haxe reimplementation of Flight; it binds to it. See [AGENTS.md](AGENTS.md) for the architecture, the rationale, and the decisions behind every part.

## Layout

- `src/flight/` — maintained runtime shim + the `flight.*` backend selectors.
- `src-cpp/` — explicit native facade overrides, bridge headers, and the pinned support manifest.
- `haxelib.json` + `lib/flight_hx/Package.hx` — installed-package metadata and target classpath election.
- `generated/js` — compiler-emitted ESM externs; `generated/hx` — compiler-emitted transpiled fallback.
- `tools/backend-hx/` — deterministic flight-compiler integration, compatibility, and provenance.
- `tools/esm/` — the vendored ESM generator (web pay-per-use).
- `tests/gates/` — behavioral, backend-parity, and web-DCE gates.
- `dependencies.lock.json` + `scripts/` — pins `flight`/`flight-compiler`/`flight-cpp`, rehydrated into a gitignored `.dependencies/`.

## Consume

The haxelib name is `flight`. Its initialization macro selects exactly one checked-in backend root,
so consumers use `-lib flight` instead of reproducing this repository's classpath ordering. Web
builds additionally define `flight_esm` and use the bundled static ESM generator; native builds pass
`-D flight_cpp_root=/path/to/flight-cpp` and link the pinned-compatible flight-cpp SDK. Defining
`flight_hx` elects the optional pure-Haxe fallback. The cross-target gate registers a clean isolated
haxelib repository, builds and installs the deterministic consumer archive, and proves all three
forms from the same source.

## Develop

```sh
npm ci && npm run setup     # provision pinned Haxe 4.3.7 + hxcpp
npm run rehydrate           # materialize pinned flight / flight-compiler / flight-cpp
npm install --prefix .dependencies/flight-compiler && npm run generate -- --extern
npm run refresh:transpile-surface # re-derive the fallback's public subset from current externs
npm run package:haxelib      # build dist/flight-0.5.0.zip from the consumer-only allowlist
npm run proof               # compile + run the proof-of-shape on the flight_hx backend
npm run gate:proof          # behavioral gate: proof runs, and no-backend fails loud
npm run gate:surface        # type-check every emitted extern and public type alias
npm run gate:bindings       # verify every extern function/value against built real Flight ESM
npm run gate:parity         # exact JS↔HX signatures + supported/unavailable partitions
npm run gate:runtime        # declared compiler runtime ABI + portable behavior
npm run gate:transpile      # compile the full generated HX tree and execute public facades
npm run gate:behavior       # differential HX-vs-pinned-Flight semantic oracle
npm run gate:cross-target   # run one isolated haxelib consumer on ESM, hxcpp, and pure Haxe
npm run generate:check:extern # regenerate externs in memory and reject drift
npm run refresh:transpile-surface:check # reject fallback facade/partition drift
npm run check               # run every production gate, including web behavior/DCE and drift
```

The pinned compiler scans the complete 154-package Flight SDK graph. Extern generation accepts all
2,855 production modules and emits 3,166 compiler files plus 3,012 public type aliases. The complete
surface contains 6,204 functions and 873 values; all 7,077 public runtime declarations are accounted
for, all 154 packages are fully covered, and nothing is missing or unexpected. Two narrow downstream
Haxe syntax corrections are manifest-recorded with exact application counts and fail on drift.

The optional transpilation corpus accepts 1,110 of 2,866 non-test modules and contains 1,110
compiler-emitted implementation files. A deterministic downstream refresh intersects those pinned
implementations with the current extern golden reference, deriving 6,114 backing/public files. The
usable `flight.*` fallback surface contains 3,012 type identities, 237 functions, and 382 values;
function/value signatures and type generic arity match the extern backend. The remaining 6,452
extern declarations are explicitly unavailable in `generated/hx/public-surface.json`, which records
both compiler revisions. Unsupported source modules remain explicit in each mode's `refusals.json`;
generated files are never silent stubs.

The complete 7,224-file transpiled tree compiles and executes on JavaScript using the native ECMAScript implementation of `flight-runtime-contract/2`. A host-free public Math/Effects slice plus compiler-emitted easing and Rive table code also runs on Haxe eval through the maintained portable Float32, map, set, symbol, and task shims. Browser-specific modules remain JavaScript-target APIs rather than pretending to be portable DOM implementations.

Native integration starts from what the pinned flight-cpp SDK actually provides, rather than waiting
for full TS-to-Haxe transpilation or claiming parity it has not earned. `src-cpp/manifest.json` records
ten compile-proven scalar bindings across Math and Color, the generated SDK's distinct source/compiler
revisions, C++20, and the two downstream hxcpp/flight-cpp corrections. A C++ header audit found only
four of 30 callable generated headers compile unchanged today; three form this safe scalar partition,
while the fourth has unresolved callback ownership. `examples/cross-target-math/` compiles and runs
the same installed-package consumer against those headers on desktop and the complete ESM externs on
web. Future flight-compiler and flight-cpp improvements should shrink the correction inventory and
expand the manifest.
