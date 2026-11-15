# Rust Flight extern intake

The replacement source for Haxe bindings is the Rust tooling inside
[Flight](https://github.com/flighthq/flight): native binaries through FFI and web
ESM through externs. The separate TypeScript flight-compiler repository,
flight-cpp adapters, and transpiled Haxe fallback are being retired from the
production path. Do not add new Haxe implementations or extend those legacy
adapters during this migration.

The local dependency pin still names the old TypeScript Flight snapshot. Until
the new Rust revision is available and its output has been validated, the old
package selection remains in place. This driver prepares the intake; it does
not claim the installed package has switched to the new bindings.

The upstream source has now been inspected: the recipe exists on `develop`, at
`49c510e875461a9235b24ee846015ec1b47acd2a`. The inspected `main` revision
`9de3cab1b68872c52264f5d83b6c05318a390599` has `flight-compiler` but no
`flight-ffi`, `flight-bindgen`, or Haxe binding check script. The matching checkout
is currently available locally at `.dependencies/flight-rust`.

## Generate and copy

Use a clean Git checkout of the new Rust Flight workspace and an installed Rust
toolchain. No Flight sources are modified by this driver; Cargo will write its
normal build artifacts in that workspace.

```sh
npm run generate:externs -- --flight-root /path/to/flight
npm run generate:externs:check -- --flight-root /path/to/flight
npm run check:externs:upstream -- --flight-root /path/to/flight
```

`FLIGHT_ROOT` also selects the checkout; the default is `.dependencies/flight`.
Cargo uses offline mode by default. To permit downloading missing Cargo packages,
explicitly append `--allow-network`.

The generation steps are the upstream recipe:

```sh
cargo build -p flight-ffi
cargo run --bin flight-offsets > /tmp/offsets.json
grep -oP '(?<=fn )(flight_[a-z0-9_]+)' target/debug/build/flight-ffi-*/out/ffi_generated.rs \
  | sort -u > /tmp/ffi-names.txt
cargo run -p flight-bindgen -- --target haxe --out <output-dir> \
  --offsets /tmp/offsets.json --ffi-names /tmp/ffi-names.txt
scripts/check-haxe-bindings.sh
```

The driver uses private temporary files instead of shared `/tmp` names. It asks
Cargo for the current build-script output path, avoiding a glob that can read
stale FFI builds. It copies generated output without Haxe rewriting into
`generated/externs/`, adding a `provenance.json` with the Flight revision, input
hashes, FFI symbol count, and per-file hashes. Generation failures leave the
previous copied tree intact. Check mode detects changed, missing, and extra files
without replacing that tree.

`check:externs:upstream` runs the script **inside Flight**, with Flight's own
arguments and target matrix. It validates the upstream output selected by that
script; it does not establish that this repository's copied bindings link or
run. The local drift check and installed-package behavior checks are separate.

`node tools/externs/check.mjs` verifies the copied inventory and hashes against
its provenance and the dependency lock, then type-checks that copied tree on HL,
cpp, and JS/ESM using the same target exclusions as the upstream script. It can
run once the new Flight revision is pinned and real output has been copied.

## Runtime contract found upstream

The `develop` generator emits native C ABI extern names (`flight_*`) without a
C header or hxcpp link configuration. Its JS externs use `@:jsRequire("flight")`
with the same `flight_*` export names. They do not bind the existing
`@flighthq/*` TypeScript ESM exports directly. The ESM generator can emit static
imports for that module, but an actual module implementing those exports is
still required. These are runtime integration requirements to verify, beyond the
upstream script's type-check-only results.

## Remaining cutover work

After obtaining and validating the real output:

1. Pin the new Flight revision and remove the separate compiler/flight-cpp pins.
2. Replace package/classpath selection with the generated native FFI and ESM
   entry points. Determine native link/header requirements from that output.
3. Remove the transpiled fallback and local C++ adapters from the consumer
   archive and update examples to the generated API.
4. Replace legacy production gates and CI with generated-surface checks,
   installed-package FFI/ESM execution, and drift checks for the new revision.

`npm run test:externs-driver` tests intake orchestration and failure isolation
using fixtures. It is not upstream Haxe type-check or native ABI evidence.
