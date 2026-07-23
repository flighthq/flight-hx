# Quality and Command Surface

The root npm scripts are the single development interface for TypeScript, Haxe, generation, portability checks, and upstream behavioral tests. Use npm only.

This command surface is implemented and is the evidence-bearing interface used locally and in GitHub Actions.

## Script Naming

Borrow upstream's `action:subject:modifier` convention:

- action first: `build`, `test`, `generate`, `format`, `lint`;
- subject second: `generator`, `haxe`, `upstream`, `portable`;
- modifier last: `check`, `fix`, `coverage`, `baseline`, or a target name;
- an omitted subject or modifier creates an umbrella alias over leaf commands;
- a `:baseline` suffix is reserved for a command that writes a committed baseline.

Aliases chain leaf scripts; they do not duplicate command implementations.

## Root Scripts

| Script           | Responsibility                                                    |
| ---------------- | ----------------------------------------------------------------- |
| `setup`          | Install local Haxe, download pinned libraries, and prepare hxcpp. |
| `generate`       | Analyze upstream, apply patches, emit Haxe and reports.           |
| `generate:check` | Regenerate in check mode and fail on drift or nondeterminism.     |
| `api`            | Emit the public TypeScript-to-Haxe API map.                       |
| `api:check`      | Fail on export omissions, duplicate names, or stale API output.   |
| `api:json`       | Print or write the machine-readable API map.                      |
| `build`          | Build maintained TypeScript tooling.                              |
| `build:check`    | Validate build graphs and compile without retained output.        |
| `typecheck`      | Type-check maintained TypeScript with no emit.                    |
| `lint`           | Run Oxlint with zero warnings over maintained TypeScript.         |
| `lint:fix`       | Apply safe lint fixes.                                            |
| `format`         | Format maintained non-generated files.                            |
| `format:check`   | Verify formatting without writes.                                 |
| `fix`            | Run ordering, lint fixes, and formatting in deterministic order.  |
| `test`           | Run the complete normal test umbrella.                            |
| `test:generator` | Run analyzer, lowering, patch, and emitter unit tests.            |
| `test:haxe:core` | Run the focused Haxe API/runtime smoke test under Eval.           |
| `test:haxe:all`  | Compile the complete generated namespace and run the Eval smoke.  |
| `test:upstream`  | Run upstream Vitest through generated Haxe JS bridges.            |
| `test:portable`  | Run the supported cross-target compile/smoke matrix.              |
| `test:coverage`  | Run maintained-code coverage reporting.                           |
| `check`          | Run static, formatting, API, patch, and generated-drift gates.    |
| `ci`             | Run build, check, all tests, and packaging verification.          |
| `clean`          | Remove only known transient build outputs.                        |
| `package`        | Assemble and validate the `flight` Haxelib artifact.              |

The portability leaves are `test:portable:eval`, `test:portable:js`, `test:portable:python`, and `test:portable:cpp`. The required matrix and host prerequisites are tracked in [`status.md`](status.md).

## Formatting and Linting

Borrow upstream's pinned Oxc tooling for maintained TypeScript and configuration:

- Oxlint runs with zero warnings.
- Oxfmt handles supported maintained files.
- The Haxe emitter owns generated Haxe formatting; output must already be canonical and stable.
- Handwritten Haxe fragments and runtime sources follow the surrounding canonical style and are compiler-tested. No Haxe-aware formatter is currently added to the toolchain.

Do not run a generic formatter over generated Haxe after emission. If generated formatting is wrong, fix the emitter so idempotence remains meaningful.

`npm run fix` is the write command. `npm run check` uses read-only equivalents.

## Check Composition

The focused gate is equivalent to:

```text
generate:check
typecheck
lint
format:check
api:check
patch audit (inside generate:check)
```

`npm run check` should remain fast enough for normal completed changes. Behavioral tests belong in `npm run test`; the full `npm run ci` runs build, check, test, and package validation.

## Test Layers

### Generator tests

Use small fixture inputs and inspect the normalized model or emitted Haxe. Each lowering rule needs ordinary, boundary, unsupported, and ambiguity coverage where applicable. Snapshot tests may supplement semantic assertions but should not be the only evidence.

### Haxe API and runtime tests

Compile consumer-style fixtures against `flighthq.sdk.Sdk`, package and defining-file modules, and explicit canonical imports from `flighthq.types`. Verify public names, sentinels, numeric behavior, typed arrays, collections, async behavior, and platform seams.

### Upstream behavioral tests

Compile generated Haxe to JavaScript, build ESM bridges matching `@flighthq/*`, and run the upstream Vitest suites. Prefer the narrowest package or test file while iterating, then broaden. Do not fork upstream tests merely to make them pass.

### Portability tests

Behavior that can be checked without a browser should be exercised on multiple targets. JavaScript receives the deepest behavioral coverage through Vitest; other targets provide compile and representative runtime coverage. Platform-only packages are classified separately from portable packages.

## Checkpoints

- After analyzer or lowering changes: run the focused generator test and `generate:check`.
- After patch changes: run the target fixture, patch audit, and `generate:check`.
- After public API changes: run `api:check`, consumer compile fixtures, and the affected upstream package tests.
- After maintained-runtime changes: run Haxe runtime tests and all supported targets touched by that runtime primitive.
- After bridge changes: run a focused upstream Vitest file, then `test:upstream`.
- Before completing a broad phase: run `npm run ci` and record the result in `agents/status.md`.

## Coverage and Honesty

Coverage reports classify every upstream package, source file, export, and test. Counts must distinguish translated, patched, explicitly excluded, blocked, and untested. A high percentage must never hide silent omissions.

The standard is meaningful behavior coverage, not line-count theater. For an `out`-parameter function, test a distinct output and an aliased output. For a sentinel-returning function, test success and expected failure. For a portability primitive, test more than the JavaScript target.

The maintained TypeScript coverage baseline measured on 2026-07-22 is 77.03% statements, 70.79% branches, 86.69% functions, and 78.23% lines. This is reported separately from the 100% upstream export, lowering, test-file, and package-suite accounting; the two measures must not be conflated.
