# Typed Struct Audit

Upstream commit: `5d24729f7360475e28a105ae0caeeaa2e1328260`

Eligibility is audited independently from emission. Audit-only schemas remain reflective until their audit diff is approved.

| Metric | Count |
| --- | ---: |
| Candidates | 405 |
| Eligible | 404 |
| Ineligible | 1 |
| Audit-only schemas | 0 |
| Direct schemas | 404 |
| Declared fields | 2028 |
| Bindable accesses | 10257 |
| Pending accesses | 0 |
| Directly emitted accesses | 10257 |
| Reflective survivors | 346 |
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
| `MeshGeometryOptions` | `direct` | broad scene document | 5 | 7 | 0 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `LoadSceneOptions` | `direct` | broad scene document | 1 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `ResolveSceneResourcesOptions` | `direct` | broad scene document | 2 | 1 | 0 | 2 | 0 | 3 | 0 | 0 | yes | — |
| `SceneResourceRevealOptions` | `direct` | broad scene document | 3 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `SceneMaterialTextureRegistry` | `direct` | broad scene document | 1 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `SceneResourceInFlight` | `direct` | broad scene document | 3 | 4 | 1 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `SceneResourceResolver` | `direct` | broad scene document | 5 | 20 | 1 | 1 | 0 | 22 | 0 | 0 | yes | — |
| `SceneResourceResolverOptions` | `direct` | broad scene document | 3 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `SceneResourceEvent` | `direct` | broad scene document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SceneResourceSignals` | `direct` | broad scene document | 2 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `AnimationClip` | `direct` | broad scene document | 2 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `Billboard` | `direct` | broad scene document | 12 | 1 | 3 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `Mesh` | `direct` | broad scene document | 13 | 49 | 12 | 0 | 0 | 61 | 0 | 0 | yes | — |
| `MeshGeometry` | `direct` | broad scene document | 7 | 203 | 18 | 0 | 0 | 221 | 8 | 8 | yes | — |
| `MeshSubset` | `direct` | broad scene document | 2 | 23 | 0 | 0 | 0 | 23 | 0 | 0 | yes | — |
| `VertexAttribute` | `direct` | broad scene document | 3 | 32 | 0 | 0 | 0 | 32 | 0 | 0 | yes | — |
| `VertexAttributeLayout` | `direct` | broad scene document | 2 | 53 | 0 | 0 | 0 | 53 | 0 | 0 | yes | — |
| `NodeSignals` | `direct` | broad scene document | 5 | 14 | 0 | 0 | 0 | 14 | 0 | 0 | yes | — |
| `Scene` | `direct` | broad scene document | 3 | 14 | 0 | 0 | 0 | 14 | 0 | 0 | yes | — |
| `SceneRuntime` | `direct` | broad scene document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SceneAnimationTarget` | `direct` | broad scene document | 2 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `SceneNodeTraits` | `direct` | broad scene document | 5 | 9 | 2 | 0 | 0 | 11 | 4 | 4 | yes | — |
| `EmbeddedSceneResourceRef` | `direct` | broad scene document | 4 | 2 | 0 | 0 | 0 | 2 | 8 | 8 | yes | — |
| `ExternalSceneResourceRef` | `direct` | broad scene document | 5 | 2 | 0 | 0 | 0 | 2 | 8 | 8 | yes | — |
| `Signal` | `direct` | broad scene document | 2 | 16 | 6 | 18 | 0 | 40 | 0 | 0 | yes | — |
| `SignalData` | `direct` | broad scene document | 4 | 28 | 2 | 0 | 0 | 30 | 0 | 0 | yes | — |
| `TweenManager` | `direct` | broad scene document | 3 | 16 | 0 | 0 | 0 | 16 | 0 | 0 | yes | — |
| `AssetDescriptor` | `direct` | broad asset document | 4 | 10 | 0 | 0 | 0 | 10 | 0 | 0 | yes | — |
| `AssetEntry` | `direct` | broad asset document | 4 | 13 | 6 | 0 | 0 | 19 | 0 | 0 | yes | — |
| `AssetGroupLoadOptions` | `direct` | broad asset document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `AssetLibrary` | `direct` | broad asset document | 1 | 9 | 0 | 0 | 0 | 9 | 0 | 0 | yes | — |
| `AssetLibraryRuntime` | `direct` | broad asset document | 4 | 25 | 0 | 0 | 0 | 25 | 0 | 0 | yes | — |
| `AssetLoadProgress` | `direct` | broad asset document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AssetLoaderAdapter` | `direct` | broad asset document | 2 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | yes | — |
| `AttractorForce` | `direct` | broad asset document | 7 | 6 | 0 | 0 | 0 | 6 | 1 | 1 | yes | — |
| `AudioBus` | `direct` | broad asset document | 4 | 11 | 5 | 0 | 0 | 16 | 0 | 0 | yes | — |
| `AudioMixer` | `direct` | broad asset document | 2 | 4 | 2 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `AudioMixerOptions` | `direct` | broad asset document | 2 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `AudioChannel` | `direct` | broad asset document | 8 | 24 | 16 | 0 | 0 | 40 | 0 | 0 | yes | — |
| `AudioResource` | `direct` | broad asset document | 1 | 16 | 1 | 0 | 0 | 17 | 0 | 0 | yes | — |
| `AudioResourceUrl` | `direct` | broad asset document | 2 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `BitmapFont` | `direct` | broad asset document | 5 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `BitmapFontData` | `direct` | broad asset document | 5 | 9 | 0 | 0 | 0 | 9 | 0 | 0 | yes | — |
| `BitmapFontGlyphData` | `direct` | broad asset document | 9 | 9 | 0 | 0 | 0 | 9 | 0 | 0 | yes | — |
| `BitmapFontKerningData` | `direct` | broad asset document | 3 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `BitmapFontParseOptions` | `direct` | broad asset document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `CircleCollider` | `direct` | broad asset document | 7 | 17 | 0 | 0 | 0 | 17 | 1 | 1 | yes | — |
| `CubeTexture` | `direct` | broad asset document | 3 | 27 | 1 | 0 | 0 | 28 | 0 | 0 | yes | — |
| `DragForce` | `direct` | broad asset document | 2 | 3 | 0 | 0 | 0 | 3 | 1 | 1 | yes | — |
| `Font` | `direct` | broad asset document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `FontUrl` | `direct` | broad asset document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `FontResource` | `direct` | broad asset document | 2 | 5 | 4 | 0 | 0 | 9 | 0 | 0 | yes | — |
| `GlyphAtlas` | `direct` | broad asset document | 1 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `GlyphAtlasRuntime` | `direct` | broad asset document | 15 | 58 | 14 | 0 | 0 | 72 | 0 | 0 | yes | — |
| `GlyphAtlasShelf` | `direct` | broad asset document | 3 | 5 | 1 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `GlyphEntry` | `direct` | broad asset document | 8 | 37 | 2 | 0 | 0 | 39 | 0 | 0 | yes | — |
| `GlyphRasterizedBitmap` | `direct` | broad asset document | 6 | 17 | 0 | 0 | 0 | 17 | 0 | 0 | yes | — |
| `GlyphSource` | `direct` | broad asset document | 4 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | yes | — |
| `GridSliceOptions` | `direct` | broad asset document | 12 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `ImageResource` | `direct` | broad asset document | 8 | 150 | 9 | 0 | 0 | 159 | 0 | 0 | yes | — |
| `ImageResourceCompressed` | `direct` | broad asset document | 2 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `ParticleConfigIssue` | `direct` | broad asset document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ColorKeyframe` | `direct` | broad asset document | 4 | 22 | 0 | 0 | 0 | 22 | 0 | 0 | yes | — |
| `CurveKeyframe` | `direct` | broad asset document | 2 | 11 | 0 | 0 | 0 | 11 | 0 | 0 | yes | — |
| `ParticleEmitter` | `direct` | broad asset document | 19 | 54 | 0 | 0 | 0 | 54 | 0 | 0 | yes | — |
| `ParticleEmitterData` | `direct` | broad asset document | 9 | 377 | 28 | 0 | 0 | 405 | 0 | 0 | yes | — |
| `ParticleEmitterRuntime` | `direct` | broad asset document | 34 | 4 | 2 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `ParticleEmitterConfig` | `direct` | broad asset document | 52 | 705 | 0 | 0 | 0 | 705 | 6 | 6 | yes | — |
| `ParticleEmitterSignals` | `direct` | broad asset document | 3 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `ParticleEmitterState` | `direct` | broad asset document | 13 | 157 | 23 | 56 | 0 | 236 | 0 | 0 | yes | — |
| `ParticleObjectsState` | `direct` | broad asset document | 10 | 16 | 11 | 9 | 0 | 36 | 0 | 0 | yes | — |
| `ParticleObjectsUpdateOptions` | `direct` | broad asset document | 3 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `PlaneCollider` | `direct` | broad asset document | 7 | 10 | 0 | 0 | 0 | 10 | 1 | 1 | yes | — |
| `RectangleCollider` | `direct` | broad asset document | 8 | 9 | 0 | 0 | 0 | 9 | 1 | 1 | yes | — |
| `ResourceLoader` | `direct` | broad asset document | 6 | 20 | 0 | 0 | 0 | 20 | 0 | 0 | yes | — |
| `ResourceLoaderItemSignals` | `direct` | broad asset document | 4 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `ResourceLoaderOptions` | `direct` | broad asset document | 10 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `ResourceLoadHandle` | `direct` | broad asset document | 2 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `ResourceLoadItem` | `direct` | broad asset document | 9 | 11 | 0 | 0 | 0 | 11 | 0 | 0 | yes | — |
| `ResourceLoadReport` | `direct` | broad asset document | 6 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `Sampler` | `direct` | broad asset document | 6 | 40 | 11 | 0 | 0 | 51 | 0 | 0 | yes | — |
| `SphereCollider` | `direct` | broad asset document | 8 | 22 | 0 | 0 | 0 | 22 | 1 | 1 | yes | — |
| `Spritesheet` | `direct` | broad asset document | 3 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `SpritesheetAnimation` | `direct` | broad asset document | 7 | 20 | 0 | 0 | 0 | 20 | 0 | 0 | yes | — |
| `SpritesheetAnimationData` | `direct` | broad asset document | 8 | 38 | 0 | 0 | 0 | 38 | 0 | 0 | yes | — |
| `SpritesheetData` | `direct` | broad asset document | 6 | 33 | 0 | 0 | 0 | 33 | 0 | 0 | yes | — |
| `SpritesheetFrame` | `direct` | broad asset document | 6 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `SpritesheetFrameData` | `direct` | broad asset document | 12 | 102 | 0 | 0 | 0 | 102 | 0 | 0 | yes | — |
| `SpritesheetPlayer` | `direct` | broad asset document | 9 | 30 | 35 | 0 | 0 | 65 | 0 | 0 | yes | — |
| `SpritesheetValidationDiagnostic` | `direct` | broad asset document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `Surface` | `direct` | broad asset document | 9 | 432 | 1 | 0 | 0 | 433 | 0 | 0 | yes | — |
| `Texture` | `direct` | broad asset document | 7 | 160 | 10 | 0 | 0 | 170 | 0 | 0 | yes | — |
| `TextureAtlas` | `direct` | broad asset document | 2 | 120 | 1 | 0 | 0 | 121 | 0 | 0 | yes | — |
| `TextureAtlasRegion` | `direct` | broad asset document | 14 | 248 | 10 | 0 | 0 | 258 | 0 | 0 | yes | — |
| `TextureUvTransform` | `direct` | broad asset document | 3 | 10 | 0 | 0 | 0 | 10 | 0 | 0 | yes | — |
| `Tileset` | `direct` | broad asset document | 7 | 13 | 1 | 0 | 0 | 14 | 0 | 0 | yes | — |
| `TurbulenceForce` | `direct` | broad asset document | 3 | 4 | 0 | 0 | 0 | 4 | 1 | 1 | yes | — |
| `VideoChannel` | `direct` | broad asset document | 8 | 32 | 12 | 0 | 0 | 44 | 0 | 0 | yes | — |
| `VideoResource` | `direct` | broad asset document | 1 | 32 | 1 | 0 | 0 | 33 | 0 | 0 | yes | — |
| `VideoResourceUrl` | `direct` | broad asset document | 2 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `VideoTexture` | `direct` | broad asset document | 7 | 29 | 8 | 0 | 0 | 37 | 0 | 0 | yes | — |
| `VortexForce` | `direct` | broad asset document | 10 | 9 | 0 | 0 | 0 | 9 | 1 | 1 | yes | — |
| `WindForce` | `direct` | broad asset document | 4 | 3 | 0 | 0 | 0 | 3 | 1 | 1 | yes | — |
| `App` | `direct` | broad host document | 6 | 7 | 0 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `AppLoginItem` | `direct` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AppLoginItemLike` | `direct` | broad host document | 4 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `Application` | `direct` | broad host document | 13 | 39 | 18 | 0 | 0 | 57 | 0 | 0 | yes | — |
| `ApplicationWindow` | `direct` | broad host document | 36 | 80 | 59 | 0 | 0 | 139 | 0 | 0 | yes | — |
| `WindowBounds` | `direct` | broad host document | 4 | 0 | 24 | 0 | 0 | 24 | 0 | 0 | yes | — |
| `WindowOptions` | `direct` | broad host document | 18 | 75 | 0 | 0 | 0 | 75 | 0 | 0 | yes | — |
| `ClipboardBookmark` | `direct` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ClipboardWriteItem` | `direct` | broad host document | 2 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `ClipboardWatch` | `direct` | broad host document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `Connectivity` | `direct` | broad host document | 5 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `ConnectivityReachability` | `direct` | broad host document | 2 | 0 | 8 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `ConnectivityReachabilityOptions` | `direct` | broad host document | 3 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `ConnectivityStatus` | `direct` | broad host document | 8 | 34 | 16 | 0 | 0 | 50 | 0 | 0 | yes | — |
| `DeviceInfo` | `direct` | broad host document | 25 | 0 | 50 | 0 | 0 | 50 | 0 | 0 | yes | — |
| `SafeAreaInsets` | `direct` | broad host document | 4 | 4 | 12 | 0 | 0 | 16 | 0 | 0 | yes | — |
| `FileDialogFilter` | `direct` | broad host document | 3 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `MessageDialogOptions` | `direct` | broad host document | 10 | 28 | 0 | 0 | 0 | 28 | 3 | 3 | yes | — |
| `MessageDialogResult` | `direct` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `OpenDirectoryDialogOptions` | `direct` | broad host document | 4 | 7 | 0 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `OpenFileDialogOptions` | `direct` | broad host document | 7 | 19 | 0 | 0 | 0 | 19 | 0 | 0 | yes | — |
| `PromptDialogOptions` | `direct` | broad host document | 5 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `SaveFileDialogOptions` | `direct` | broad host document | 6 | 13 | 0 | 0 | 0 | 13 | 0 | 0 | yes | — |
| `FileEntry` | `direct` | broad host document | 3 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `FilePermissions` | `direct` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `FileStat` | `direct` | broad host document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `FileSystemUsage` | `direct` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `FileWalkOptions` | `direct` | broad host document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `FileWatchEvent` | `direct` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `GeoPosition` | `direct` | broad host document | 9 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `GeoPositionResult` | `direct` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `GeolocationRequestOptions` | `direct` | broad host document | 3 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `IpcBackendCapabilities` | `direct` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `IpcChannel` | `direct` | broad host document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `IpcMessageEvent` | `direct` | broad host document | 4 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `IpcTarget` | `direct` | broad host document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `IpcSignals` | `direct` | broad host document | 2 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `AppLifecycle` | `direct` | broad host document | 7 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `Matrix` | `direct` | broad host document | 6 | 576 | 128 | 0 | 0 | 704 | 0 | 0 | yes | — |
| `MediaSessionActionDetails` | `direct` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `MediaSessionArtwork` | `direct` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `MediaSessionMetadata` | `direct` | broad host document | 4 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `MediaSessionPositionState` | `direct` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `MenuItemTemplate` | `direct` | broad host document | 8 | 79 | 2 | 0 | 0 | 81 | 1 | 1 | yes | — |
| `MenuSignals` | `direct` | broad host document | 4 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `NotificationAction` | `direct` | broad host document | 3 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `NotificationCapabilities` | `direct` | broad host document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `NotificationChannel` | `direct` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `NotificationRequest` | `direct` | broad host document | 16 | 52 | 0 | 0 | 0 | 52 | 4 | 4 | yes | — |
| `NotificationSchedule` | `direct` | broad host document | 2 | 7 | 0 | 0 | 0 | 7 | 2 | 2 | yes | — |
| `ScheduledNotification` | `direct` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ParsedAccelerator` | `direct` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `PlatformInfo` | `direct` | broad host document | 14 | 10 | 27 | 0 | 0 | 37 | 0 | 0 | yes | — |
| `Power` | `direct` | broad host document | 10 | 27 | 10 | 0 | 0 | 37 | 0 | 0 | yes | — |
| `PowerStatus` | `direct` | broad host document | 8 | 5 | 16 | 0 | 0 | 21 | 0 | 0 | yes | — |
| `PowerBatteryHealth` | `direct` | broad host document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ParsedProtocolUrl` | `direct` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ProtocolHandler` | `direct` | broad host document | 1 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `ScreenInfo` | `direct` | broad host document | 25 | 116 | 109 | 0 | 0 | 225 | 5 | 5 | yes | — |
| `ScreenChangeEvent` | `direct` | broad host document | 3 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `ScreenChangedMetrics` | `direct` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ScreenMode` | `direct` | broad host document | 5 | 0 | 10 | 0 | 0 | 10 | 0 | 0 | yes | — |
| `ScreenSignals` | `direct` | broad host document | 3 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `AmbientLightReading` | `direct` | broad host document | 4 | 0 | 3 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `MotionReading` | `direct` | broad host document | 6 | 6 | 32 | 0 | 0 | 38 | 0 | 0 | yes | — |
| `OrientationReading` | `direct` | broad host document | 8 | 19 | 30 | 0 | 0 | 49 | 0 | 0 | yes | — |
| `PressureReading` | `direct` | broad host document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ProximityReading` | `direct` | broad host document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `QuaternionReading` | `direct` | broad host document | 7 | 15 | 17 | 0 | 0 | 32 | 0 | 0 | yes | — |
| `RotationRateReading` | `direct` | broad host document | 6 | 0 | 5 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `SensorReading` | `direct` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SensorSubscribeOptions` | `direct` | broad host document | 1 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `Sensors` | `direct` | broad host document | 11 | 11 | 0 | 0 | 0 | 11 | 0 | 0 | yes | — |
| `ShareContent` | `direct` | broad host document | 4 | 26 | 0 | 0 | 0 | 26 | 0 | 0 | yes | — |
| `ShareOptions` | `direct` | broad host document | 2 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `ShareResult` | `direct` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ShareSignals` | `direct` | broad host document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `ShellOpenExternalOptions` | `direct` | broad host document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ShellOpenPathOptions` | `direct` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ShellShortcutLink` | `direct` | broad host document | 7 | 7 | 0 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `ShortcutEvent` | `direct` | broad host document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ShortcutSignals` | `direct` | broad host document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `StatusBar` | `direct` | broad host document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `StatusBarStyleEntry` | `direct` | broad host document | 5 | 10 | 0 | 0 | 0 | 10 | 0 | 0 | yes | — |
| `StorageChange` | `direct` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `StorageMigration` | `direct` | broad host document | 2 | 4 | 0 | 0 | 0 | 4 | 1 | 1 | yes | — |
| `StorageNamespace` | `direct` | broad host document | 1 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `StorageQuota` | `direct` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `StorageSignals` | `direct` | broad host document | 1 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `TrayCapabilities` | `direct` | broad host document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TrayEventData` | `direct` | broad host document | 10 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TrayIcon` | `direct` | broad host document | 1 | 15 | 0 | 0 | 0 | 15 | 0 | 0 | yes | — |
| `TrayIconOptions` | `direct` | broad host document | 4 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `AppUpdater` | `direct` | broad host document | 10 | 10 | 0 | 0 | 0 | 10 | 0 | 0 | yes | — |
| `UpdateInfo` | `direct` | broad host document | 9 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `UpdateProgress` | `direct` | broad host document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UpdaterConfig` | `direct` | broad host document | 3 | 1 | 0 | 0 | 0 | 1 | 1 | 1 | yes | — |
| `UpdaterError` | `direct` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UpdaterSignatureConfig` | `direct` | broad host document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UpdaterState` | `direct` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 7 | 7 | yes | — |
| `WebcamCaptureOptions` | `direct` | broad host document | 4 | 2 | 0 | 0 | 0 | 2 | 3 | 3 | yes | — |
| `WebcamPhoto` | `direct` | broad host document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `WebcamVideo` | `direct` | broad host document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `WebcamStream` | `direct` | broad host document | 7 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `BitmapFontCharRecord` | `direct` | broad serialization document | 9 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `BitmapFontKerningRecord` | `direct` | broad serialization document | 3 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `BitmapFontPageRecord` | `direct` | broad serialization document | 2 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `BitmapFontRecord` | `direct` | broad serialization document | 6 | 9 | 0 | 0 | 0 | 9 | 0 | 0 | yes | — |
| `ParticleFormatCodec` | `direct` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | yes | — |
| `LibgdxParseOptions` | `direct` | broad serialization document | 1 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `LibgdxParseResult` | `direct` | broad serialization document | 3 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `LibgdxParsed` | `direct` | broad serialization document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `LibgdxParticleDocument` | `direct` | broad serialization document | 25 | 76 | 0 | 0 | 0 | 76 | 0 | 0 | yes | — |
| `LibgdxRangeValue` | `direct` | broad serialization document | 7 | 19 | 0 | 0 | 0 | 19 | 27 | 27 | yes | — |
| `LibgdxSerializeOptions` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `ParseParticleConfigOptions` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ParticleConfigParseResult` | `direct` | broad serialization document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ParticleDesignerParseOptions` | `direct` | broad serialization document | 1 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `ParticleDesignerParsed` | `direct` | broad serialization document | 3 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `ParticleDesignerDocument` | `direct` | broad serialization document | 46 | 46 | 0 | 0 | 0 | 46 | 0 | 0 | yes | — |
| `ParticleDesignerSerializeOptions` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `PixiParseResult` | `direct` | broad serialization document | 2 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `PixiParsed` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ParticleSerializeResult` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SpineParsed` | `direct` | broad serialization document | 3 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `SpineAlphaKeyframe` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SpineParticleDocument` | `direct` | broad serialization document | 24 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SpineRangeValue` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SpineTintKeyframe` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `StarlingPexParseOptions` | `direct` | broad serialization document | 1 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `StarlingPexParseResult` | `direct` | broad serialization document | 3 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `StarlingPexParsed` | `direct` | broad serialization document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `StarlingPexColor` | `direct` | broad serialization document | 4 | 30 | 0 | 0 | 0 | 30 | 0 | 0 | yes | — |
| `StarlingPexDocument` | `direct` | broad serialization document | 38 | 79 | 0 | 0 | 0 | 79 | 0 | 0 | yes | — |
| `StarlingPexSerializeOptions` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `UnityParseOptions` | `direct` | broad serialization document | 1 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `UnityParsed` | `direct` | broad serialization document | 3 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `UnityAnimationCurve` | `direct` | broad serialization document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityBurst` | `direct` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityColor` | `direct` | broad serialization document | 4 | 12 | 0 | 0 | 0 | 12 | 1 | 1 | yes | — |
| `UnityColorOverLifetime` | `direct` | broad serialization document | 4 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `UnityCurveKey` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityEmission` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityGradient` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityGradientAlphaKey` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityGradientColorKey` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityMinMaxValue` | `direct` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityParticleDocument` | `direct` | broad serialization document | 17 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityRotationOverLifetime` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnityShape` | `direct` | broad serialization document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnitySizeOverLifetime` | `direct` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `UnitySerializeOptions` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `GltfAccessor` | `direct` | broad serialization document | 7 | 18 | 0 | 0 | 0 | 18 | 0 | 0 | yes | — |
| `GltfAccessorSparse` | `direct` | broad serialization document | 3 | 7 | 0 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `GltfAnimation` | `direct` | broad serialization document | 3 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `GltfAnimationChannel` | `direct` | broad serialization document | 2 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `GltfAnimationSampler` | `direct` | broad serialization document | 3 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `GltfBuffer` | `direct` | broad serialization document | 2 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `GltfBufferView` | `direct` | broad serialization document | 4 | 13 | 0 | 0 | 0 | 13 | 0 | 0 | yes | — |
| `GltfDocument` | `direct` | broad serialization document | 16 | 25 | 0 | 0 | 0 | 25 | 0 | 0 | yes | — |
| `GltfImage` | `direct` | broad serialization document | 3 | 11 | 0 | 0 | 0 | 11 | 0 | 0 | yes | — |
| `GltfImportOptions` | `direct` | broad serialization document | 2 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `GltfMaterial` | `direct` | broad serialization document | 9 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `GltfMesh` | `direct` | broad serialization document | 3 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `GltfMorphTarget` | `direct` | broad serialization document | 3 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `GltfNode` | `direct` | broad serialization document | 8 | 15 | 0 | 0 | 0 | 15 | 0 | 0 | yes | — |
| `GltfNormalTextureInfo` | `direct` | broad serialization document | 4 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `GltfOcclusionTextureInfo` | `direct` | broad serialization document | 4 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `GltfPbrMetallicRoughness` | `direct` | broad serialization document | 5 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `GltfPrimitive` | `direct` | broad serialization document | 5 | 19 | 0 | 0 | 0 | 19 | 0 | 0 | yes | — |
| `GltfSampler` | `direct` | broad serialization document | 4 | 9 | 0 | 0 | 0 | 9 | 0 | 0 | yes | — |
| `GltfScene` | `direct` | broad serialization document | 2 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `GltfSkin` | `direct` | broad serialization document | 4 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `GltfTexture` | `direct` | broad serialization document | 2 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `GltfTextureInfo` | `direct` | broad serialization document | 3 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `GltfTextureTransform` | `direct` | broad serialization document | 4 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `Md5Joint` | `direct` | broad serialization document | 9 | 26 | 0 | 0 | 0 | 26 | 0 | 0 | yes | — |
| `Md5Mesh` | `direct` | broad serialization document | 4 | 9 | 0 | 0 | 0 | 9 | 0 | 0 | yes | — |
| `Md5Vertex` | `direct` | broad serialization document | 4 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `Md5Weight` | `direct` | broad serialization document | 5 | 18 | 0 | 0 | 0 | 18 | 0 | 0 | yes | — |
| `ObjMaterial` | `direct` | broad serialization document | 11 | 8 | 11 | 0 | 0 | 19 | 0 | 0 | yes | — |
| `ObjMaterialLibrary` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `SkinInfluence` | `direct` | broad serialization document | 2 | 5 | 0 | 0 | 0 | 5 | 0 | 0 | yes | — |
| `ThreeDsMaterial` | `direct` | broad serialization document | 5 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `ThreeDsMesh` | `direct` | broad serialization document | 5 | 14 | 0 | 0 | 0 | 14 | 0 | 0 | yes | — |
| `ShapeBitmapReference` | `direct` | broad serialization document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `ShapeJsonFormatOptions` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `ShapeJsonParseOptions` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `AsepriteParsed` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AsepriteArrayDocument` | `direct` | broad serialization document | 2 | 1 | 0 | 0 | 0 | 1 | 3 | 3 | yes | — |
| `AsepriteArrayFrame` | `direct` | broad serialization document | 7 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `AsepriteBaseFrame` | `direct` | broad serialization document | 6 | 1 | 0 | 0 | 0 | 1 | 1 | 1 | yes | — |
| `AsepriteFrameTag` | `direct` | broad serialization document | 5 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `AsepriteHashDocument` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | yes | — |
| `AsepriteHashFrame` | `direct` | broad serialization document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AsepriteLayer` | `direct` | broad serialization document | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AsepriteMeta` | `direct` | broad serialization document | 9 | 9 | 0 | 0 | 0 | 9 | 0 | 0 | yes | — |
| `AsepriteRect` | `direct` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `AsepriteSize` | `direct` | broad serialization document | 2 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `AsepriteSerializeOptions` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `CocosPlistParsed` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `CocosPlistDocument` | `direct` | broad serialization document | 2 | 7 | 0 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `CocosPlistFrame` | `direct` | broad serialization document | 7 | 12 | 0 | 0 | 0 | 12 | 0 | 0 | yes | — |
| `CocosPlistMetadata` | `direct` | broad serialization document | 3 | 7 | 0 | 0 | 0 | 7 | 0 | 0 | yes | — |
| `LibgdxAtlasParseOptions` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `LibgdxAtlasDocument` | `direct` | broad serialization document | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `LibgdxAtlasPage` | `direct` | broad serialization document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `LibgdxAtlasRegion` | `direct` | broad serialization document | 8 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `SpritesheetParseOptions` | `direct` | broad serialization document | 3 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `StarlingParseOptions` | `direct` | broad serialization document | 1 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `StarlingParsed` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `StarlingDocument` | `direct` | broad serialization document | 2 | 3 | 0 | 0 | 0 | 3 | 0 | 0 | yes | — |
| `StarlingSubTexture` | `direct` | broad serialization document | 12 | 18 | 14 | 0 | 0 | 32 | 0 | 0 | yes | — |
| `TexturePackerParsed` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TexturePackerArrayDocument` | `direct` | broad serialization document | 2 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `TexturePackerArrayFrame` | `direct` | broad serialization document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TexturePackerFrameTag` | `direct` | broad serialization document | 4 | 4 | 0 | 0 | 0 | 4 | 0 | 0 | yes | — |
| `TexturePackerHashDocument` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TexturePackerHashFrame` | `direct` | broad serialization document | 6 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | yes | — |
| `TexturePackerMeta` | `direct` | broad serialization document | 7 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `TexturePackerPivot` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TexturePackerRect` | `direct` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TexturePackerSize` | `direct` | broad serialization document | 2 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `TexturePackerSerializeOptions` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `ByteReader` | `direct` | broad serialization document | 2 | 17 | 11 | 0 | 0 | 28 | 0 | 0 | yes | — |
| `TextureAtlasAsepriteArrayDocument` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | yes | — |
| `TextureAtlasAsepriteArrayFrame` | `direct` | broad serialization document | 7 | 1 | 0 | 0 | 0 | 1 | 12 | 12 | yes | — |
| `TextureAtlasAsepriteBaseFrame` | `direct` | broad serialization document | 6 | 0 | 0 | 0 | 0 | 0 | 12 | 12 | yes | — |
| `TextureAtlasAsepriteFrameTag` | `direct` | broad serialization document | 5 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TextureAtlasAsepriteHashDocument` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | yes | — |
| `TextureAtlasAsepriteHashFrame` | `direct` | broad serialization document | 6 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TextureAtlasAsepriteMeta` | `direct` | broad serialization document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TextureAtlasAsepriteRect` | `direct` | broad serialization document | 4 | 6 | 0 | 0 | 0 | 6 | 0 | 0 | yes | — |
| `TextureAtlasAsepriteSize` | `direct` | broad serialization document | 2 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `TextureAtlasPackerParseOptions` | `direct` | broad serialization document | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | yes | — |
| `TextureAtlasPackerArrayDocument` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | yes | — |
| `TextureAtlasPackerArrayFrame` | `direct` | broad serialization document | 7 | 1 | 0 | 0 | 0 | 1 | 20 | 20 | yes | — |
| `TextureAtlasPackerFrameTag` | `direct` | broad serialization document | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TextureAtlasPackerHashDocument` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | yes | — |
| `TextureAtlasPackerHashFrame` | `direct` | broad serialization document | 6 | 0 | 0 | 0 | 0 | 0 | 20 | 20 | yes | — |
| `TextureAtlasPackerMeta` | `direct` | broad serialization document | 7 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TextureAtlasPackerPivot` | `direct` | broad serialization document | 2 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `TextureAtlasPackerRect` | `direct` | broad serialization document | 4 | 8 | 0 | 0 | 0 | 8 | 0 | 0 | yes | — |
| `TextureAtlasPackerSize` | `direct` | broad serialization document | 2 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `TextureAtlasStarlingParseOptions` | `direct` | broad serialization document | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | yes | — |
| `TiledParseOptions` | `direct` | broad serialization document | 1 | 2 | 0 | 0 | 0 | 2 | 0 | 0 | yes | — |
| `XmlElement` | `direct` | broad serialization document | 4 | 41 | 0 | 0 | 0 | 41 | 0 | 0 | yes | — |

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
