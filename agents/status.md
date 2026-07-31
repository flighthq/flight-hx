# Project Status

Last updated: 2026-07-31

## Current State

Typed receiver lowering now uses one cached TypeScript `Program` for the pinned upstream tree. This preserves imported, aliased, and contextual receiver types during generation.

- Checker-proven primitive lowering emits non-null Boolean truthiness, Boolean conditional/logical expressions, and numeric relations directly. The generated tree removes 7,882 `_Runtime.truthy`, 1,689 `_Runtime.select`, 1,223 `_Runtime.andValue`, 1,364 `_Runtime.orValue`, and 4,021 `_Runtime.compare` calls; nullable/mixed truthiness and nonnumeric comparisons remain dynamic and are covered by negative tests.
- Checker-proven indexed access now uses typed inline endpoints for `Array`, all nine supported typed-array families, and the storage-compatible part of the exact mixed-union pool. Exact final-output accounting records 4,658 direct reads and 2,930 direct writes; 646 `_Runtime.getIndex` and 126 `_Runtime.setIndex` calls remain for width-sensitive mixed writes, optional access, destructuring, and otherwise dynamic access. JavaScript keeps raw fractional keys, portable targets retain `Std.int` keys, setters return the original right-hand value, and compound updates evaluate receiver/key once before the right-hand side.
- Emitter-known synthetic Array lowering adds exactly 79 for-of iteration-binding reads and 27 packed high-arity-argument reads. Both classes use `_StaticIndex.readArray` and have separate deterministic report counters. Of the 59 exact mixed typed-array-union sites, all 19 `Array | Float32Array` operations and the 27 `Uint16Array | Uint32Array` reads now use shared endpoints. The 13 width-sensitive unsigned writes are explicitly audited and remain dynamic because the portable fallback cannot distinguish 16-bit from 32-bit write coercion. Eight wider tuple/Array/Float32Array union writes were outside that pool and remain parked, as do dictionary and presence-sensitive schemas.
- Destructuring source receivers are retained and audited without changing Haxe emission. Of 252 final-output dynamic reads, 240 have a proven `Array` receiver: 20 assignment, 209 declaration, and 11 parameter reads. The remaining 12 declaration reads are four specialized `RegExpExecArray`/`RegExpMatchArray` destructures and remain explicitly parked. Schema-v7 reports preserve the source-shape, receiver, and parked-reason split; the generated-tree SHA-256 remains `55e27a2468b1090c8f893719c632ebfedf3c624b1cdc25e7b17be1105c1e17c2`.
- Review's Step 2 `camera2d` Neko script benchmark improved from about 15.2 ms to 8.8 ms per frame (42% lower script cost, roughly 75% higher throughput). Step 3 found camera2d flat and particles 21% faster by median (35.0 to 42.9 fps, five runs per side with non-overlapping samples), confirming the indexed lever is positive.
- Every resolved `CanvasRenderingContext2D` call crosses `Canvas2dBackend` and is checked against a closed generation-time method/field inventory. Contextually typed shape-command callbacks no longer escape to `_Runtime.callProperty`. The maintained browser and native Cairo implementations cover the current upstream surface, including curves, arcs, ellipse/round-rectangle paths, and stroke cap/join/miter state.
- Resolved `Map`, `Set`, `WeakMap`, and `WeakSet` operations emit direct calls through `_Map`, `_Set`, `_WeakMap`, and `_WeakSet`; 1,174 generated receiver sites use this path. JavaScript-sensitive methods remain non-inline so Haxe dispatches to native collection members, and `delete` is mapped at compile time instead of by `_Runtime`.
- The typed-struct design is approved through phases 1–2. The generator now analyzes a fixed seven-schema candidate list, emits deterministic `reports/typed-structs.json`/`.md`, and attaches canonical schema/field bindings to safe property expressions in the IR. Direct struct expression emission is not enabled.
- Six candidates are eligible and account for 2,057 currently reflective reads/writes: `Vector2`, `Vector3`, `Quaternion`, `Matrix3`, `Matrix4`, and the render-hot RGBA `ColorTransform`. `Rectangle` is not eligible: `interaction/src/hitTests.ts` uses its `HitArea` union in two presence-sensitive `in` discriminations. Every entity candidate also records the inherited `[EntityRuntimeKey]` as a member-level computed-symbol escape.
- Typed-struct negative tests cover unknown and readonly named fields, computed access, incompatible unions, presence sensitivity, receiver-sensitive methods, aliases, `Readonly<T>`, and the distinction between optional fields and required `T | undefined`. Tranche-3 emission remains gated on review of the audit report diff.
- `npm run check`, 78 focused generator tests, full Eval namespace compilation, all 278 upstream math tests, all 996 upstream geometry tests, and the indexed endpoint smoke on Eval/JavaScript/Python pass. C++ portability remains unavailable because this host has no C++ compiler.
- The complete current 131-package parity runner reports 88 package suites passing and 43 exposing existing gaps. Indexed-heavy suites including `camera`, `geometry`, `mesh`, `particles`, `particleemitter`, `scene`, `scene-wgpu`, `spritesheet`, `texture`, and `tween` pass. Failures remain concentrated in missing runtime value objects (`BlendMode`, `PathCommand`, `ImageChannel`, and related enums), existing signal/rest forwarding, async/backend seams, and the excluded Playwright tool package; none of the inspected failures point to indexed storage semantics.

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
- Upstream parity: all 1,166 upstream test files are routed through compiled Haxe JavaScript bridges; the current full run has 88 passing package suites and 43 suites with the known gaps summarized above.
- Focused generator tests: 78 passing across eight files when the stale module-identity fixture is excluded, including deterministic output, patch drift, executable Haxe, typed receivers, indexed-lowering coverage, and emission-neutral destructuring receiver audits.
- Maintained TypeScript coverage: 77.03% statements, 70.79% branches, 86.69% functions, and 78.23% lines. This is intentionally distinct from complete upstream accounting.
- Portability: `StaticIndexSmoke` compiles and runs on Eval, JavaScript, and Python; `CoreSmoke` passes while compiling the complete generated namespace on Eval. C++/hxcpp was not rerun in this workspace.
- Non-HTML5 audit: the complete namespace type-checks and runs its smoke test on Eval and Python. The reflection-free WebGL2 target binding and remaining native Lime renderer gaps are recorded in [`non-html5.md`](non-html5.md). C++ was not rerun in the current workspace because no C++ compiler is installed.
- Native typed arrays: maintained Float32/Int16/UInt16/UInt8 wrappers use `#if js` browser storage, `#elseif lime` Lime-native storage, and the existing generic array fallback. The generator routes their constructors to those wrappers, runtime helpers preserve their semantics, and native GL dispatch unwraps uploads to the Lime view with the concrete argument types and boolean conversions required by Lime's native `WebGL2RenderContext`. The bitmap example compiles to Neko against pinned Lime 8.4.0; execution reaches Lime's native loader but cannot open a window in this workspace because the Git-pinned Lime source has no prebuilt `lime.ndll` and no C++ compiler is available to rebuild it. The focused fake-Lime smoke, full Eval namespace compile, JS/Python portability smokes, generator drift check, and repository `npm run check` pass.
- Desktop shaders: Lime's desktop compatibility context is OpenGL rather than OpenGL ES, so the native backend converts final WebGL2 `#version 300 es` shader sources to GLSL `#version 330 core` and removes ES precision syntax. This addresses the platformer Neko failure at the initial bitmap shader; browser and OpenGL ES source is unchanged. A packaged Lime 8.3.2 `lime.ndll` was validated through startup, but live rendering remains unavailable on this host because SDL has no video device.
- Focused GL parity audit: `render-gl` currently has 242 passing and 23 failing tests on the checked-out upstream revision. Every failure is an undefined runtime `BlendMode` or `AdvancedBlendMode` object in the JavaScript bridge; the Haxe port currently emits only their string typedefs and internal value tables. This is separate from the typed-array change and is the next GL parity issue to fix before treating the focused renderer suite as green.
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
