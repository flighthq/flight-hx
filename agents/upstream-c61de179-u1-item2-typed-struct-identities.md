# U1 Item 2: Stable Typed-Struct Identities

Date: 2026-07-31

Scope: identity resolution only for upstream `c61de179af8a12c2fa3b9b7d5389ee302f577a0d`. This item does not accept the missing-name or declaration-kind changes, regenerate artifacts, or begin U1 items 3–7.

## Identity rule and result

The primary identity is `<public package>:<declaration kind>#<exported name>`. Declaration kind is source-controlled: the eight existing `type` candidates are explicit and all other existing candidates are guarded as `interface`, so drift remains loud without reading a prior generated report. The current public package and declaration source come from the manifest-derived export lanes introduced in item 1. Root and `./contract` duplicates are collapsed. SDK aggregation does not steal ownership: an export from its defining package is preferred over an SDK re-export. The configured source path and package remain checked provenance and are used only to disambiguate otherwise-colliding public identities.

The 405 configured candidates resolve as follows:

| Result                                     | Count |
| ------------------------------------------ | ----: |
| Exact public package and source            |   231 |
| Relocated by the identity rule             |   146 |
| No public export with the configured name  |    26 |
| Same public name, changed declaration kind |     2 |
| Ambiguous                                  |     0 |

All 146 relocations resolve to declarations defined and publicly exported by `@flighthq/types`. The configured candidate paths were not edited. For example, configured `@flighthq/types` / `ParticleEmitter.ts#ParticleEmitterData` resolves to `@flighthq/types:interface#ParticleEmitterData` at `ParticleEmitter2D.ts`; both locations remain visible in the audit provenance.

Missing, kind-changed, and ambiguous identities fail together in a sorted diagnostic. An ambiguity prints every alternative public package, declaration kind, and source. This item intentionally leaves the 28 review rows failing rather than accepting a same-name kind drift or guessing a replacement.

## Missing-name review table

These are proposals for review, not candidate-list edits. “Renamed” means the evidence supports a concrete successor even where that successor has small refinements. “Removed with replacement vocabulary” means the old responsibilities were split or reshaped and there is no single identity to substitute. “Genuinely gone” is reserved for an old concept with no current successor; the evidence below does not support that disposition for any row.

| Old identity | Current-tree evidence | Proposed disposition |
| --- | --- | --- |
| `@flighthq/types:interface#ColorTransform` | `ColorScaleBias.ts` retains the same eight per-channel affine values as `*Scale`/`*Bias` instead of `*Multiplier`/`*Offset`; `ColorScaleBiasAdjustment.ts` integrates that value into the new adjustment stack. | Renamed → `@flighthq/types:interface#ColorScaleBias` |
| `@flighthq/types:interface#Camera` | `Camera3D.ts` retains `far`, `inverseViewProjection`, `jitter`, `near`, `projection`, and `view`; comments explicitly identify the type as the 3D camera. | Renamed → `@flighthq/types:interface#Camera3D` |
| `@flighthq/scene-resources:interface#LoadSceneOptions` | The old record only supplied an optional resolver to combined parse-and-resolve loaders. Current document loaders take `Scene3DDocumentLoadOptions`, while `loadScene3DResources(scene, resolver, LoadScene3DResourcesOptions)` makes resolution and resolver ownership explicit. | Removed with replacement vocabulary (`Scene3DDocumentLoadOptions` + `LoadScene3DResourcesOptions`) |
| `@flighthq/scene-resources:interface#ResolveSceneResourcesOptions` | The old `select` + `priority` policy now matches `UpdateScene3DResourceStreamingOptions`; current `ResolveScene3DResourcesOptions` deliberately contains only synchronous selection. | Renamed/split → `@flighthq/types:interface#UpdateScene3DResourceStreamingOptions` |
| `@flighthq/scene-resources:interface#SceneResourceRevealOptions` | `Scene3DResourceRevealOptions` retains `ease`, `fadeSeconds`, and `from`, and `revealScene3DResourcesOnResolve` consumes it. | Renamed → `@flighthq/types:interface#Scene3DResourceRevealOptions` |
| `@flighthq/scene-resources:interface#SceneMaterialTextureRegistry` | `Scene3DMaterialTextureRegistry` retains the material-kind lister map and adds PBR-extension listers under the explicit 3D namespace. | Renamed → `@flighthq/types:interface#Scene3DMaterialTextureRegistry` |
| `@flighthq/scene-resources:interface#SceneResourceInFlight` | `Scene3DResourceInFlight` retains `controller` and `promise`; the old loader key is replaced by a texture-subscriber set for shared references. | Renamed → `@flighthq/types:interface#Scene3DResourceInFlight` |
| `@flighthq/scene-resources:interface#SceneResourceResolver` | `Scene3DResourceResolver` retains the public `fetch` and `registry` seams; mutable loader/in-flight/signals state moved to `Scene3DResourceResolverRuntime`. | Renamed → `@flighthq/types:interface#Scene3DResourceResolver` |
| `@flighthq/scene-resources:interface#SceneResourceResolverOptions` | `Scene3DResourceResolverOptions` retains optional `fetch`, `maxConcurrent`, and `registry`. | Renamed → `@flighthq/types:interface#Scene3DResourceResolverOptions` |
| `@flighthq/scene-resources:interface#SceneResourceEvent` | `Scene3DResourceEvent` retains `ref` and `texture`, with the reference narrowed to `ImageResourceReference`. | Renamed → `@flighthq/types:interface#Scene3DResourceEvent` |
| `@flighthq/scene-resources:interface#SceneResourceSignals` | `Scene3DResourceSignals` retains `onResourceFailed` and `onResourceResolved` over the renamed event. | Renamed → `@flighthq/types:interface#Scene3DResourceSignals` |
| `@flighthq/types:interface#Scene` | `Scene3D.ts` retains `animations`, `metadata`, and `root`, renames the root vocabulary to `Node3D`, and adds the scene-owned resource references. | Renamed → `@flighthq/types:interface#Scene3D` |
| `@flighthq/types:type#SceneRuntime` | `Scene3DRuntime` remains an alias of `EntityRuntime`. | Renamed → `@flighthq/types:type#Scene3DRuntime` |
| `@flighthq/types:interface#SceneAnimationTarget` | `Scene3DAnimationTarget` retains the `node`/`path` pair with `Node3D` and `Scene3DAnimationPath`. | Renamed → `@flighthq/types:interface#Scene3DAnimationTarget` |
| `@flighthq/types:interface#SceneNodeTraits` | `Node3D.ts` preserves the `HasAppearance` + `HasTransform3D` trait composition as `Node3DTraits`; the surrounding `SceneNode` family was renamed `Node3D`. | Renamed → `@flighthq/types:interface#Node3DTraits` |
| `@flighthq/types:interface#EmbeddedSceneResourceRef` | `EmbeddedImageResourceReference` preserves the `Embedded` discriminator, bytes, MIME type, and resolution state; it adds failure and consuming-texture state. | Renamed → `@flighthq/types:interface#EmbeddedImageResourceReference` |
| `@flighthq/types:interface#ExternalSceneResourceRef` | `ExternalImageResourceReference` preserves the `External` discriminator, URI, base path, MIME type, and resolution state; it adds failure and consuming-texture state. | Renamed → `@flighthq/types:interface#ExternalImageResourceReference` |
| `@flighthq/types:interface#ImageResource` | The old nullable `source`/`data`/`compressed` aggregate was deliberately replaced by discriminated sibling `TextureSource` variants: `Image`, `Bitmap`, and `CompressedImage`. | Removed with replacement vocabulary (`Image` / `Bitmap` / `CompressedImage`) |
| `@flighthq/types:interface#ImageResourceCompressed` | `CompressedImageData` retains the exact `container` and `payload` fields; `CompressedImage` owns that data as a typed texture source. | Renamed → `@flighthq/types:interface#CompressedImageData` |
| `@flighthq/types:interface#ParticleEmitter` | `ParticleEmitter2D` retains `data` and the emitter kind under the explicit `Node2D` hierarchy; `ParticleEmitterData` moved into the same file without changing its public name. | Renamed → `@flighthq/types:interface#ParticleEmitter2D` |
| `@flighthq/types:interface#ParticleEmitterRuntime` | `ParticleEmitter2DRuntime` retains `localBoundsRectangle` and now extends `Node2DRuntime`. | Renamed → `@flighthq/types:interface#ParticleEmitter2DRuntime` |
| `@flighthq/types:interface#Surface` | `Bitmap` is the mutable CPU-readable pixel source and retains non-null byte data, color space, alpha type, and pixel format under the new texture-source split. | Renamed → `@flighthq/types:interface#Bitmap` |
| `@flighthq/types:interface#Tileset` | Runtime atlas/grid fields live in `TilemapData`; Tiled format margin/spacing/column metadata lives in `TiledTileset`, and `TiledTilesetResolver` projects a document reference into runtime layout. | Removed with replacement vocabulary (`TilemapData` + `TiledTileset`) |
| `@flighthq/types:interface#VideoTexture` | `createVideoTexture` now returns the universal discriminated `Texture`; it wraps `VideoResource.element` in an `Image`, and `advanceVideoTexture` advances `Image.version`/`Texture.version`. | Removed with replacement vocabulary (`Texture` + `Image` + `VideoResource`) |
| `@flighthq/scene-formats:interface#GltfScene` | `GltfScene3D` retains the glTF wire fields `name?` and `nodes?`; `GltfDocument.scenes` now names that type. | Renamed → `@flighthq/types:interface#GltfScene3D` |
| `@flighthq/shape-formats:interface#ShapeBitmapReference` | `ShapeTextureReference` retains the exact serialized `index` field, and `ShapeJsonParseOptions.resolveTexture` replaces the bitmap callback with a texture callback. | Renamed → `@flighthq/types:interface#ShapeTextureReference` |

## Declaration-kind review rows

These are not counted among the 26 missing names and are intentionally not auto-accepted.

| Stable name | Baseline kind | Current declaration | Review evidence |
| --- | --- | --- | --- |
| `@flighthq/types#Texture` | `interface` | `type` | `Texture.ts` is now a discriminated union across `2d`, `2d-array`, `3d`, and `cube` variants. |
| `@flighthq/types#CubeTexture` | `interface` | `type` | `CubeTexture.ts` is now `Extract<Texture, { dimension: 'cube' }>` rather than an independent interface. |

## Verification boundary

Item 1's focused command was `npx vitest run tests/generator/inventory.test.ts -t analyzeUpstream`. The filter intentionally skipped the known campaign-red lowering audit. Whether to encode an explicit conditional skip belongs to item 3 and is not decided here.

Item 2's focused proof is `npx vitest run tests/generator/typed-structs.test.ts -t "stable declaration identity"`. Generated Haxe, JavaScript bridges, maintained runtime code, and committed reports remain untouched in this item.
