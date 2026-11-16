# Rust Flight extern intake

Bindings come from the Rust tooling inside Flight. The source pin is Flight
`develop` revision `49c510e875461a9235b24ee846015ec1b47acd2a`; the inspected `main`
revision does not have the binding crates. There is one dependency pin, for
Flight, with `flight-compiler`, `flight-ffi`, and `flight-bindgen` inside it.

## Generate and copy

Use a clean checkout and an installed Rust toolchain. The driver prepares an
isolated copy under `.artifacts/flight-source-*` and applies the tracked
`patches/flight/` producer patch there. The original checkout stays clean.
Both generated Haxe and native binaries use this exact patched producer.

```sh
npm run rehydrate
npm run generate:externs -- --allow-network  # allow initial Cargo dependency downloads
npm run generate:externs:check
npm run check:externs:upstream
```

`FLIGHT_ROOT` or `--flight-root <path>` selects another checkout; the default is
`.dependencies/flight`. Update `dependencies.lock.json` when changing the source
revision. Cargo is offline unless `--allow-network` is supplied. Repository-local
Rust in `.artifacts/rust/{cargo,rustup}` is recognized automatically, as is an
ordinary toolchain on PATH. Haxe validation uses the repository's pinned compiler.

The generation steps follow the supplied upstream recipe:

```sh
cargo build -p flight-ffi
cargo run --bin flight-offsets > /tmp/offsets.json
grep -oP '(?<=fn )(flight_[a-z0-9_]+)' target/debug/build/flight-ffi-*/out/ffi_generated.rs \
  | sort -u > /tmp/ffi-names.txt
cargo run -p flight-bindgen -- --target haxe --out <output-dir> \
  --offsets /tmp/offsets.json --ffi-names /tmp/ffi-names.txt
scripts/check-haxe-bindings.sh
```

The driver uses private temporary files and Cargo's current build-script output
path instead of shared `/tmp` names and stale glob matches. Output is copied
unchanged into `generated/externs/`, adding only `provenance.json` with the Flight
revision and patch hashes, toolchain/host identity, offsets and FFI-name hashes,
symbol count, generated native header hash, and per-file hashes. The C header is
copied to `native/include/flight_ffi.h`. Failed
generation leaves the previous tree intact. Check mode rejects missing, changed,
and extra files without replacing the copy.

## Validation and limits

`gate:surface` verifies the copied inventory and hashes against provenance and
the dependency lock, then type-checks every declaration on HL, cpp, and JS/ESM.
It uses the same target exclusions as `scripts/check-haxe-bindings.sh`.
`gate:package` validates the deterministic consumer archive, compiles its smoke
consumer on those targets, and checks static ESM emission. `gate:native-ffi`
executes selected real Rust C ABI functions through a C++ test probe.

Flight's own check script passes with the pinned Rust/Cargo 1.96.0 toolchain.
Cargo 1.100 uses `target/debug/build/flight-ffi/<hash>/out`, breaking the script's
older glob. The intake driver handles either layout using Cargo messages.
Provenance also records toolchain identity and host architecture; layout offsets
must match the binary used by consumers.

The producer patch also emits a C header and HashLink adapter source from the
same generated Rust FFI. `native:build` stages their binaries and ABI manifest;
`gate:native-runtime` installs the resulting haxelib ZIP and executes real hxcpp,
HashLink, and Lime consumers on Linux64. The patch includes binding fixes exposed
by these actual builds; no post-processing edits are applied to generated Haxe.
See [patch notes](../../patches/flight/README.md).

The second producer patch restores direct `@flighthq/*` ESM bindings using Flight
compiler naming and logical JS carriers. `gate:web` executes real math/geometry
from the pinned Flight TypeScript sources and verifies tree-shaking. See the
root README for tested platforms and the limits of native and web smoke checks.
