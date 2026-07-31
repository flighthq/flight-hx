# Typed Struct Audit

Upstream commit: `5d24729f7360475e28a105ae0caeeaa2e1328260`

Eligibility is audited independently from emission. Audit-only schemas remain reflective until their audit diff is approved.

| Metric | Count |
| --- | ---: |
| Candidates | 405 |
| Eligible | 404 |
| Ineligible | 1 |
| Audit-only schemas | 342 |
| Direct schemas | 62 |
| Declared fields | 2028 |
| Bindable accesses | 10257 |
| Pending accesses | 3799 |
| Directly emitted accesses | 6458 |
| Reflective survivors | 171 |
| Dynamic escapes | 348 |

| Candidate | Mode | Purpose | Fields | Reads | Writes | Calls | Pending | Direct | Reflective survivors | Escapes | Eligible | Reasons |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | :---: | --- |
| `Vector2` | `direct` | two-component numeric geometry leaf | 2 | 186 | 136 | 0 | 0 | 322 | 0 | 0 | yes | — |
| `Vector3` | `direct` | three-component numeric geometry leaf | 3 | 735 | 405 | 0 | 0 | 1140 | 0 | 0 | yes | — |
| `Quaternion` | `direct` | four-component rotation leaf | 4 | 84 | 132 | 0 | 0 | 216 | 0 | 0 | yes | — |
| `Matrix3` | `direct` | 3x3 matrix holder | 1 | 49 | 0 | 0 | 0 | 49 | 0 | 0 | yes | — |
| `Matrix4` | `direct` | 4x4 matrix holder | 1 | 115 | 0 | 0 | 0 | 115 | 0 | 0 | yes | — |
| `Rectangle` | `direct` | four-component rectangle leaf | 4 | 422 | 214 | 0 | 0 | 0 | 0 | 2 | no | `presence-sensitive-use` |
| `ColorTransform` | `direct` | render-hot RGBA multiplier and offset record | 8 | 159 | 56 | 0 | 0 | 215 | 0 | 0 | yes | — |
| `ApplicationLoopOptions` | `direct` | application-loop option record | 5 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `AudioBusOptions` | `direct` | audio-bus option record | 4 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `AudioPlayOptions` | `direct` | audio-playback option record | 4 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `BinPackOptions` | `direct` | bin-packing option record | 8 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `BitmapTextOptions` | `direct` | bitmap-text option record | 6 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `DeviceCapabilities` | `direct` | device capability result record | 3 | 0 | 6 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `DeviceDisplayMetrics` | `direct` | device display-metrics result record | 7 | 0 | 14 | 0 | 0 | 14 | 0 | 0 | yes | — |
| `FileDialogHandle` | `direct` | file-dialog result handle | 3 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `FilmicToneMapOptions` | `direct` | filmic tone-map option record | 6 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `FontMetrics` | `direct` | font-metrics result record | 8 | 9 | 8 | 0 | 0 | 17 | 0 | 0 | yes | — |
| `GlyphAtlasOptions` | `direct` | glyph-atlas option record | 6 | 7 | 0 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `GlyphMetrics` | `direct` | glyph-metrics result record | 3 | 11 | 0 | 0 | 0 | 11 | 0 | 0 | yes | — |
| `GlyphRasterizeOptions` | `direct` | glyph-rasterization option record | 4 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `HapticsCapabilities` | `direct` | haptics capability result record | 5 | 0 | 10 | 0 | 0 | 10 | 0 | 0 | yes | — |
| `InputGamepadAxisData` | `direct` | gamepad-axis input result record | 4 | 3 | 4 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `InputGamepadButtonData` | `direct` | gamepad-button input result record | 4 | 4 | 4 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `InputGamepadConnectData` | `direct` | gamepad-connection input result record | 3 | 4 | 6 | 0 | 0 | 10 | 0 | 0 | yes | — |
| `InputTextData` | `direct` | text-input result record | 2 | 1 | 4 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `InteractionPointerOptions` | `direct` | interaction-pointer option record | 7 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `PathBooleanOptions` | `direct` | path-boolean option record | 2 | 7 | 0 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `PathOffsetOptions` | `direct` | path-offset option record | 5 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `RenderCacheRefreshOptions` | `direct` | render-cache refresh option record | 3 | 9 | 0 | 0 | 0 | 9 | 0 | 0 | yes | — |
| `StatusBarInfo` | `direct` | status-bar result record | 5 | 1 | 10 | 0 | 0 | 11 | 0 | 0 | yes | — |
| `TextMetrics` | `direct` | text-metrics result record | 3 | 0 | 6 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `TrayBalloonOptions` | `direct` | tray-balloon option record | 7 | 7 | 0 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `VideoPlayOptions` | `direct` | video-playback option record | 4 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `VideoResourceLoadOptions` | `direct` | video-resource load option record | 5 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `SignalThrottleOptions` | `direct` | signal-throttle option record | 2 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `Aabb` | `direct` | 3D axis-aligned bounds entity | 2 | 22 | 0 | 0 | 0 | 22 | 0 | 0 | yes | — |
| `AabbLike` | `direct` | structural 3D axis-aligned bounds carrier | 2 | 230 | 0 | 0 | 0 | 230 | 0 | 0 | yes | — |
| `HasTransform3D` | `direct` | authored node 3D transform aggregate | 3 | 12 | 3 | 0 | 0 | 15 | 0 | 0 | yes | — |
| `HasTransform3DRuntime` | `direct` | cached node 3D transform aggregate | 4 | 15 | 9 | 0 | 0 | 24 | 28 | 28 | yes | — |
| `HasTransform2D` | `direct` | authored node 2D transform aggregate | 9 | 43 | 38 | 0 | 0 | 81 | 7 | 7 | yes | — |
| `HasTransform2DRuntime` | `direct` | cached node 2D transform aggregate | 6 | 17 | 10 | 0 | 0 | 27 | 50 | 50 | yes | — |
| `HasBoundsRectangleRuntime` | `direct` | cached node rectangle-bounds aggregate | 5 | 7 | 6 | 1 | 0 | 14 | 53 | 53 | yes | — |
| `BoundingSphere` | `direct` | 3D bounding-sphere aggregate | 2 | 134 | 16 | 0 | 0 | 150 | 0 | 0 | yes | — |
| `Camera` | `direct` | 3D camera aggregate | 6 | 34 | 3 | 0 | 0 | 37 | 0 | 0 | yes | — |
| `PerspectiveProjection` | `direct` | perspective-camera projection aggregate | 3 | 7 | 0 | 0 | 0 | 7 | 7 | 7 | yes | — |
| `OrthographicProjection` | `direct` | orthographic-camera projection aggregate | 3 | 6 | 0 | 0 | 0 | 6 | 7 | 7 | yes | — |
| `Camera2D` | `direct` | 2D camera hot-state aggregate | 6 | 12 | 5 | 0 | 0 | 17 | 0 | 0 | yes | — |
| `Camera2DFollowOptions` | `direct` | 2D camera follow aggregate | 4 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `Camera2DOptions` | `direct` | 2D camera construction aggregate | 4 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `Capsule` | `direct` | 3D capsule-bounds aggregate | 7 | 38 | 7 | 0 | 0 | 45 | 0 | 0 | yes | — |
| `Plane` | `direct` | 3D plane aggregate | 4 | 61 | 36 | 0 | 0 | 97 | 0 | 0 | yes | — |
| `Frustum` | `direct` | 3D frustum aggregate | 6 | 24 | 0 | 0 | 0 | 24 | 0 | 0 | yes | — |
| `SpatialAabb` | `direct` | 2D spatial-index bounds aggregate | 4 | 30 | 4 | 0 | 0 | 34 | 0 | 0 | yes | — |
| `Obb` | `direct` | 3D oriented-bounds aggregate | 10 | 44 | 20 | 0 | 0 | 64 | 0 | 0 | yes | — |
| `Ray3D` | `direct` | 3D ray aggregate | 2 | 85 | 0 | 0 | 0 | 85 | 0 | 0 | yes | — |
| `MeshGeometryOptions` | `audit-only` | broad scene document | 5 | 7 | 0 | 0 | 7 | 0 | 0 | 0 | yes | — |
| `LoadSceneOptions` | `audit-only` | broad scene document | 1 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `ResolveSceneResourcesOptions` | `audit-only` | broad scene document | 2 | 1 | 0 | 2 | 3 | 0 | 0 | 0 | yes | — |
| `SceneResourceRevealOptions` | `audit-only` | broad scene document | 3 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `SceneMaterialTextureRegistry` | `audit-only` | broad scene document | 1 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `SceneResourceInFlight` | `audit-only` | broad scene document | 3 | 4 | 1 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `SceneResourceResolver` | `audit-only` | broad scene document | 5 | 20 | 1 | 1 | 22 | 0 | 0 | 0 | yes | — |
| `SceneResourceResolverOptions` | `audit-only` | broad scene document | 3 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `SceneResourceEvent` | `audit-only` | broad scene document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SceneResourceSignals` | `audit-only` | broad scene document | 2 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `AnimationClip` | `audit-only` | broad scene document | 2 | 8 | 0 | 0 | 8 | 0 | 0 | 0 | yes | — |
| `Billboard` | `audit-only` | broad scene document | 12 | 1 | 3 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `Mesh` | `audit-only` | broad scene document | 13 | 49 | 12 | 0 | 61 | 0 | 0 | 0 | yes | — |
| `MeshGeometry` | `direct` | broad scene document | 7 | 203 | 18 | 0 | 0 | 221 | 8 | 8 | yes | — |
| `MeshSubset` | `audit-only` | broad scene document | 2 | 23 | 0 | 0 | 23 | 0 | 0 | 0 | yes | — |
| `VertexAttribute` | `audit-only` | broad scene document | 3 | 32 | 0 | 0 | 32 | 0 | 0 | 0 | yes | — |
| `VertexAttributeLayout` | `audit-only` | broad scene document | 2 | 53 | 0 | 0 | 53 | 0 | 0 | 0 | yes | — |
| `NodeSignals` | `audit-only` | broad scene document | 5 | 14 | 0 | 0 | 14 | 0 | 0 | 0 | yes | — |
| `Scene` | `audit-only` | broad scene document | 3 | 14 | 0 | 0 | 14 | 0 | 0 | 0 | yes | — |
| `SceneRuntime` | `audit-only` | broad scene document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SceneAnimationTarget` | `audit-only` | broad scene document | 2 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `SceneNodeTraits` | `audit-only` | broad scene document | 5 | 9 | 2 | 0 | 11 | 0 | 0 | 4 | yes | — |
| `EmbeddedSceneResourceRef` | `audit-only` | broad scene document | 4 | 2 | 0 | 0 | 2 | 0 | 0 | 8 | yes | — |
| `ExternalSceneResourceRef` | `audit-only` | broad scene document | 5 | 2 | 0 | 0 | 2 | 0 | 0 | 8 | yes | — |
| `Signal` | `audit-only` | broad scene document | 2 | 16 | 6 | 18 | 40 | 0 | 0 | 0 | yes | — |
| `SignalData` | `audit-only` | broad scene document | 4 | 28 | 2 | 0 | 30 | 0 | 0 | 0 | yes | — |
| `TweenManager` | `audit-only` | broad scene document | 3 | 16 | 0 | 0 | 16 | 0 | 0 | 0 | yes | — |
| `AssetDescriptor` | `audit-only` | broad asset document | 4 | 10 | 0 | 0 | 10 | 0 | 0 | 0 | yes | — |
| `AssetEntry` | `audit-only` | broad asset document | 4 | 13 | 6 | 0 | 19 | 0 | 0 | 0 | yes | — |
| `AssetGroupLoadOptions` | `audit-only` | broad asset document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `AssetLibrary` | `audit-only` | broad asset document | 1 | 9 | 0 | 0 | 9 | 0 | 0 | 0 | yes | — |
| `AssetLibraryRuntime` | `audit-only` | broad asset document | 4 | 25 | 0 | 0 | 25 | 0 | 0 | 0 | yes | — |
| `AssetLoadProgress` | `audit-only` | broad asset document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AssetLoaderAdapter` | `audit-only` | broad asset document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | yes | — |
| `AttractorForce` | `audit-only` | broad asset document | 7 | 6 | 0 | 0 | 6 | 0 | 0 | 1 | yes | — |
| `AudioBus` | `audit-only` | broad asset document | 4 | 11 | 5 | 0 | 16 | 0 | 0 | 0 | yes | — |
| `AudioMixer` | `audit-only` | broad asset document | 2 | 4 | 2 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `AudioMixerOptions` | `audit-only` | broad asset document | 2 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `AudioChannel` | `audit-only` | broad asset document | 8 | 24 | 16 | 0 | 40 | 0 | 0 | 0 | yes | — |
| `AudioResource` | `audit-only` | broad asset document | 1 | 16 | 1 | 0 | 17 | 0 | 0 | 0 | yes | — |
| `AudioResourceUrl` | `audit-only` | broad asset document | 2 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `BitmapFont` | `audit-only` | broad asset document | 5 | 12 | 0 | 0 | 12 | 0 | 0 | 0 | yes | — |
| `BitmapFontData` | `audit-only` | broad asset document | 5 | 9 | 0 | 0 | 9 | 0 | 0 | 0 | yes | — |
| `BitmapFontGlyphData` | `audit-only` | broad asset document | 9 | 9 | 0 | 0 | 9 | 0 | 0 | 0 | yes | — |
| `BitmapFontKerningData` | `audit-only` | broad asset document | 3 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `BitmapFontParseOptions` | `audit-only` | broad asset document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `CircleCollider` | `audit-only` | broad asset document | 7 | 17 | 0 | 0 | 17 | 0 | 0 | 1 | yes | — |
| `CubeTexture` | `audit-only` | broad asset document | 3 | 27 | 1 | 0 | 28 | 0 | 0 | 0 | yes | — |
| `DragForce` | `audit-only` | broad asset document | 2 | 3 | 0 | 0 | 3 | 0 | 0 | 1 | yes | — |
| `Font` | `audit-only` | broad asset document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `FontUrl` | `audit-only` | broad asset document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `FontResource` | `audit-only` | broad asset document | 2 | 5 | 4 | 0 | 9 | 0 | 0 | 0 | yes | — |
| `GlyphAtlas` | `audit-only` | broad asset document | 1 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `GlyphAtlasRuntime` | `audit-only` | broad asset document | 15 | 58 | 14 | 0 | 72 | 0 | 0 | 0 | yes | — |
| `GlyphAtlasShelf` | `audit-only` | broad asset document | 3 | 5 | 1 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `GlyphEntry` | `audit-only` | broad asset document | 8 | 37 | 2 | 0 | 39 | 0 | 0 | 0 | yes | — |
| `GlyphRasterizedBitmap` | `audit-only` | broad asset document | 6 | 17 | 0 | 0 | 17 | 0 | 0 | 0 | yes | — |
| `GlyphSource` | `audit-only` | broad asset document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 5 | yes | — |
| `GridSliceOptions` | `audit-only` | broad asset document | 12 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `ImageResource` | `audit-only` | broad asset document | 8 | 150 | 9 | 0 | 159 | 0 | 0 | 0 | yes | — |
| `ImageResourceCompressed` | `audit-only` | broad asset document | 2 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `ParticleConfigIssue` | `audit-only` | broad asset document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ColorKeyframe` | `audit-only` | broad asset document | 4 | 22 | 0 | 0 | 22 | 0 | 0 | 0 | yes | — |
| `CurveKeyframe` | `audit-only` | broad asset document | 2 | 11 | 0 | 0 | 11 | 0 | 0 | 0 | yes | — |
| `ParticleEmitter` | `audit-only` | broad asset document | 19 | 54 | 0 | 0 | 54 | 0 | 0 | 0 | yes | — |
| `ParticleEmitterData` | `direct` | broad asset document | 9 | 377 | 28 | 0 | 0 | 405 | 0 | 0 | yes | — |
| `ParticleEmitterRuntime` | `audit-only` | broad asset document | 34 | 4 | 2 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `ParticleEmitterConfig` | `direct` | broad asset document | 52 | 705 | 0 | 0 | 0 | 705 | 6 | 6 | yes | — |
| `ParticleEmitterSignals` | `audit-only` | broad asset document | 3 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `ParticleEmitterState` | `direct` | broad asset document | 13 | 157 | 23 | 56 | 0 | 236 | 0 | 0 | yes | — |
| `ParticleObjectsState` | `audit-only` | broad asset document | 10 | 16 | 11 | 9 | 36 | 0 | 0 | 0 | yes | — |
| `ParticleObjectsUpdateOptions` | `audit-only` | broad asset document | 3 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `PlaneCollider` | `audit-only` | broad asset document | 7 | 10 | 0 | 0 | 10 | 0 | 0 | 1 | yes | — |
| `RectangleCollider` | `audit-only` | broad asset document | 8 | 9 | 0 | 0 | 9 | 0 | 0 | 1 | yes | — |
| `ResourceLoader` | `audit-only` | broad asset document | 6 | 20 | 0 | 0 | 20 | 0 | 0 | 0 | yes | — |
| `ResourceLoaderItemSignals` | `audit-only` | broad asset document | 4 | 8 | 0 | 0 | 8 | 0 | 0 | 0 | yes | — |
| `ResourceLoaderOptions` | `audit-only` | broad asset document | 10 | 12 | 0 | 0 | 12 | 0 | 0 | 0 | yes | — |
| `ResourceLoadHandle` | `audit-only` | broad asset document | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `ResourceLoadItem` | `audit-only` | broad asset document | 9 | 11 | 0 | 0 | 11 | 0 | 0 | 0 | yes | — |
| `ResourceLoadReport` | `audit-only` | broad asset document | 6 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `Sampler` | `audit-only` | broad asset document | 6 | 40 | 11 | 0 | 51 | 0 | 0 | 0 | yes | — |
| `SphereCollider` | `audit-only` | broad asset document | 8 | 22 | 0 | 0 | 22 | 0 | 0 | 1 | yes | — |
| `Spritesheet` | `audit-only` | broad asset document | 3 | 8 | 0 | 0 | 8 | 0 | 0 | 0 | yes | — |
| `SpritesheetAnimation` | `audit-only` | broad asset document | 7 | 20 | 0 | 0 | 20 | 0 | 0 | 0 | yes | — |
| `SpritesheetAnimationData` | `audit-only` | broad asset document | 8 | 38 | 0 | 0 | 38 | 0 | 0 | 0 | yes | — |
| `SpritesheetData` | `audit-only` | broad asset document | 6 | 33 | 0 | 0 | 33 | 0 | 0 | 0 | yes | — |
| `SpritesheetFrame` | `audit-only` | broad asset document | 6 | 12 | 0 | 0 | 12 | 0 | 0 | 0 | yes | — |
| `SpritesheetFrameData` | `audit-only` | broad asset document | 12 | 102 | 0 | 0 | 102 | 0 | 0 | 0 | yes | — |
| `SpritesheetPlayer` | `audit-only` | broad asset document | 9 | 30 | 35 | 0 | 65 | 0 | 0 | 0 | yes | — |
| `SpritesheetValidationDiagnostic` | `audit-only` | broad asset document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `Surface` | `direct` | broad asset document | 9 | 432 | 1 | 0 | 0 | 433 | 0 | 0 | yes | — |
| `Texture` | `audit-only` | broad asset document | 7 | 160 | 10 | 0 | 170 | 0 | 0 | 0 | yes | — |
| `TextureAtlas` | `audit-only` | broad asset document | 2 | 120 | 1 | 0 | 121 | 0 | 0 | 0 | yes | — |
| `TextureAtlasRegion` | `direct` | broad asset document | 14 | 248 | 10 | 0 | 0 | 258 | 0 | 0 | yes | — |
| `TextureUvTransform` | `audit-only` | broad asset document | 3 | 10 | 0 | 0 | 10 | 0 | 0 | 0 | yes | — |
| `Tileset` | `audit-only` | broad asset document | 7 | 13 | 1 | 0 | 14 | 0 | 0 | 0 | yes | — |
| `TurbulenceForce` | `audit-only` | broad asset document | 3 | 4 | 0 | 0 | 4 | 0 | 0 | 1 | yes | — |
| `VideoChannel` | `audit-only` | broad asset document | 8 | 32 | 12 | 0 | 44 | 0 | 0 | 0 | yes | — |
| `VideoResource` | `audit-only` | broad asset document | 1 | 32 | 1 | 0 | 33 | 0 | 0 | 0 | yes | — |
| `VideoResourceUrl` | `audit-only` | broad asset document | 2 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `VideoTexture` | `audit-only` | broad asset document | 7 | 29 | 8 | 0 | 37 | 0 | 0 | 0 | yes | — |
| `VortexForce` | `audit-only` | broad asset document | 10 | 9 | 0 | 0 | 9 | 0 | 0 | 1 | yes | — |
| `WindForce` | `audit-only` | broad asset document | 4 | 3 | 0 | 0 | 3 | 0 | 0 | 1 | yes | — |
| `App` | `audit-only` | broad host document | 6 | 7 | 0 | 0 | 7 | 0 | 0 | 0 | yes | — |
| `AppLoginItem` | `audit-only` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AppLoginItemLike` | `audit-only` | broad host document | 4 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `Application` | `audit-only` | broad host document | 13 | 39 | 18 | 0 | 57 | 0 | 0 | 0 | yes | — |
| `ApplicationWindow` | `audit-only` | broad host document | 36 | 80 | 59 | 0 | 139 | 0 | 0 | 0 | yes | — |
| `WindowBounds` | `audit-only` | broad host document | 4 | 0 | 24 | 0 | 24 | 0 | 0 | 0 | yes | — |
| `WindowOptions` | `audit-only` | broad host document | 18 | 75 | 0 | 0 | 75 | 0 | 0 | 0 | yes | — |
| `ClipboardBookmark` | `audit-only` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ClipboardWriteItem` | `audit-only` | broad host document | 2 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `ClipboardWatch` | `audit-only` | broad host document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `Connectivity` | `audit-only` | broad host document | 5 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `ConnectivityReachability` | `audit-only` | broad host document | 2 | 0 | 8 | 0 | 8 | 0 | 0 | 0 | yes | — |
| `ConnectivityReachabilityOptions` | `audit-only` | broad host document | 3 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `ConnectivityStatus` | `audit-only` | broad host document | 8 | 34 | 16 | 0 | 50 | 0 | 0 | 0 | yes | — |
| `DeviceInfo` | `audit-only` | broad host document | 25 | 0 | 50 | 0 | 50 | 0 | 0 | 0 | yes | — |
| `SafeAreaInsets` | `audit-only` | broad host document | 4 | 4 | 12 | 0 | 16 | 0 | 0 | 0 | yes | — |
| `FileDialogFilter` | `audit-only` | broad host document | 3 | 12 | 0 | 0 | 12 | 0 | 0 | 0 | yes | — |
| `MessageDialogOptions` | `audit-only` | broad host document | 10 | 28 | 0 | 0 | 28 | 0 | 0 | 3 | yes | — |
| `MessageDialogResult` | `audit-only` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `OpenDirectoryDialogOptions` | `audit-only` | broad host document | 4 | 7 | 0 | 0 | 7 | 0 | 0 | 0 | yes | — |
| `OpenFileDialogOptions` | `audit-only` | broad host document | 7 | 19 | 0 | 0 | 19 | 0 | 0 | 0 | yes | — |
| `PromptDialogOptions` | `audit-only` | broad host document | 5 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `SaveFileDialogOptions` | `audit-only` | broad host document | 6 | 13 | 0 | 0 | 13 | 0 | 0 | 0 | yes | — |
| `FileEntry` | `audit-only` | broad host document | 3 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `FilePermissions` | `audit-only` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `FileStat` | `audit-only` | broad host document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `FileSystemUsage` | `audit-only` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `FileWalkOptions` | `audit-only` | broad host document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `FileWatchEvent` | `audit-only` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `GeoPosition` | `audit-only` | broad host document | 9 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `GeoPositionResult` | `audit-only` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `GeolocationRequestOptions` | `audit-only` | broad host document | 3 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `IpcBackendCapabilities` | `audit-only` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `IpcChannel` | `audit-only` | broad host document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `IpcMessageEvent` | `audit-only` | broad host document | 4 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `IpcTarget` | `audit-only` | broad host document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `IpcSignals` | `audit-only` | broad host document | 2 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `AppLifecycle` | `audit-only` | broad host document | 7 | 8 | 0 | 0 | 8 | 0 | 0 | 0 | yes | — |
| `Matrix` | `direct` | broad host document | 6 | 576 | 128 | 0 | 0 | 704 | 0 | 0 | yes | — |
| `MediaSessionActionDetails` | `audit-only` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `MediaSessionArtwork` | `audit-only` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `MediaSessionMetadata` | `audit-only` | broad host document | 4 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `MediaSessionPositionState` | `audit-only` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `MenuItemTemplate` | `audit-only` | broad host document | 8 | 79 | 2 | 0 | 81 | 0 | 0 | 1 | yes | — |
| `MenuSignals` | `audit-only` | broad host document | 4 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `NotificationAction` | `audit-only` | broad host document | 3 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `NotificationCapabilities` | `audit-only` | broad host document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `NotificationChannel` | `audit-only` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `NotificationRequest` | `audit-only` | broad host document | 16 | 52 | 0 | 0 | 52 | 0 | 0 | 4 | yes | — |
| `NotificationSchedule` | `audit-only` | broad host document | 2 | 7 | 0 | 0 | 7 | 0 | 0 | 2 | yes | — |
| `ScheduledNotification` | `audit-only` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ParsedAccelerator` | `audit-only` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `PlatformInfo` | `audit-only` | broad host document | 14 | 10 | 27 | 0 | 37 | 0 | 0 | 0 | yes | — |
| `Power` | `audit-only` | broad host document | 10 | 27 | 10 | 0 | 37 | 0 | 0 | 0 | yes | — |
| `PowerStatus` | `audit-only` | broad host document | 8 | 5 | 16 | 0 | 21 | 0 | 0 | 0 | yes | — |
| `PowerBatteryHealth` | `audit-only` | broad host document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ParsedProtocolUrl` | `audit-only` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ProtocolHandler` | `audit-only` | broad host document | 1 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `ScreenInfo` | `direct` | broad host document | 25 | 116 | 109 | 0 | 0 | 225 | 5 | 5 | yes | — |
| `ScreenChangeEvent` | `audit-only` | broad host document | 3 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `ScreenChangedMetrics` | `audit-only` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ScreenMode` | `audit-only` | broad host document | 5 | 0 | 10 | 0 | 10 | 0 | 0 | 0 | yes | — |
| `ScreenSignals` | `audit-only` | broad host document | 3 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `AmbientLightReading` | `audit-only` | broad host document | 4 | 0 | 3 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `MotionReading` | `audit-only` | broad host document | 6 | 6 | 32 | 0 | 38 | 0 | 0 | 0 | yes | — |
| `OrientationReading` | `audit-only` | broad host document | 8 | 19 | 30 | 0 | 49 | 0 | 0 | 0 | yes | — |
| `PressureReading` | `audit-only` | broad host document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ProximityReading` | `audit-only` | broad host document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `QuaternionReading` | `audit-only` | broad host document | 7 | 15 | 17 | 0 | 32 | 0 | 0 | 0 | yes | — |
| `RotationRateReading` | `audit-only` | broad host document | 6 | 0 | 5 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `SensorReading` | `audit-only` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SensorSubscribeOptions` | `audit-only` | broad host document | 1 | 8 | 0 | 0 | 8 | 0 | 0 | 0 | yes | — |
| `Sensors` | `audit-only` | broad host document | 11 | 11 | 0 | 0 | 11 | 0 | 0 | 0 | yes | — |
| `ShareContent` | `audit-only` | broad host document | 4 | 26 | 0 | 0 | 26 | 0 | 0 | 0 | yes | — |
| `ShareOptions` | `audit-only` | broad host document | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `ShareResult` | `audit-only` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ShareSignals` | `audit-only` | broad host document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `ShellOpenExternalOptions` | `audit-only` | broad host document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ShellOpenPathOptions` | `audit-only` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ShellShortcutLink` | `audit-only` | broad host document | 7 | 7 | 0 | 0 | 7 | 0 | 0 | 0 | yes | — |
| `ShortcutEvent` | `audit-only` | broad host document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ShortcutSignals` | `audit-only` | broad host document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `StatusBar` | `audit-only` | broad host document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `StatusBarStyleEntry` | `audit-only` | broad host document | 5 | 10 | 0 | 0 | 10 | 0 | 0 | 0 | yes | — |
| `StorageChange` | `audit-only` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `StorageMigration` | `audit-only` | broad host document | 2 | 4 | 0 | 0 | 4 | 0 | 0 | 1 | yes | — |
| `StorageNamespace` | `audit-only` | broad host document | 1 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `StorageQuota` | `audit-only` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `StorageSignals` | `audit-only` | broad host document | 1 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `TrayCapabilities` | `audit-only` | broad host document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TrayEventData` | `audit-only` | broad host document | 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TrayIcon` | `audit-only` | broad host document | 1 | 15 | 0 | 0 | 15 | 0 | 0 | 0 | yes | — |
| `TrayIconOptions` | `audit-only` | broad host document | 4 | 12 | 0 | 0 | 12 | 0 | 0 | 0 | yes | — |
| `AppUpdater` | `audit-only` | broad host document | 10 | 10 | 0 | 0 | 10 | 0 | 0 | 0 | yes | — |
| `UpdateInfo` | `audit-only` | broad host document | 9 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `UpdateProgress` | `audit-only` | broad host document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UpdaterConfig` | `audit-only` | broad host document | 3 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | yes | — |
| `UpdaterError` | `audit-only` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UpdaterSignatureConfig` | `audit-only` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UpdaterState` | `audit-only` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 7 | yes | — |
| `WebcamCaptureOptions` | `audit-only` | broad host document | 4 | 2 | 0 | 0 | 2 | 0 | 0 | 3 | yes | — |
| `WebcamPhoto` | `audit-only` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `WebcamVideo` | `audit-only` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `WebcamStream` | `audit-only` | broad host document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `BitmapFontCharRecord` | `audit-only` | broad serialization document | 9 | 12 | 0 | 0 | 12 | 0 | 0 | 0 | yes | — |
| `BitmapFontKerningRecord` | `audit-only` | broad serialization document | 3 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `BitmapFontPageRecord` | `audit-only` | broad serialization document | 2 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `BitmapFontRecord` | `audit-only` | broad serialization document | 6 | 9 | 0 | 0 | 9 | 0 | 0 | 0 | yes | — |
| `ParticleFormatCodec` | `audit-only` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | yes | — |
| `LibgdxParseOptions` | `audit-only` | broad serialization document | 1 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `LibgdxParseResult` | `audit-only` | broad serialization document | 3 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `LibgdxParsed` | `audit-only` | broad serialization document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `LibgdxParticleDocument` | `audit-only` | broad serialization document | 25 | 76 | 0 | 0 | 76 | 0 | 0 | 0 | yes | — |
| `LibgdxRangeValue` | `audit-only` | broad serialization document | 7 | 19 | 0 | 0 | 19 | 0 | 0 | 27 | yes | — |
| `LibgdxSerializeOptions` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `ParseParticleConfigOptions` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ParticleConfigParseResult` | `audit-only` | broad serialization document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ParticleDesignerParseOptions` | `audit-only` | broad serialization document | 1 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `ParticleDesignerParsed` | `audit-only` | broad serialization document | 3 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `ParticleDesignerDocument` | `audit-only` | broad serialization document | 46 | 46 | 0 | 0 | 46 | 0 | 0 | 0 | yes | — |
| `ParticleDesignerSerializeOptions` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `PixiParseResult` | `audit-only` | broad serialization document | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `PixiParsed` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ParticleSerializeResult` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SpineParsed` | `audit-only` | broad serialization document | 3 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `SpineAlphaKeyframe` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SpineParticleDocument` | `audit-only` | broad serialization document | 24 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SpineRangeValue` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SpineTintKeyframe` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `StarlingPexParseOptions` | `audit-only` | broad serialization document | 1 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `StarlingPexParseResult` | `audit-only` | broad serialization document | 3 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `StarlingPexParsed` | `audit-only` | broad serialization document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `StarlingPexColor` | `audit-only` | broad serialization document | 4 | 30 | 0 | 0 | 30 | 0 | 0 | 0 | yes | — |
| `StarlingPexDocument` | `audit-only` | broad serialization document | 38 | 79 | 0 | 0 | 79 | 0 | 0 | 0 | yes | — |
| `StarlingPexSerializeOptions` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `UnityParseOptions` | `audit-only` | broad serialization document | 1 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `UnityParsed` | `audit-only` | broad serialization document | 3 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `UnityAnimationCurve` | `audit-only` | broad serialization document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityBurst` | `audit-only` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityColor` | `audit-only` | broad serialization document | 4 | 12 | 0 | 0 | 12 | 0 | 0 | 1 | yes | — |
| `UnityColorOverLifetime` | `audit-only` | broad serialization document | 4 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `UnityCurveKey` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityEmission` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityGradient` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityGradientAlphaKey` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityGradientColorKey` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityMinMaxValue` | `audit-only` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityParticleDocument` | `audit-only` | broad serialization document | 17 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityRotationOverLifetime` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityShape` | `audit-only` | broad serialization document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnitySizeOverLifetime` | `audit-only` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnitySerializeOptions` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `GltfAccessor` | `audit-only` | broad serialization document | 7 | 18 | 0 | 0 | 18 | 0 | 0 | 0 | yes | — |
| `GltfAccessorSparse` | `audit-only` | broad serialization document | 3 | 7 | 0 | 0 | 7 | 0 | 0 | 0 | yes | — |
| `GltfAnimation` | `audit-only` | broad serialization document | 3 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `GltfAnimationChannel` | `audit-only` | broad serialization document | 2 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `GltfAnimationSampler` | `audit-only` | broad serialization document | 3 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `GltfBuffer` | `audit-only` | broad serialization document | 2 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `GltfBufferView` | `audit-only` | broad serialization document | 4 | 13 | 0 | 0 | 13 | 0 | 0 | 0 | yes | — |
| `GltfDocument` | `audit-only` | broad serialization document | 16 | 25 | 0 | 0 | 25 | 0 | 0 | 0 | yes | — |
| `GltfImage` | `audit-only` | broad serialization document | 3 | 11 | 0 | 0 | 11 | 0 | 0 | 0 | yes | — |
| `GltfImportOptions` | `audit-only` | broad serialization document | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `GltfMaterial` | `audit-only` | broad serialization document | 9 | 12 | 0 | 0 | 12 | 0 | 0 | 0 | yes | — |
| `GltfMesh` | `audit-only` | broad serialization document | 3 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `GltfMorphTarget` | `audit-only` | broad serialization document | 3 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `GltfNode` | `audit-only` | broad serialization document | 8 | 15 | 0 | 0 | 15 | 0 | 0 | 0 | yes | — |
| `GltfNormalTextureInfo` | `audit-only` | broad serialization document | 4 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `GltfOcclusionTextureInfo` | `audit-only` | broad serialization document | 4 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `GltfPbrMetallicRoughness` | `audit-only` | broad serialization document | 5 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `GltfPrimitive` | `audit-only` | broad serialization document | 5 | 19 | 0 | 0 | 19 | 0 | 0 | 0 | yes | — |
| `GltfSampler` | `audit-only` | broad serialization document | 4 | 9 | 0 | 0 | 9 | 0 | 0 | 0 | yes | — |
| `GltfScene` | `audit-only` | broad serialization document | 2 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `GltfSkin` | `audit-only` | broad serialization document | 4 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `GltfTexture` | `audit-only` | broad serialization document | 2 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `GltfTextureInfo` | `audit-only` | broad serialization document | 3 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `GltfTextureTransform` | `audit-only` | broad serialization document | 4 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `Md5Joint` | `audit-only` | broad serialization document | 9 | 26 | 0 | 0 | 26 | 0 | 0 | 0 | yes | — |
| `Md5Mesh` | `audit-only` | broad serialization document | 4 | 9 | 0 | 0 | 9 | 0 | 0 | 0 | yes | — |
| `Md5Vertex` | `audit-only` | broad serialization document | 4 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `Md5Weight` | `audit-only` | broad serialization document | 5 | 18 | 0 | 0 | 18 | 0 | 0 | 0 | yes | — |
| `ObjMaterial` | `audit-only` | broad serialization document | 11 | 8 | 11 | 0 | 19 | 0 | 0 | 0 | yes | — |
| `ObjMaterialLibrary` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `SkinInfluence` | `audit-only` | broad serialization document | 2 | 5 | 0 | 0 | 5 | 0 | 0 | 0 | yes | — |
| `ThreeDsMaterial` | `audit-only` | broad serialization document | 5 | 8 | 0 | 0 | 8 | 0 | 0 | 0 | yes | — |
| `ThreeDsMesh` | `audit-only` | broad serialization document | 5 | 14 | 0 | 0 | 14 | 0 | 0 | 0 | yes | — |
| `ShapeBitmapReference` | `audit-only` | broad serialization document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ShapeJsonFormatOptions` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `ShapeJsonParseOptions` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `AsepriteParsed` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AsepriteArrayDocument` | `audit-only` | broad serialization document | 2 | 1 | 0 | 0 | 1 | 0 | 0 | 3 | yes | — |
| `AsepriteArrayFrame` | `audit-only` | broad serialization document | 7 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `AsepriteBaseFrame` | `audit-only` | broad serialization document | 6 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | yes | — |
| `AsepriteFrameTag` | `audit-only` | broad serialization document | 5 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `AsepriteHashDocument` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | yes | — |
| `AsepriteHashFrame` | `audit-only` | broad serialization document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AsepriteLayer` | `audit-only` | broad serialization document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AsepriteMeta` | `audit-only` | broad serialization document | 9 | 9 | 0 | 0 | 9 | 0 | 0 | 0 | yes | — |
| `AsepriteRect` | `audit-only` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AsepriteSize` | `audit-only` | broad serialization document | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `AsepriteSerializeOptions` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `CocosPlistParsed` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `CocosPlistDocument` | `audit-only` | broad serialization document | 2 | 7 | 0 | 0 | 7 | 0 | 0 | 0 | yes | — |
| `CocosPlistFrame` | `audit-only` | broad serialization document | 7 | 12 | 0 | 0 | 12 | 0 | 0 | 0 | yes | — |
| `CocosPlistMetadata` | `audit-only` | broad serialization document | 3 | 7 | 0 | 0 | 7 | 0 | 0 | 0 | yes | — |
| `LibgdxAtlasParseOptions` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `LibgdxAtlasDocument` | `audit-only` | broad serialization document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `LibgdxAtlasPage` | `audit-only` | broad serialization document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `LibgdxAtlasRegion` | `audit-only` | broad serialization document | 8 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SpritesheetParseOptions` | `audit-only` | broad serialization document | 3 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `StarlingParseOptions` | `audit-only` | broad serialization document | 1 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `StarlingParsed` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `StarlingDocument` | `audit-only` | broad serialization document | 2 | 3 | 0 | 0 | 3 | 0 | 0 | 0 | yes | — |
| `StarlingSubTexture` | `audit-only` | broad serialization document | 12 | 18 | 14 | 0 | 32 | 0 | 0 | 0 | yes | — |
| `TexturePackerParsed` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TexturePackerArrayDocument` | `audit-only` | broad serialization document | 2 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `TexturePackerArrayFrame` | `audit-only` | broad serialization document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TexturePackerFrameTag` | `audit-only` | broad serialization document | 4 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `TexturePackerHashDocument` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TexturePackerHashFrame` | `audit-only` | broad serialization document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | yes | — |
| `TexturePackerMeta` | `audit-only` | broad serialization document | 7 | 8 | 0 | 0 | 8 | 0 | 0 | 0 | yes | — |
| `TexturePackerPivot` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TexturePackerRect` | `audit-only` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TexturePackerSize` | `audit-only` | broad serialization document | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `TexturePackerSerializeOptions` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `ByteReader` | `audit-only` | broad serialization document | 2 | 17 | 11 | 0 | 28 | 0 | 0 | 0 | yes | — |
| `TextureAtlasAsepriteArrayDocument` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | yes | — |
| `TextureAtlasAsepriteArrayFrame` | `audit-only` | broad serialization document | 7 | 1 | 0 | 0 | 1 | 0 | 0 | 12 | yes | — |
| `TextureAtlasAsepriteBaseFrame` | `audit-only` | broad serialization document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 12 | yes | — |
| `TextureAtlasAsepriteFrameTag` | `audit-only` | broad serialization document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TextureAtlasAsepriteHashDocument` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | yes | — |
| `TextureAtlasAsepriteHashFrame` | `audit-only` | broad serialization document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TextureAtlasAsepriteMeta` | `audit-only` | broad serialization document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TextureAtlasAsepriteRect` | `audit-only` | broad serialization document | 4 | 6 | 0 | 0 | 6 | 0 | 0 | 0 | yes | — |
| `TextureAtlasAsepriteSize` | `audit-only` | broad serialization document | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `TextureAtlasPackerParseOptions` | `audit-only` | broad serialization document | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | yes | — |
| `TextureAtlasPackerArrayDocument` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | yes | — |
| `TextureAtlasPackerArrayFrame` | `audit-only` | broad serialization document | 7 | 1 | 0 | 0 | 1 | 0 | 0 | 20 | yes | — |
| `TextureAtlasPackerFrameTag` | `audit-only` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TextureAtlasPackerHashDocument` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 3 | yes | — |
| `TextureAtlasPackerHashFrame` | `audit-only` | broad serialization document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 20 | yes | — |
| `TextureAtlasPackerMeta` | `audit-only` | broad serialization document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TextureAtlasPackerPivot` | `audit-only` | broad serialization document | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `TextureAtlasPackerRect` | `audit-only` | broad serialization document | 4 | 8 | 0 | 0 | 8 | 0 | 0 | 0 | yes | — |
| `TextureAtlasPackerSize` | `audit-only` | broad serialization document | 2 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `TextureAtlasStarlingParseOptions` | `audit-only` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TiledParseOptions` | `audit-only` | broad serialization document | 1 | 2 | 0 | 0 | 2 | 0 | 0 | 0 | yes | — |
| `XmlElement` | `audit-only` | broad serialization document | 4 | 41 | 0 | 0 | 41 | 0 | 0 | 0 | yes | — |

## Member-level escapes

| Candidate identity | Member | Reason | Source identity |
| --- | --- | --- | --- |
| `@flighthq/types:upstream/packages/types/src/Vector2.ts#Vector2` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Vector3.ts#Vector3` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Quaternion.ts#Quaternion` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Matrix3.ts#Matrix3` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Matrix4.ts#Matrix4` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Rectangle.ts#Rectangle` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/ColorTransform.ts#ColorTransform` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Aabb.ts#Aabb` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/HasTransform2D.ts#HasTransform2D` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/BoundingSphere.ts#BoundingSphere` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Camera.ts#Camera` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Capsule.ts#Capsule` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Plane.ts#Plane` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Frustum.ts#Frustum` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Obb.ts#Obb` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Ray3D.ts#Ray3D` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Billboard.ts#Billboard` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Node.ts:21` |
| `@flighthq/types:upstream/packages/types/src/Mesh.ts#Mesh` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Node.ts:21` |
| `@flighthq/types:upstream/packages/types/src/MeshGeometry.ts#MeshGeometry` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Scene.ts#Scene` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetLoaderAdapter` | `dispose` | `receiver-sensitive-method` | `upstream/packages/types/src/Assets.ts:43` |
| `@flighthq/types:upstream/packages/types/src/Assets.ts#AssetLoaderAdapter` | `load` | `receiver-sensitive-method` | `upstream/packages/types/src/Assets.ts:42` |
| `@flighthq/types:upstream/packages/types/src/CubeTexture.ts#CubeTexture` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Font.ts#Font` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphSource` | `getGlyphAtlasImage` | `receiver-sensitive-method` | `upstream/packages/types/src/GlyphSource.ts:19` |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphSource` | `getGlyphEntry` | `receiver-sensitive-method` | `upstream/packages/types/src/GlyphSource.ts:22` |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphSource` | `getGlyphKerning` | `receiver-sensitive-method` | `upstream/packages/types/src/GlyphSource.ts:25` |
| `@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphSource` | `getGlyphMetrics` | `receiver-sensitive-method` | `upstream/packages/types/src/GlyphSource.ts:27` |
| `@flighthq/types:upstream/packages/types/src/ImageResource.ts#ImageResource` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/ParticleEmitter.ts#ParticleEmitter` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Node.ts:21` |
| `@flighthq/types:upstream/packages/types/src/Sampler.ts#Sampler` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Spritesheet.ts#Spritesheet` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/SpritesheetAnimation.ts#SpritesheetAnimation` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Surface.ts#Surface` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Texture.ts#Texture` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/TextureAtlas.ts#TextureAtlas` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/TextureAtlasRegion.ts#TextureAtlasRegion` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Tileset.ts#Tileset` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/VideoTexture.ts#VideoTexture` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Ipc.ts#IpcMessageEvent` | `reply` | `receiver-sensitive-method` | `upstream/packages/types/src/Ipc.ts:40` |
| `@flighthq/types:upstream/packages/types/src/Matrix.ts#Matrix` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/types:upstream/packages/types/src/Storage.ts#StorageMigration` | `migrate` | `receiver-sensitive-method` | `upstream/packages/types/src/Storage.ts:32` |
| `@flighthq/types:upstream/packages/types/src/WebcamStream.ts#WebcamStream` | `[EntityRuntimeKey]` | `computed-symbol-member` | `upstream/packages/types/src/Entity.ts:3` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/formatRegistry.ts#ParticleFormatCodec` | `detect` | `receiver-sensitive-method` | `upstream/packages/particles-formats/src/formatRegistry.ts:18` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/formatRegistry.ts#ParticleFormatCodec` | `parseToConfig` | `receiver-sensitive-method` | `upstream/packages/particles-formats/src/formatRegistry.ts:20` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/formatRegistry.ts#ParticleFormatCodec` | `parseToDocument` | `receiver-sensitive-method` | `upstream/packages/particles-formats/src/formatRegistry.ts:23` |
| `@flighthq/particles-formats:upstream/packages/particles-formats/src/formatRegistry.ts#ParticleFormatCodec` | `serialize` | `receiver-sensitive-method` | `upstream/packages/particles-formats/src/formatRegistry.ts:29` |
