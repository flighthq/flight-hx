# U1 Item 3: Rule-Derived Typed-Struct Universe

Status: implemented for upstream `c61de179af8a12c2fa3b9b7d5389ee302f577a0d` without expanding direct or class emission.

## Discovery and rules

The generator now discovers every public owner `interface` and `type` declaration from the manifest-backed export inventory and TypeScript checker. Package exclusions remain derived from the port configuration. Manual tranche arrays are gone.

Discovery and policy are intentionally separate:

- declaration shape, member ownership, computed members, receiver-sensitive methods, presence-sensitive operations, structural-width conflicts, and dynamic escapes are checker-audited rules;
- class feasibility runs over every eligible discovered schema;
- containment and normalization provenance run over the complete eligible graph;
- only the migration lock controls direct emission during this campaign;
- new checker-discovered rows enter as audit-only and cannot affect direct field or constructor binding.

The registry therefore exposes two resolvers. The full resolver is used by the audit, class-feasibility, containment, and provenance passes. The locked direct resolver is used by lowering and C++ construction so discovery cannot silently change emitted behavior.

## Deterministic migration lock

[`tools/generator/baselines/typed-structs-v3.json`](../tools/generator/baselines/typed-structs-v3.json) is the compact source-controlled lock generated from the 405-row schema-version-3 report at upstream `5d24729f7360475e28a105ae0caeeaa2e1328260`. Its source report SHA-256 is `01780f464ad52d5b386fc4d707fbd00a7d1ccc1e1f15426fbc514c7c59f410a3`.

At `c61de179`, the deterministic diff is:

| Disposition                       | Count |
| --------------------------------- | ----: |
| Preserved                         |   231 |
| Checker-relocated                 |   146 |
| Reviewed renames                  |    23 |
| Reviewed declaration-kind changes |     2 |
| Reviewed replacement removals     |     3 |
| Newly discovered, audit-only      | 1,373 |
| Current checker-derived universe  | 1,775 |
| Locked direct candidates          |   402 |

The three replacement-vocabulary removals retain checked successor evidence without treating successors as direct migrations:

- `ImageResource` -> `Image`, `Bitmap`, and `CompressedImage`;
- `Tileset` -> `TilemapData` and `TiledTileset`;
- `VideoTexture` -> `Texture`, `Image`, and `VideoResource`.

Missing targets, missing successors, duplicate target claims, stale approvals, duplicate baseline identities, and any new non-audit-only row fail generation.

## Complete-universe census

The current rule-derived audit contains 1,344 eligible and 431 ineligible schemas. The 1,373 audit-only schemas account for 14,424 pending accesses. The 397 eligible direct schemas retain 10,448 direct accesses. Member and use rules record 10,567 dynamic escapes over 21,033 declared fields.

The full class-feasibility pass covers all 1,344 eligible schemas. The provenance pass evaluates 633 clean required-field candidates across 1,593 containment edges: 481 close and 152 remain blocked.

Both explicit C++ representation controls close against that full graph:

- `@flighthq/types:interface#Camera2D`: 17 direct accesses, no escapes, no containment parents or children, and no normalization provenance;
- `@flighthq/types:interface#ParticleEmitterState`: 236 direct accesses, no escapes, no containment parents or children, and no normalization provenance.

`ParticleEmitterData` remains direct typedef behavior and fails the nominal-closure proof because normalization provenance reaches it through `ParticleEmitter2D` and `ParticleEmitter3D`.

## Campaign lowering-audit policy

The all-package lowering audit is conditionally skipped only when the upstream checkout is exactly `c61de179af8a12c2fa3b9b7d5389ee302f577a0d`. Its test title records both known diagnostics rather than hiding them:

- the `scene3d-wgpu` `for...in` statement assigned to ordered Item 5;
- the excluded `tool-capture` array-rest binding retained until the Item 6 exclusion predicate changes its audited scope.

The predicate is commit-exact, so an upstream change cannot inherit the skip silently.
