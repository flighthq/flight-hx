# flight-hx

Haxe externs for [Flight](https://github.com/flighthq/flight). The source of truth
is the Rust workspace in Flight, pinned by `dependencies.lock.json`. Flight's
`flight-compiler`, `flight-ffi`, and `flight-bindgen` crates replace the separate
TypeScript compiler repository and flight-cpp. Do not restore the transpiled Haxe
implementation backend or local C++ SDK adapters.

## Ownership

- `generated/externs/` is copied **unchanged** from `flight-bindgen --target haxe`.
  The only downstream addition is `provenance.json`. Fix emission upstream, not
  by editing generated Haxe or introducing a local parser/lowering pass.
- `tools/externs/generate.mjs` orchestrates the supplied Cargo recipe, stages
  output, records provenance, and detects drift. It uses Cargo build-script
  messages to locate the current FFI source, rather than globbing stale builds.
- Intake, surface and ZIP checks reject case-insensitive path collisions.
  Producer facades sharing a name with an SDK type use its exact case and one
  combined module. Preserve this for Windows/default macOS filesystem support.
- `patches/flight/` carries reviewable changes to the Rust producer. Apply only
  through `tools/flight-source.mjs`; keep the pinned input checkout clean. Exact
  patch/diff fingerprints identify the prepared source and generated provenance.
- `lib/flight_hx/Package.hx` adds the generated root and configures native linking
  or the JS ESM generator. Unsupported targets and `flight_hx` fail loud.
- `include.xml`, `project/Build.xml`, and `lib/flight_hx/Native*.hx` integrate Lime
  and ordinary hxcpp/HL consumers. Native C ABI libraries live in native/bin or
  native/lib; ndll is only for the HL adapter. Do not add a CFFI/Neko bridge.
- `tools/native/` builds/stages binaries and validates source identity/checksums.
  Never commit binaries or artifact manifests; package the ignored staged files.
- `tools/esm/EsmGenerator.hx` turns upstream `@:jsRequire` metadata into static
  ESM imports. The prepared Flight producer generates `flight.esm` from the
  pinned TypeScript SDK's public package entries. `buildWeb.mjs`/`bundle.mjs` restore bundling against real pinned
  `@flighthq/*` TypeScript sources. JS signatures use logical objects/arrays/
  callbacks/options; keep C ABI lowering out of that target.
- `tools/package-haxelib.mjs` makes a deterministic consumer archive from an
  explicit allowlist. No old fallback or flight-cpp sources enter the package.
- `tests/migration/` validates the consumer archive, generated type surface, ESM
  codegen, and a focused native C ABI probe. Keep these evidence levels distinct.

## Source and toolchains

Flight is pinned to `develop` revision `c52653a12e10251ab93970f71a6bc0c4dcbe21fa`.
`npm run rehydrate` materializes only Flight into ignored `.dependencies/flight`.
Consumers use checked-in externs and need no Cargo or Node generation dependency.

Use project Haxe 4.3.7 via `tools/haxe.mjs`. Rust 1.96.0 is pinned by `rust-toolchain.toml` and used for the current
copy. The intake driver recognizes repository-local Rust in
`.artifacts/rust/{cargo,rustup}` as well as an ordinary toolchain on PATH. Cargo
runs offline by default; append `--allow-network` for explicitly allowed downloads.
Do not install system dependencies without the user's go-ahead.

## Verification

Commit first, then run `npm run check`. It checks the dependency pin, the intake
orchestration tests, regeneration drift, all copied HL/cpp/JS declarations, the
extracted consumer archive, static ESM emission, producer regression tests,
artifact validation, C ABI calls, and installed-ZIP hxcpp/HashLink/Lime runtime
checks on the current x64 desktop, plus real math/geometry ESM execution and DCE.
It stages dev binaries. Set up native test dependencies with
`npm run setup:native-tests` first. `npm run native:build` stages release binaries;
`npm run package:haxelib` packages staged platforms into the consumer ZIP.

The upstream command is `npm run check:externs:upstream`; the supplied script
checks HL/cpp/JS with Rust 1.96.0. Both the upstream script and the local intake
read the active build's Cargo messages to locate generated artifacts. Provenance records toolchain
identity and host architecture as well as offsets, because native layouts must
match the binary they describe.

## Runtime scope

Flight generates the C header, HL shim, and Haxe declarations. The local patch
stack preserves downstream ownership and runtime behavior, and connects selected
new native APIs to Haxe. Linux64 smoke execution and full HL
declaration loading do not certify every API or other platforms. macOS, Windows,
ARM and iOS configuration requires validation on the relevant hosts/SDKs.
The Rust producer binds JS directly to `@flighthq/*` using compiler
naming. Real math/geometry execution and tree-shaking pass; this does not certify
every SDK API or browser rendering. Never replace SDK execution with fixtures.
CI runs installed-package cpp/HL/Lime on Linux, Intel macOS and Windows; Apple SDK
jobs build/link iOS static archives without claiming execution. Desktop jobs
regenerate their own native layouts before packaging. CI configuration is not
evidence of a successful remote run; report actual local and CI results separately.

Commit messages must be a single Conventional Commits line, with no body or
Co-Authored-By trailer.
