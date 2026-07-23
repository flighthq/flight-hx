# Project Status

Last updated: 2026-07-22

## Current State

The initial full port was completed through Phase 9 for upstream revision `5d24729f7360475e28a105ae0caeeaa2e1328260`. A source-derived namespace realignment is now implemented in the generator but cannot complete regeneration against that pinned upstream revision until its 12 Haxe identity collisions are reorganized upstream.

All 28 packages under `upstream/examples/packages` now have matching Lime projects under `examples/`. Each port has a `project.xml` and `Main.hx`, uses the shared Lime host adapter, and replaces the upstream Vite/browser lifecycle with Lime callbacks. The adapter registers the standard 2D GL renderers and exposes a specialized render hook for the effects and 3D examples. Source/API coverage was checked locally, but the Lime projects remain compile-unverified because this workspace has neither the repository-local Haxe compiler nor a Lime/Haxelib installation.

The latest complete local `npm run ci` finished successfully on 2026-07-22. Its canonical parity portion ran from `2026-07-22T13:16:01Z` through `2026-07-22T13:29:25Z` and wrote the committed-format report at `reports/upstream-parity.json`.

## Stable Decisions

- Input: all 131 Flight packages under the read-only `upstream` submodule are inventoried; `tool-capture` (Node/Playwright dev tooling, not in the `@flighthq/sdk` barrel, no dependents) is explicitly excluded from translation with a recorded reason in `tools/generator/port.config.ts`.
- Output: generated Haxe implementations, never extern-only declarations or handwritten generated edits.
- API: unchanged globally searchable free-function names such as `createVector2` and `getVector2Length`.
- Namespace: generated APIs mechanically map to `flighthq.<lowerCamelPackage>.<PascalCaseFile>`; package barrels map to facades such as `flighthq.geometry.Geometry` and `flighthq.renderGl.RenderGl`.
- SDK: `flighthq.sdk.Sdk` is a generated facade over the actual upstream SDK export graph, including renamed cross-package re-exports.
- Types: canonical declarations live in their defining modules under `flighthq.types`; additional declarations use Haxe secondary-type imports such as `flighthq.types.Vector2.Vector2Like`.
- Distribution: Haxelib name `flight`, currently at pre-release version `0.0.0`.
- Sources: maintained Haxe lives under `src/`, generated Haxe under `generated/`, and Haxelib adds the latter through `extraParams.hxml`.
- Internals: maintained runtime types live under `flighthq._internal` and use underscore-prefixed names such as `_Runtime` and `_Promise`.
- Hosts: optional maintained adapters live in the main source tree; `flighthq.hostLime.LimeApp.createLimeAppBackend(application)` returns a Lime-specific App backend without owning or registering the application and is conditional on Lime's `lime` define.
- Tools: generator code, semantic patches, and operational scripts share the `tools/` hierarchy.
- Toolchain: npm-managed dependencies, repository-local Haxe 4.3.7, pinned Lix library specifications, and no required global Haxe installation.
- Exceptions: typed semantic patches with source identity and normalized AST fingerprints; generated text is never patched.

## Verified Accounting

- Inventory: 131 packages, 1,898 source files, 1,166 test files, and 12,149 public export records, with zero unresolved records.
- Lowering: 9,122 of 9,122 candidate declarations lowered, with zero diagnostics and no placeholder bodies.
- Patches: one applied semantic patch; zero stale, unmatched, or conflicting patches.
- Upstream parity: 131 of 131 package suites pass and all 1,166 upstream test files are routed through compiled Haxe JavaScript bridges.
- Generator tests: 24 passing, including deterministic output, patch drift, executable Haxe, facade export, and hxcpp high-arity regression coverage.
- Maintained TypeScript coverage: 77.03% statements, 70.79% branches, 86.69% functions, and 78.23% lines. This is intentionally distinct from complete upstream accounting.
- Portability: `CoreSmoke` compiles and runs on Eval, JavaScript, Python, and C++/hxcpp. Eval and the full JavaScript build also compile the complete generated `flight` namespace.
- Packaging: `build/package/flight-0.0.0.zip` installs into an isolated Haxelib repository and a clean JavaScript consumer passes using `import flight.Sdk.*`.

## Host Prerequisites

- Node.js 22, npm, Git, `curl`, and `tar` support the repository setup on Linux x64.
- Python 3 is required by `test:portable:python`.
- `g++` or `clang++` is required by `test:portable:cpp`.
- Neko is required to run the Haxe-distributed `haxelib` executable during package-install validation.
- The checked-in setup fallback currently installs Haxe itself only on Linux x64. Other hosts must provide an equivalent Haxe 4.3.7 installation path or extend `tools/setup-haxe.mjs` deliberately.

## Command Surface

- `npm run setup` installs the checksum-pinned local compiler, downloads the exact libraries described by `haxe_libraries/*.hxml`, and builds the hxcpp command runner when needed.
- `npm run generate` and `npm run generate:check` own all generated source, bridges, and reports.
- `npm run check` covers generation drift, TypeScript typechecking, lint, formatting, and API accounting.
- `npm run test` covers maintained unit tests, full Eval compilation, the four-target portability matrix, and all upstream package suites.
- `npm run package` assembles, installs, and consumes the Haxelib zip.
- `npm run ci` is the complete hosted and local gate.

## Remaining Release Decisions

The implementation has no known correctness blocker. Before a public non-zero release, choose the release/versioning policy, Haxelib publication credentials, and generated API-documentation presentation. Those are release-management decisions rather than gaps in the port.

## API Realignment In Progress

- The generator now builds source-derived modules, nested output paths, package/SDK facades, canonical imports, hidden implementation modules for `internal.ts` and test helpers, and nested JavaScript bridge paths. Raw generated Haxe indentation is canonical and covered by focused emitter tests.
- Generation now reports all Haxe package-level identity collisions together. The pinned upstream revision currently has 12 collisions requiring source reorganization: eight `host-electron` interface/module pairs, two `host-tauri` pairs, `scene-gl`'s `GlMeshUpload`, and `scene-wgpu`'s `WgpuMeshUpload`.
- Do not add Haxe-only renames for these collisions. Refactor the defining TypeScript files upstream, update the submodule revision, regenerate, and then complete the Haxe/parity/portability verification matrix.

For an upstream update, run setup, regenerate, review manifest and patch drift, then run `npm run ci`. Update this file whenever the upstream revision, support matrix, release policy, or verified counts change.
