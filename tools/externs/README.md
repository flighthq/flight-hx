# Rust Flight extern intake

The Flight producer emits Rust-backed native bindings and TypeScript-backed ESM bindings. The source is the single
`develop` pin in `dependencies.lock.json`, currently `c52653a12e10251ab93970f71a6bc0c4dcbe21fa`.

## Generate and copy

Use a clean checkout, the pinned Rust toolchain, and the TypeScript compiler
installed by `npm ci`. The driver prepares an
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
cargo build -p flight-ffi --locked
cargo run -p flight-ffi --bin flight-offsets --locked > /tmp/offsets.json
cargo run -p flight-bindgen --locked -- --target haxe --out <output-dir> \
  --offsets /tmp/offsets.json --ffi-dir <current-flight-ffi-build-output>
scripts/check-haxe-bindings.sh
```

The driver uses private temporary files and Cargo's current build-script output
path and offsets executable instead of shared `/tmp` names and stale glob matches. Output is copied
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

Flight emits a C header and HashLink adapter from the same generated Rust
FFI. Bindgen compares native Haxe declarations against both with `--ffi-dir`.
`native:build` stages their binaries and ABI manifest. `gate:native-runtime`
installs the haxelib ZIP and exercises hxcpp, HashLink, and Lime consumers.
See [producer patch notes](../../patches/flight/README.md).

`gate:web` executes code from the pinned Flight TypeScript sources, including
the browser graphics and app host seams, and verifies tree-shaking. See the
root README for platform coverage.
