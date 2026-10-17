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
`-D flight_cpp_root=/path/to/flight-cpp` and link the pinned-compatible flight-cpp SDK. The optional
SDL3/GL host extension also receives `-D flight_cpp_build=/path/to/flight-cpp/build`. Defining
`flight_hx` elects the optional pure-Haxe fallback. The cross-target gate registers a clean isolated
haxelib repository, builds and installs the deterministic consumer archive, proves one Haxe source
on all three forms, and separately creates and presents a real flight-cpp SDL3/GL surface.

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
npm run gate:cross-target   # 3-backend scalar proof + SDL3/GL host and Camera2D framebuffer proofs
npm run generate:check:extern # regenerate externs in memory and reject drift
npm run refresh:transpile-surface:check # reject fallback facade/partition drift
npm run check               # run every production gate, including web behavior/DCE and drift
```

The pins now move together for the production SDK: Flight `a627849`, flight-compiler `806d257`, and
flight-cpp `f4821b`. The compiler scans the complete current 153-package Flight SDK graph. Extern
generation accepts all 3,144 production modules and emits 3,224 compiler files plus 3,071 public
type aliases. All 8,167 public runtime declarations and 3,071 types are accounted for, every package
is fully covered, and nothing is missing or unexpected. Two narrow downstream compatibility
corrections are manifest-recorded with exact application counts and fail on drift.

The optional transpilation corpus intentionally remains at Flight `65889a` and accepts 1,110 of
2,866 non-test modules, producing 1,110
compiler-emitted implementation files. A deterministic downstream refresh intersects those pinned
implementations with the matching extern golden reference when their source pins agree. Until that
optional corpus is regenerated at `a627849`, refresh and parity gates report an explicit cross-pin
skip instead of claiming that its older surface matches the current web SDK. Its checked-in surface
still contains 3,012 type identities, 237 functions, and 382 values; unsupported source modules
remain explicit in `generated/hx/refusals.json`, never silent stubs.

The complete 7,224-file transpiled tree compiles and executes on JavaScript using the native ECMAScript implementation of `flight-runtime-contract/2`. A host-free public Math/Effects slice plus compiler-emitted easing and Rive table code also runs on Haxe eval through the maintained portable Float32, map, set, symbol, and task shims. Browser-specific modules remain JavaScript-target APIs rather than pretending to be portable DOM implementations.

Native integration starts from what the pinned current flight-cpp SDK actually provides, rather than waiting
for full TS-to-Haxe transpilation or claiming parity it has not earned. `src-cpp/manifest.json` records
ten compile-proven scalar bindings across Math and Color, the generated SDK's distinct source/compiler
revisions, C++20, and the two downstream hxcpp/flight-cpp corrections. The current generated native
SDK reports 2,563 emitted modules; Haxe exposes only the smaller exact partition it actually proves.
`examples/cross-target-math/` compiles and runs the same installed-package consumer against those
headers on desktop and the current complete ESM externs on web. `examples/window-native/` additionally
links `Flight::HostSdlGl` and uses the real SDL3 window, OpenGL context, clear, and presentation path.
`examples/camera2d/` then authors one deterministic Haxe Scene2D graph through the public
`flight.Scene2dApp`, `Sprite`, `Shape`, and `DisplayObject` surface. Its sample has no target branch:
the library selects current ESM structural externs on web and opaque handles into a narrow
flight-cpp ownership session on native. The cross-target gate compiles and bundles the web form,
runs flight-cpp's full upstream Camera2D smoke as a control, and requires three native offscreen
frames to pass coverage and center-player pixel checks. These are explicit platform extensions, not
yet a claim that every generated renderer contract is portable through the common facade.
Future flight-compiler and flight-cpp improvements should shrink the correction inventory and expand
that manifest without weakening its fail-loud boundary.
