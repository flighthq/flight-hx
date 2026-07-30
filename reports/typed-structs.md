# Typed Struct Audit

Upstream commit: `5d24729f7360475e28a105ae0caeeaa2e1328260`

Eligibility is audited independently from emission. Audit-only schemas remain reflective until their audit diff is approved.

| Metric | Count |
| --- | ---: |
| Candidates | 55 |
| Eligible | 54 |
| Ineligible | 1 |
| Audit-only schemas | 20 |
| Direct schemas | 34 |
| Declared fields | 243 |
| Bindable accesses | 3271 |
| Pending accesses | 987 |
| Directly emitted accesses | 2284 |
| Reflective survivors | 0 |
| Dynamic escapes | 154 |

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
| `Aabb` | `audit-only` | 3D axis-aligned bounds entity | 2 | 22 | 0 | 0 | 22 | 0 | 0 | 0 | yes | — |
| `AabbLike` | `audit-only` | structural 3D axis-aligned bounds carrier | 2 | 230 | 0 | 0 | 230 | 0 | 0 | 0 | yes | — |
| `HasTransform3D` | `audit-only` | authored node 3D transform aggregate | 3 | 12 | 3 | 0 | 15 | 0 | 0 | 0 | yes | — |
| `HasTransform3DRuntime` | `audit-only` | cached node 3D transform aggregate | 4 | 15 | 9 | 0 | 24 | 0 | 0 | 28 | yes | — |
| `HasTransform2D` | `audit-only` | authored node 2D transform aggregate | 9 | 43 | 38 | 0 | 81 | 0 | 0 | 7 | yes | — |
| `HasTransform2DRuntime` | `audit-only` | cached node 2D transform aggregate | 6 | 17 | 10 | 0 | 27 | 0 | 0 | 50 | yes | — |
| `HasBoundsRectangleRuntime` | `audit-only` | cached node rectangle-bounds aggregate | 5 | 7 | 6 | 1 | 14 | 0 | 0 | 53 | yes | — |
| `BoundingSphere` | `audit-only` | 3D bounding-sphere aggregate | 2 | 134 | 16 | 0 | 150 | 0 | 0 | 0 | yes | — |
| `Camera` | `audit-only` | 3D camera aggregate | 6 | 34 | 3 | 0 | 37 | 0 | 0 | 0 | yes | — |
| `PerspectiveProjection` | `audit-only` | perspective-camera projection aggregate | 3 | 7 | 0 | 0 | 7 | 0 | 0 | 7 | yes | — |
| `OrthographicProjection` | `audit-only` | orthographic-camera projection aggregate | 3 | 6 | 0 | 0 | 6 | 0 | 0 | 7 | yes | — |
| `Camera2D` | `audit-only` | 2D camera hot-state aggregate | 6 | 12 | 5 | 0 | 17 | 0 | 0 | 0 | yes | — |
| `Camera2DFollowOptions` | `audit-only` | 2D camera follow aggregate | 4 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `Camera2DOptions` | `audit-only` | 2D camera construction aggregate | 4 | 4 | 0 | 0 | 4 | 0 | 0 | 0 | yes | — |
| `Capsule` | `audit-only` | 3D capsule-bounds aggregate | 7 | 38 | 7 | 0 | 45 | 0 | 0 | 0 | yes | — |
| `Plane` | `audit-only` | 3D plane aggregate | 4 | 61 | 36 | 0 | 97 | 0 | 0 | 0 | yes | — |
| `Frustum` | `audit-only` | 3D frustum aggregate | 6 | 24 | 0 | 0 | 24 | 0 | 0 | 0 | yes | — |
| `SpatialAabb` | `audit-only` | 2D spatial-index bounds aggregate | 4 | 30 | 4 | 0 | 34 | 0 | 0 | 0 | yes | — |
| `Obb` | `audit-only` | 3D oriented-bounds aggregate | 10 | 44 | 20 | 0 | 64 | 0 | 0 | 0 | yes | — |
| `Ray3D` | `audit-only` | 3D ray aggregate | 2 | 85 | 0 | 0 | 85 | 0 | 0 | 0 | yes | — |
