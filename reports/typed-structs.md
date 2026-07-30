# Typed Struct Audit

Upstream commit: `5d24729f7360475e28a105ae0caeeaa2e1328260`

Eligibility is audited independently from emission. Audit-only schemas remain reflective until their audit diff is approved.

| Metric | Count |
| --- | ---: |
| Candidates | 35 |
| Eligible | 34 |
| Ineligible | 1 |
| Audit-only schemas | 0 |
| Direct schemas | 34 |
| Declared fields | 151 |
| Bindable accesses | 2284 |
| Pending accesses | 0 |
| Directly emitted accesses | 2284 |
| Reflective survivors | 0 |
| Dynamic escapes | 2 |

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
