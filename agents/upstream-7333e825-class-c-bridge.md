# Upstream `7333e825` Class C Bridge Campaign

Status: implemented and verified as the single callable/export bridge campaign authorized after the U7 census. This parcel does not change runtime value objects, callback/rest ABI behavior, data semantics, browser/async seams, constructor properties, tooling exclusions, or upstream source.

## Root cause and canonical repair

Generated Haxe calls the canonical defining module for an imported callable. Source bridges previously synchronized adjacent Vitest mocks only for root package specifiers matching `@flighthq/<package>`. Current tests mock exact public lanes such as `@flighthq/render-gl/contract`; those imports were excluded, so the compiled owner retained the real function and the mock recorded zero calls. The same loss occurred when a compiled source reached a mocked package through an unmocked relative module.

Source-bridge emission now applies one rule:

1. Resolve every runtime `@flighthq/<package>[/<lane>]` import through the manifest-derived exact export lane.
2. Match the lane export record's source and fingerprint to its canonical generated declaration and synchronize that declaration from the Vitest mock namespace.
3. Traverse unmocked relative imports/re-exports for package mocks used below the adjacent source. Stop at locally mocked modules so compiled code does not bypass those doubles.
4. Read the factory's returned object and synchronize only the exports actually supplied by a partial mock. An object spread means all exports. Unsupported factory shapes, computed export names, missing lane exports, unresolved owners, and default/namespace mock imports fail generation rather than guessing.

The same source-bridge pass retains runtime re-exports from exact contract lanes. This restores the `RenderCacheKind` source re-export and locks existing callable contract, backend-registration, and test-helper bridges without creating a second facade mechanism.

## Emission boundary and hashes

There are no maintained or generated Haxe changes. The compiled Haxe JavaScript bundle was therefore expected to remain byte-identical, while the generated ESM bridge tree was expected to be non-identical because it now contains mock-routing imports and assignments.

| Artifact | Baseline SHA-256 | Candidate SHA-256 | Result |
| --- | --- | --- | --- |
| `build/haxe-js/flight.cjs` | `8765ac801ff5a97414c07d3d25b2fe14961c9c916ea80ce766426f8448a30104` | `8765ac801ff5a97414c07d3d25b2fe14961c9c916ea80ce766426f8448a30104` | Expected identity |
| Aggregate sorted `tests/bridges` file hashes | `0e967d3c4e508361fa0fa6a620c2378bdb347206c8ec318c833e447106a957b2` | `ef11f276f90c0e2dd07a838b453c3f9b976ee4a46978fb38c3188947eb7048a2` | Expected non-identity |

Exactly 25 source bridges change: one `application-gl`, five `effects-gl`, four `effects-wgpu`, one `render`, three `scene2d-gl`, three `scene2d-wgpu`, and eight `scene3d-resources`. They add 77 distinct package-export synchronizations and remove none.

## Focused sub-gates

| Class C seam | Evidence on `7333e825d9df46d737c5a6557acbed4805e19e57` |
| --- | --- |
| Production callable/contract export | The generator locks `@flighthq/entity/contract.createEntity` and the source-level `RenderCacheKind` re-export. `lighting/environment.test.ts` passes 3/3. |
| Backend registration | The generator locks `dialog.setDialogBackend`; `dialog.test.ts` passes 37/37. The current canonical report also has `textlayout` at 151/151 and `textshaper-canvas` at 17/17. |
| Test-only helper | The generator locks both `render-wgpu/contract` and its source bridge for `installWgpuMock`; `wgpuDraw.test.ts` passes 31/31. |
| Direct contract mock interception | `application-gl/glApplicationRenderView.test.ts` passes 3/3. Five GL effect mock files pass 28/28, and four WGPU effect mock files pass 26/26. |
| Transitive and partial mock interception | `scene3d-resources/gltfLoad.test.ts` passes 4/4 through the transitive `net/contract` import. `scene2d-gl/glCache.test.ts` passes 14/14. Generator coverage proves that omitted `getGlRenderStateRuntime` is not eagerly synchronized from the partial GL mock and that an unmocked contract import gains no dependency bridge. |

The complete generator suite passes 109/109 across ten files. `npm run check` passes, including deterministic regeneration, typechecking, lint, formatting, and API drift checks. `npm run build:haxe:js` passes and produces the identity hash above.

## Mixed-suite rerun and reclassification

The current canonical report was rerun where Class C was primary or materially masked later failures:

| Package | Before this campaign | After bridge repair | Next frontier |
| --- | --- | --- | --- |
| `application-gl` | 3 failed | 3 passed | None in the package. |
| `effects-wgpu` | 14 failed, 76 passed | 239 passed | None in the package. |
| `effects-gl` | 10 failed, 2 passed before early failure | 16 failed, 250 passed | All nine contract-mock files are green. The remaining 16 failures are confined to two registry/application suites and dereference an undefined callable receiver with `.apply`; they are not export-lane or mock-routing losses. |
| `scene3d-resources` | 12 failed, 8 passed before early failure | 5 failed, 94 passed | The mocked loaders are green. The remainder is two async timeouts, one streaming timeout, and two Promise results returning `null` instead of `undefined`, outside Class C. |

The retained focused reports record the complete `effects-gl` and `effects-wgpu` package reruns. No later-class fix is included here.
