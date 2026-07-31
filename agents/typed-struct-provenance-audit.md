# Typed-Struct Provenance and Containment Audit

## Decision

The clean required-field set is not provenance closed as a bulk class-emission gate. Of 199 direct-census candidates, 137 are conservatively closed and 62 have at least one newly visible blocker. This analysis authorizes no class emission.

The generated sources of truth are [`reports/typed-struct-provenance.json`](../reports/typed-struct-provenance.json) and [`reports/typed-struct-provenance.md`](../reports/typed-struct-provenance.md). The JSON report contains canonical identities, exact source sites, containment paths, root reasons, and bridge paths. This document records the interpretation and policy.

## Candidate set

The audit derives its target set from the generated class-feasibility census instead of maintaining another allowlist. A candidate must satisfy all four conditions:

- zero optional fields;
- zero required fields whose type includes `undefined`;
- zero direct normalization reasons; and
- zero direct observability reasons.

That predicate currently selects exactly 199 of the 404 eligible typed-struct schemas.

## Closure model

The audit adds four views that the direct census does not provide:

1. It builds a field-containment graph across all 404 eligible schemas. Arrays, tuples, generic arguments, unions, aliases, and inline anonymous records are traversed, and every edge retains its declaring field path.
2. It propagates all direct normalization roots through containment. This is intentionally conservative: a structural or dynamic outer value is assumed capable of carrying structurally materialized children unless a later ingress-specific proof demonstrates otherwise.
3. It records `JSON.parse` roots explicitly. A parsed `GltfDocument`, for example, propagates to required descendants such as `GltfAccessorSparse` through `accessors[]` and `sparse`.
4. It compares target and source identities inside containers and generic return types. Plain object and array literals remain canonical constructions. Callback-produced arrays, promise-like results, dynamic generic values, and other missed structural transfers are reported at the outer expression.

Bridge input and output roots are propagated through the same containment graph, but bridge exposure is not itself a closure blocker. The accepted Camera2D pilot already demonstrated that a bridge signature can be compatible with nominal cpp representation; it remains a separate integration surface to test.

## Current partition

| Partition                       | Schemas |
| ------------------------------- | ------: |
| Clean required-field candidates |     199 |
| Conservatively closed           |     137 |
| Blocked                         |      62 |
| Normalization provenance only   |      36 |
| Container transfer only         |      22 |
| Both blocker classes            |       4 |

The graph contains 418 containment edges and 82 direct normalization roots. Forty candidates are reachable from a normalization root. Twenty-six have a missed container or generic transfer; four occur in both groups. Nine canonical schemas are explicit `JSON.parse` roots. Bridge propagation reaches 131 candidates through input signatures and 147 through output signatures.

Container findings partition into 16 candidates with anonymous callback/generic construction and 10 with dynamic generic ingress. No cross-schema container transfer currently survives after exact canonical identity matching.

## Representative findings

- `BitmapFontKerningData` is constructed by `record.kernings.map(...)` at `upstream/packages/bitmapfont-formats/src/bitmapFontRecord.ts:114`. Its outer result is structurally inferred and assigned to `BitmapFontKerningData[]`; the direct schema transfer audit never sees the callback result as that canonical identity.
- `GltfAccessorSparse` has no direct normalization finding, but `GltfDocument` is a dynamic and explicit JSON root. The report carries the exact path `GltfDocument -> accessors[]:GltfAccessor -> sparse:GltfAccessorSparse`.
- `Camera2D` and `ParticleEmitterState` remain closed controls.
- `ParticleEmitterData` has no missed container construction after plain contextual object literals are recognized, but is conservatively reachable from normalization findings on its containing `ParticleEmitter`. Those findings are outer downcasts in renderer and generic display-object code, so a later ingress-sensitive proof may discharge this blocker; the audit does not silently assume that proof.

## Gate policy

Before a Gate-5 class entry is proposed, its row must be closed in the generated report or carry a reviewed, source-specific proof that narrows a conservative root. Container findings require canonical construction or normalization at the reported site. JSON document descendants require an explicit recursive materialization boundary. Bridge exposure continues to require target compilation and behavioral tests but does not fail closure by count alone.

Changing this policy, the root classification, or the clean-set predicate requires a report schema/version change and focused positive and negative tests. Adding a class allowlist entry is a separate reviewed diff.
