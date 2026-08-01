# Upstream `c61de179` U0 Breakage Census

Status: analysis-only U0 for the update from `5d24729f7360475e28a105ae0caeeaa2e1328260` to `c61de179af8a12c2fa3b9b7d5389ee302f577a0d`. The submodule is pinned to the requested revision. No generator, runtime, generated output, class, or direct-struct behavior is changed in this phase.

The census was made from campaign parent `65191ee0` plus both review-carried commits: `b2e1daa8` (the hxcpp `bufferSubData` upload workaround) and `7021578f` (the particles GC probe). All three are ancestors of this U0 work; no integration reconciliation is required for those changes.

## Raw generation result

`npm run generate` fails loudly before writing output:

```text
Typed-struct candidate source is missing from the TypeScript program: upstream/packages/types/src/ColorTransform.ts
```

This is only the first stale path. The independent censuses below bypass no production guard and make no maintained-source fix; they inspect the new program with the existing rules so the complete latent work is visible.

## Inventory delta

| Measure                | `5d24729f` | `c61de179` |  Delta |
| ---------------------- | ---------: | ---------: | -----: |
| Packages               |        131 |        139 |     +8 |
| Source files           |      1,898 |      2,338 |   +440 |
| Public export records  |     12,149 |     11,740 |   -409 |
| Test files             |      1,166 |      1,266 |   +100 |
| Candidate declarations |      9,122 |     11,188 | +2,066 |

The lower public-export total is not a loss of implementation surface. Upstream now exposes a cultivated `.` lane and a full `./contract` lane, while the current inventory understands only `index.ts`. There are 139 `contract.ts` barrels and 2,634 production imports of 80 distinct `@flighthq/*/contract` targets across 1,172 source files.

## A. Moved and renamed canonical identities

The typed-struct registry contains 405 path-keyed candidates:

- 233 still resolve at the exact old path and name;
- 172 are stale;
- 146 stale rows have one unambiguous same-name declaration, all moved to `@flighthq/types`;
- 26 have no same-name declaration in the new program and require deletion/rename review;
- zero relocations are ambiguous.

The 146 mechanically relocatable rows came from: particles formats 44, spritesheet formats 36, scene formats 32, texture-atlas formats 20, bitmap-font formats 4, old `types` files 3, shape formats 2, and one each from mesh, signals, texture formats, tilemap formats, and XML. Representative moves are `ParticleEmitterData` to `types/src/ParticleEmitter2D.ts`, `PerspectiveProjection` to `types/src/Camera3D.ts`, `GltfAccessor` to `types/src/GltfSchema.ts`, and `StarlingPexDocument` to `types/src/StarlingPexSchema.ts`.

The 26 rows without a same-name destination are:

- `ColorTransform`, `Camera`, `Scene`, `SceneRuntime`, `SceneAnimationTarget`, `SceneNodeTraits`;
- `EmbeddedSceneResourceRef`, `ExternalSceneResourceRef`, `ImageResource`, `ImageResourceCompressed`;
- `ParticleEmitter`, `ParticleEmitterRuntime`, `Surface`, `Tileset`, `VideoTexture`;
- `LoadSceneOptions`, `ResolveSceneResourcesOptions`, `SceneResourceRevealOptions`;
- `SceneMaterialTextureRegistry`, `SceneResourceInFlight`, `SceneResourceResolver`, `SceneResourceResolverOptions`;
- `SceneResourceEvent`, `SceneResourceSignals`, `GltfScene`, and `ShapeBitmapReference`.

Both cpp class identities still resolve exactly. A provisional audit over the 233 exact schemas still reports `Camera2D` and `ParticleEmitterState` provenance-closed with 17 and 236 direct accesses. This is not a grandfathering decision: U1 must re-prove them against the complete rule-derived universe before the cpp provenance guard accepts them.

Of the tranche-six identity lists, `tranche6a` has two stale entries (`Surface`, removed; `ParticleEmitterData`, moved) and `tranche6b` has three (`ImageResource`, removed; the Starling and libGDX documents, moved to `@flighthq/types`).

The one semantic patch remains exact. `@flighthq/entity` `createEntity` is still in `packages/entity/src/entity.ts`, and its normalized fingerprint remains `sha256:e8e8ec56ac0d693d53dc93ebf38f390809e722b38285fd85aff1e9c1d5c98d77`. Its public-lane visibility changed, but its semantic target did not.

## B. New packages and exports

Twenty-two package names were added and fourteen removed. Every added package is SDK-included; no new package currently qualifies for the recorded exclusion.

Added:

`application-gl`, `bitmap`, `camera-controls`, `importdiagnostics`, `physics2d`, `quadbatch`, `scene2d`, `scene2d-canvas`, `scene2d-dom`, `scene2d-formats`, `scene2d-gl`, `scene2d-resources`, `scene2d-wgpu`, `scene3d`, `scene3d-formats`, `scene3d-gl`, `scene3d-resources`, `scene3d-wgpu`, `skeleton2d`, `skeleton2d-formats`, `swf`, and `tilemap`.

Removed:

`camera2d`, `displayobject`, `displayobject-canvas`, `displayobject-dom`, `displayobject-gl`, `displayobject-wgpu`, `scene`, `scene-formats`, `scene-gl`, `scene-resources`, `scene-wgpu`, `sprite`, `surface`, and `tileset`.

The obvious replacement/split families are `surface` to `bitmap`; `camera2d` into `camera` plus `camera-controls`; `sprite` into `quadbatch`, `tilemap`, and `scene2d`; the four `displayobject-*` packages into `scene2d-*`; and `scene-*` into `scene3d-*`. The eight net-new package cells without a direct old package are `application-gl`, `importdiagnostics`, `physics2d`, `scene2d-formats`, `scene2d-resources`, `skeleton2d`, `skeleton2d-formats`, and `swf`.

Across matched non-SDK packages, 1,417 public names were added, 1,237 removed, 82 moved or changed declaration kind, and 384 retained their source/name but changed fingerprint. Added packages contribute another 573 public export records. Deduplicating canonical public declarations finds 1,487 names absent from the old inventory; 71 belong to excluded `tool-capture`, leaving 1,416 in translated packages. The largest owning groups are `types` 503, `bitmap` 106, `effects-gl` 53, `effects-wgpu` 49, `scene3d-resources` 44, `scene3d-gl` 42, `effects` 41, `materials` 39, and `physics2d` 36. Name absence is translation work, not proof that every item is semantically novel; many are deliberate replacement vocabulary.

## C. New host API endpoints

The translated WebGL surface adds three method calls and 25 constant reads. `LINE_STRIP` and `POINTS` already exist in `WebGl2Backend`; the remaining 26 endpoint names are missing:

- methods: `blendEquationSeparate`, `blendFuncSeparate`, `isEnabled`;
- constants: `ACTIVE_TEXTURE`, `BLEND_DST_ALPHA`, `BLEND_DST_RGB`, `BLEND_EQUATION_ALPHA`, `BLEND_EQUATION_RGB`, `BLEND_SRC_ALPHA`, `BLEND_SRC_RGB`, `CULL_FACE_MODE`, `CURRENT_PROGRAM`, `DEPTH_FUNC`, `DEPTH_WRITEMASK`, `MAX_TEXTURE_IMAGE_UNITS`, `SCISSOR_BOX`, `STENCIL_FAIL`, `STENCIL_FUNC`, `STENCIL_PASS_DEPTH_FAIL`, `STENCIL_PASS_DEPTH_PASS`, `STENCIL_REF`, `STENCIL_VALUE_MASK`, `STENCIL_WRITEMASK`, `TEXTURE3`, `TEXTURE_BINDING_2D`, and `VERTEX_ARRAY_BINDING`.

Principal sources are `render-gl/src/glRenderStateBracket.ts`, `render-gl/src/glRenderPass.ts`, `scene3d-gl/src/glPbrExtensionRegistry.ts`, and `scene3d-gl/src/glMeshUpload.ts`.

The translated Canvas surface adds `CanvasRenderingContext2D.isContextLost` in both field-read and call positions at `render-wgpu/src/wgpuExternalImageSource.ts:14,28`. `Canvas2dBackend` has neither endpoint mode.

There are no new translated `window`, `document`, or `navigator` root members. The excluded `tool-capture` package adds `WebGL*.isContextLost`, Canvas `createImageData`, navigator `hardwareConcurrency`/`userAgent`, and private `window.__ft*` capture fields; these do not justify translated runtime endpoints while the package remains excluded.

## D. Changed lowering assumptions

An audit over the 233 exact schemas accounts for 11,186 of 11,188 candidate declarations and reports two syntax diagnostics:

- in scope: `scene3d-wgpu/src/customShaderWgpuMeshMaterialRenderer.ts:268` uses an unsupported `for...in` statement;
- already excluded: `tool-capture/src/bin.ts:271` uses an unsupported array-rest binding.

The next core-generation failure after temporarily limiting analysis to exact candidates is:

```text
Cannot resolve imported export @flighthq/entity/contract.createEntity
```

This is the first manifestation of the new two-lane package contract, not an entity-specific exception. Import resolution, inventory, facade ownership, source bridges, and SDK/public accounting must all distinguish `.` from `./contract` while retaining one canonical implementation declaration.

The exact-schema audit itself changed from 405 candidates/10,257 direct accesses to 233 candidates/8,441 direct accesses, with 229 still eligible and four ineligible. Those figures are diagnostic only because the 172 stale identities have not been re-derived.

## E. Vitest accounting

The upstream test inventory rises by 100 files, from 1,166 to 1,266:

- packages newly present contribute 354 test files;
- removed packages carried 297;
- the 38 retained packages with changed counts contribute a net +43;
- `354 - 297 + 43 = 100`.

The largest retained-package deltas are `effects-canvas` -28, `tool-capture` +12, `clock` -9, `materials` +9, `render-gl` +9, `animation` +8, `render-wgpu` +8, `flow` -8, `camera` +6, `motionpath` -6, and `collision` +5. Parity accounting must move from 131 to 139 packages and must continue to record excluded-package tests rather than silently dropping them.

## F. Upstream examples

Every one of the 28 currently ported example counterparts changed: `adjustments`, `benchmark`, `bitmap`, `camera2d`, `clock`, `collision`, `effects`, `flowstates`, `interaction`, `motionpath`, `movieclip`, `particleeditor`, `particles`, `pathboolean`, `platformer`, `scene3d`, `shapes`, `skeleton`, `snapshot`, `sound`, `spatial`, `spring`, `spritesheet`, `text`, `textinput`, `tilemap`, `tween`, and `video`.

Thirteen upstream examples are new and have no Haxe example counterpart: `awd2loading`, `bitmapfont-generate`, `cross-backend-embed`, `crossfade`, `formatloading`, `materialshowcase`, `scene-explosions`, `scene-fire`, `scene-globe`, `scene-picking`, `scene-primitives`, `scene-shading`, and `scene-skybox`.

No old example package disappeared. The upstream example-package diff covers 291 files with 8,150 added and 1,415 deleted lines. The example-port diff remains review's lane.

## Proposed U1 order

No item below is implemented in U0.

1. **Package lanes and inventory first.** Derive `.` and `./contract` entries from each package's own manifest/barrels, resolve both to canonical declarations, derive SDK inclusion from the upstream SDK surface, and make every unaccounted lane/export loud. This unblocks all later analysis without a package-name list.
2. **Stable declaration identity.** Use package plus exported name and declaration kind as the primary identity; retain source path as provenance and only as a disambiguator. The new all-types-in-`@flighthq/types` rule should make the 146 moves checker-derived rather than edited one by one. The semantic patch keeps an explicit fingerprint because it is a genuine exception, but its path becomes a checked disambiguator rather than the primary key.
3. **Rule-derived typed-struct audit universe.** Discover supported record shapes from checker facts, then apply member escapes, presence/width sensitivity, class feasibility, containment, and provenance closure as rules. Replace tranche arrays with the deterministic audit diff. During this campaign, keep newly discovered rows audit-only through a generated migration lock from the old report so direct/class behavior cannot expand accidentally. Re-derive the two cpp controls against the complete universe; retain their tiny explicit representation-intent list only if the provenance guard closes them.
4. **Host endpoint discovery and coverage.** Derive GL/Canvas/DOM/WebGPU receiver use from checker-proven bindings. Replace duplicate lowering/emitter name sets with one endpoint contract and generation-time coverage against maintained runtime implementations. Runtime implementations remain explicit target semantics; only the usage inventory becomes derived.
5. **General lowering gaps.** Add a general `for...in` rule with focused positive/negative tests. Keep the excluded `tool-capture` array-rest diagnostic recorded until the exclusion predicate or package scope changes.
6. **Exclusion predicate.** Replace the `tool-capture` name entry with a tested predicate over upstream package facts: tooling lane, absent from SDK, and Node/Playwright-only host dependencies/imports. Emit the derived reason and fail if a package partly matches or a new exclusion reason appears.
7. **Regenerate and review behavior separately.** Only after the preceding audit surfaces are agreed should generated Haxe, bridges, parity counts, and tests change. No class or direct-struct expansion belongs in this campaign.

The lists that should survive are semantic language/ABI tables rather than upstream exceptions: Haxe keywords/operators, typed-array and collection mappings, host type-erasure policy, and deliberately explicit cpp representation intent. They should be consolidated and validated against the active TypeScript/Haxe contracts, but they cannot be inferred solely from upstream names. WebGL blend-domain constants can be derived from the upstream union declarations instead of remaining a hand list.
