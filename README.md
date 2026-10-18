# flight-hx

Haxe **bindings** for the [Flight SDK](https://github.com/flighthq/flight) — one `flight.*` surface that resolves, by compile define, to compiled Flight: C++ (via [flight-cpp](https://github.com/flighthq/flight-cpp)) on native, ESM on web, and an optional transpiled-Haxe fallback for pure-VM targets.

This is not a Haxe reimplementation of Flight; it binds to it. See [AGENTS.md](AGENTS.md) for the architecture, the rationale, and the decisions behind every part.

## Layout

- `src/flight/` — maintained runtime shim + the `flight.*` backend selectors.
- `src-cpp/` — the compile-proven native manifest plus generated, explicitly unproven bindings for
  every declaration that current flight-cpp locates.
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
haxelib repository, builds and installs the deterministic consumer archive, proves one branch-free
Haxe source on current ESM and flight-cpp, runs a focused proof for the independently pinned fallback,
and separately creates and presents a real flight-cpp SDL3/GL surface.

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
npm run gate:default-api    # exact bidirectional hidden-extern ↔ public flight.* comparison
npm run gate:native-surface # reject drift in the package-by-package C++ reconciliation
npm run gate:native-types   # type-check every symbol-backed native type attempt
npm run gate:native-attempts # type-check every symbol-backed function/value attempt
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

The production pins are Flight `a627849`, flight-compiler `804435a`, and flight-cpp `a2fdb53`.
The flight-cpp snapshot was generated from the same Flight source with compiler `806d257`; both
compiler revisions are recorded rather than incorrectly treated as equal. A later tested flight-cpp
head (`4a7dbfd`) is intentionally not pinned: its own Camera2D target fails because
`shape_stroke.hpp` initializes an inherited `ShapeStrokeRegion.path` as a direct designated member.
The compiler scans the complete current 153-package Flight SDK graph. Extern
generation accepts all 3,144 production modules and emits 3,224 compiler files plus 3,197 complete
default-public-API modules. The generated `flight.*` web surface contains 3,071 types, 6,906
functions, and 1,254 values across all 153 package contracts. All 8,167 runtime declarations are
accounted for, every non-empty package contract is fully covered, and nothing is missing or
unexpected. (`@flighthq/webcam` currently has an empty contract.) Two narrow downstream
compatibility corrections are manifest-recorded with exact application counts and fail on drift.
Public web forwarding also converts Haxe's omitted-argument `null` sentinel to JavaScript
`undefined` for every optional parameter, preserving upstream default-parameter behavior; the
complete default-API gate checks every such forwarding site.

The optional transpilation corpus intentionally remains at Flight `65889a` and accepts 1,110 of
2,866 non-test modules, producing 1,110
compiler-emitted implementation files. A deterministic downstream refresh intersects those pinned
implementations with the matching extern golden reference when their source pins agree. Until that
optional corpus is regenerated at `a627849`, refresh and parity gates report an explicit cross-pin
skip instead of claiming that its older surface matches the current web SDK. Its checked-in surface
still contains 3,012 type identities, 237 functions, and 382 values; unsupported source modules
remain explicit in `generated/hx/refusals.json`, never silent stubs.

A current-source transpile was also attempted with compiler `804435a`. Its all-module smoke exposed
upstream lowering gaps after two initial inference errors: missing type re-exports, generic-call
arity, structural controller inheritance, numeric carriers, and map fallback typing. The atomic
generator therefore preserved the known-good fallback instead of publishing a partially compiling
tree. These fallback gaps do not reduce the complete current ESM extern surface or C++ binding plan.

The complete 7,224-file transpiled tree compiles and executes on JavaScript using the native ECMAScript implementation of `flight-runtime-contract/2`. A host-free public Math/Effects slice plus compiler-emitted easing and Rive table code also runs on Haxe eval through the maintained portable Float32, map, set, symbol, and task shims. Browser-specific modules remain JavaScript-target APIs rather than pretending to be portable DOM implementations.

Native integration starts from what the pinned current flight-cpp SDK actually provides, rather than waiting
for full TS-to-Haxe transpilation or claiming parity it has not earned. `src-cpp/manifest.json` records
122 compile-proven bindings across 24 public modules: 62 compiler-planned direct calls, four
compiler-emitted UTF-8 String adapters, 53 required-primitive overrides, and three optional-scalar
adapters from dependency-complete
flight-cpp headers. It also records the generated SDK's
distinct source/compiler revisions, C++20, and the two downstream hxcpp/flight-cpp corrections. The current generated native
SDK reports 2,574 emitted modules. The manifest remains the exact compile/run-proven partition; the
default native Haxe root now also exposes a separately recorded attempt tier instead of hiding
unproven declarations.
The checked `src-cpp/reconciliation.json` splits that total into 1,902 dependency-complete and 672
dependency-incomplete modules, alongside 577 refused modules. It reconciles every web package with
the 122 bound functions, three upstream Scene2D handle types, one integration-only handle, and the
remaining gaps. Of 11,247 public SDK rows, flight-cpp provides a locator for 4,268. All 3,073
symbol-backed type attempts are materialized, including 894 declarations previously refused by the
Haxe/C++ planner; 44 nested generic reference carriers use generated C++ alias templates. The same
default `flight.*` root now contains the 69 compiler-located functions already in the proven
partition plus 747 unproven function attempts and 379 unproven value attempts across 42 holders.
Each attempt forwards through its own hidden `extern inline` class, so importing one proven holder
does not compile all of its experimental siblings; selecting an attempt still reaches its real
Flight header and symbol.
The other 6,979 rows remain explicit `flight-cpp-symbol-unavailable` entries:
there is no native symbol to bind yet.

The attempt gates prove that this entire tree resolves and type-checks as Haxe for the C++ target;
they deliberately do not relabel it ABI-safe. An actual hxcpp probe of
`Adjustments.createBrightnessColorMatrix` reaches its Flight symbol and then fails at the first
known carrier seam (`flight::Array<double>` versus hxcpp `Array<double>`), recorded as requiring an
array adapter. Carrier-family counts in `src-cpp/binding-attempts.json` make the next adapter work
concrete. The reconciliation still identifies 69 unpromoted scalar functions across 32 packages;
header presence or type-check success never silently promotes an attempt to compile-proven support.
The compiler-owned dual plan covers all 11,247 public rows and emits 2,245 Haxe-C++ declarations.
All 66 header-passing function candidates are promoted: 62 directly and four through the compiler's
exact adapter emissions (`Audio.getAudioMimeTypeEssence`, `Color.computeRgbHexString`,
`Color.computeRgbaCssString`, and `Protocol.isValidProtocolScheme`). Those adapters copy through
UTF-8 in isolated translation units, keeping Flight headers outside hxcpp-generated namespaces.
The 53 required-scalar functions and three optional-scalar adapters are explicit flight-hx
golden-reference overrides for functions that the current compiler plan omits despite
dependency-complete definitions in flight-cpp. Optional adapters carry an explicit presence bit and
reconstruct `std::optional`, preserving omitted and supplied arguments without exposing that
transport publicly. Generation requires exact primitive signatures and fails once the compiler
begins planning them, making future upstream support replace rather than coexist with the downstream
override. The newer flight-cpp Spine helper override makes the formerly refused
`Skeleton2dFormats.clampUnit` header compile cleanly, so that function now joins the same
compile-and-run-proven native partition.
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
