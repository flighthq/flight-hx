# U1 Item 7: Regeneration and Validation

Status: regenerated and validated for upstream `c61de179af8a12c2fa3b9b7d5389ee302f577a0d`. No example source or baseline was changed.

## Deterministic regeneration

Two completed `npm run generate` passes produced the same SHA-256 over every file under `generated/`, `reports/`, and `tests/bridges/`:

`ee2a29513b28aeae601fe7131f1a00c90404382aeab76e4edf2b4e13f8047629`

`npm run generate:check` then verified 139 packages, 291 public lanes, 30,378 export records, and 1,266 tests. The full generated surface contains 2,362 Haxe modules. The hash includes the time-stamped parity report produced by the full test run; generation left that report unchanged across both proof passes.

The inventory contains 139 packages, one derived exclusion, 11,740 root exports, and 2,338 source files. Lowering covers 138 translated packages, 2,313 source files, and 10,972 declarations with zero diagnostics. Static emission records 6,113 direct indexed reads, 3,216 direct indexed writes, 262 direct destructuring reads, 12 parked regexp-result destructuring reads, 106 synthetic iteration reads, and 27 high-arity synthetic reads.

## Runtime-helper census

The generated-tree `_Runtime` helper census is exhaustive; no helper occurrence falls outside these families.

| Family                     | Previous | Regenerated |   Delta |
| -------------------------- | -------: | ----------: | ------: |
| Sentinels/nullish          |   12,639 |      15,098 |  +2,459 |
| Property access            |   19,040 |      26,465 |  +7,425 |
| Indexed access             |      590 |         771 |    +181 |
| Invocation/construction    |   14,594 |      18,789 |  +4,195 |
| Control/equality           |    9,088 |      11,748 |  +2,660 |
| Globals/types/errors       |    1,465 |       1,952 |    +487 |
| Collections/objects        |    1,682 |       2,235 |    +553 |
| Numeric/string/regexp/JSON |    2,131 |       2,643 |    +512 |
| Scheduling                 |       32 |          33 |      +1 |
| Total                      |   61,261 |      79,734 | +18,473 |

## Typed-struct migration lock

The previous baseline had 405 candidates, all in direct mode. The regenerated report has 1,775 candidates: 402 remain in direct mode and all 1,373 new candidates are audit-only. The migration-lock diff therefore has zero non-audit-only additions. The baseline identities resolve as 231 preserved, 146 relocated, 23 renamed, two kind changes, and three reviewed removals.

The new report records 1,344 eligible schemas, 397 direct schemas, 10,448 direct accesses, 24,872 bindable accesses, 14,424 pending accesses, 10,567 escapes, and 393 reflective survivors. The class feasibility census contains 1,344 schemas: 992 mechanically compatible and 352 requiring normalization.

The provenance graph contains 632 candidate schemas, 1,593 containment edges, 481 closed schemas, and 151 blocked schemas. Both retained cpp class pilots remain provenance-closed: `Camera2D` has 17 direct accesses and `ParticleEmitterState` has 236. Neither class was silently widened or reverted.

## Compile seams repaired

The expanded source universe exercised several general lowering/runtime paths that the previous generated tree did not compile:

- portable `Boolean` callbacks and guarded `VideoFrame` global reads;
- locally bound constructor values, typed-array static `from`, asserted indexed assignment targets, contextual `Array.from` initializers, and bitwise property assignments;
- `Object.defineProperties`, `Object.isFrozen`, `TextDecoder`, and the WebGL `GLenum` extern;
- maintained Haxe smoke/facade references for the camera, scene2d, and scene3d package reorganizations.

Focused generator coverage locks each lowering behavior. The maintained portable `TextDecoder` path is exercised by `CoreSmoke`.

## Validation result

- Generator suite: 9 files and 99 tests passed.
- Full Haxe interpreter suite: passed with the complete generated package included.
- Focused Haxe core suite: passed.
- Haxe JavaScript build: passed.
- Full upstream parity run: all 139 package suites executed with 12 isolated jobs; 74 package suites passed and 65 failed, with none omitted. Parsed Vitest summaries contain 11,576 passed tests, 1,748 failed tests, and 213 skipped tests. One failed package process reported `no tests`, and `tool-capture` exited nonzero after 63 passing tests because it is intentionally excluded from the generated bridge.

The prior committed report covered 131 package suites at 88 passed and 43 failed. Upstream package reorganization removed 14 old package names and introduced 22 new names, for a net increase of eight suites; the Item 7 run records that churn without treating old parity counts as a gate or modifying upstream tests. Exact per-package statuses and failure output are in `reports/upstream-parity.json`.
