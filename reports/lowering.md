# Lowering Audit

| Metric | Count |
| --- | ---: |
| Packages | 159 |
| Source files | 2926 |
| Candidate declarations | 17154 |
| Lowered declarations | 17154 |
| Current diagnostics | 0 |
| Proven explicit Boolean truthiness uses | 17751 |
| Proven Boolean conditional conditions | 3574 |
| Proven Boolean logical-left truthiness uses | 6661 |
| Proven Boolean logical expressions | 6325 |
| Proven numeric relations | 7911 |
| Direct Boolean truthiness uses | 17717 |
| Direct Boolean conditional expressions | 3566 |
| Direct Boolean `&&` expressions | 2827 |
| Direct Boolean `\|\|` expressions | 3469 |
| Direct numeric relations | 7898 |
| Proven indexed expressions | 13567 |
| Proven indexed reads | 9232 |
| Proven indexed writes | 4482 |
| Parked width-sensitive mixed indexed writes | 19 |
| Direct indexed reads | 9712 |
| Direct indexed writes | 4477 |
| Guarded in-bounds async-flow for-of Array reads | 21 |
| Guarded in-bounds async-flow for-in key reads | 0 |
| Direct synthetic iteration-binding Array reads | 205 |
| Direct synthetic high-arity-argument Array reads | 27 |
| Proven typed-array `set` calls | 98 |
| Direct typed-array `set` calls | 92 |
| Audited ordinary destructuring indexed reads | 260 |
| Destructuring reads with retained receiver facts | 248 |
| Direct destructuring Array reads | 248 |
| Proven destructuring reads awaiting a direct endpoint | 0 |
| Parked destructuring reads | 12 |

| Indexed receiver | Proven expressions | Proven reads | Proven writes | Direct reads | Direct writes |
| --- | ---: | ---: | ---: | ---: | ---: |
| `Array` | 7695 | 6285 | 1474 | 6765 | 1474 |
| `ArrayOrFloat32Array` | 58 | 13 | 45 | 15 | 45 |
| `Float32Array` | 3850 | 1805 | 2117 | 1805 | 2117 |
| `Float64Array` | 396 | 178 | 228 | 178 | 228 |
| `Int16Array` | 9 | 5 | 4 | 5 | 4 |
| `Int32Array` | 94 | 55 | 39 | 55 | 39 |
| `Int8Array` | 15 | 11 | 4 | 11 | 4 |
| `Uint16Array` | 85 | 49 | 36 | 49 | 36 |
| `Uint16ArrayOrUint32Array` | 28 | 28 | 0 | 28 | 0 |
| `Uint32Array` | 117 | 52 | 65 | 52 | 65 |
| `Uint8Array` | 451 | 384 | 68 | 382 | 63 |
| `Uint8ClampedArray` | 769 | 367 | 402 | 367 | 402 |

| Typed-array set receiver | Proven calls | Direct calls |
| --- | ---: | ---: |
| `Float32Array` | 41 | 41 |
| `Float64Array` | 0 | 0 |
| `Int16Array` | 1 | 1 |
| `Int32Array` | 0 | 0 |
| `Int8Array` | 0 | 0 |
| `Uint16Array` | 6 | 6 |
| `Uint16ArrayOrUint32Array` | 1 | 1 |
| `Uint32Array` | 7 | 7 |
| `Uint8Array` | 32 | 26 |
| `Uint8ClampedArray` | 10 | 10 |

| Destructuring emission | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| Direct Array | 30 | 200 | 18 | 248 |
| Proven, awaiting endpoint | 0 | 0 | 0 | 0 |
| Parked | 0 | 12 | 0 | 12 |

| Proven destructuring receiver | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| <code>Array</code> | 30 | 200 | 18 | 248 |
| <code>ArrayOrFloat32Array</code> | 0 | 0 | 0 | 0 |
| <code>Float32Array</code> | 0 | 0 | 0 | 0 |
| <code>Float64Array</code> | 0 | 0 | 0 | 0 |
| <code>Int16Array</code> | 0 | 0 | 0 | 0 |
| <code>Int32Array</code> | 0 | 0 | 0 | 0 |
| <code>Int8Array</code> | 0 | 0 | 0 | 0 |
| <code>Uint16Array</code> | 0 | 0 | 0 | 0 |
| <code>Uint16ArrayOrUint32Array</code> | 0 | 0 | 0 | 0 |
| <code>Uint32Array</code> | 0 | 0 | 0 | 0 |
| <code>Uint8Array</code> | 0 | 0 | 0 | 0 |
| <code>Uint8ClampedArray</code> | 0 | 0 | 0 | 0 |

| Destructuring parked reason | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| regexp-result-array | 0 | 12 | 0 | 12 |
| unproven-receiver | 0 | 0 | 0 | 0 |

| Package | Declarations | Lowered | Diagnostics | Boolean truthiness | Numeric relations | Indexed calls | Typed-array set calls |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| `@flighthq/abc` | 33 | 33 | 0 | 148 | 45 | 8 | 0 |
| `@flighthq/accessibility` | 6 | 6 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/adjustments` | 65 | 65 | 0 | 60 | 27 | 221 | 0 |
| `@flighthq/animation` | 100 | 100 | 0 | 285 | 120 | 124 | 1 |
| `@flighthq/app` | 45 | 45 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/application` | 121 | 121 | 0 | 99 | 19 | 4 | 0 |
| `@flighthq/application-gl` | 4 | 4 | 0 | 5 | 0 | 0 | 0 |
| `@flighthq/assets` | 23 | 23 | 0 | 65 | 6 | 3 | 0 |
| `@flighthq/audio` | 48 | 48 | 0 | 86 | 14 | 35 | 0 |
| `@flighthq/binpack` | 18 | 18 | 0 | 73 | 36 | 5 | 0 |
| `@flighthq/bitmap` | 209 | 209 | 0 | 829 | 630 | 761 | 7 |
| `@flighthq/bitmapfont` | 20 | 20 | 0 | 12 | 7 | 2 | 0 |
| `@flighthq/bitmapfont-formats` | 21 | 21 | 0 | 107 | 9 | 3 | 0 |
| `@flighthq/bitmaptext` | 43 | 43 | 0 | 55 | 19 | 8 | 0 |
| `@flighthq/camera` | 76 | 76 | 0 | 42 | 16 | 155 | 2 |
| `@flighthq/camera-controls` | 56 | 56 | 0 | 23 | 14 | 0 | 0 |
| `@flighthq/capture` | 13 | 13 | 0 | 12 | 2 | 0 | 0 |
| `@flighthq/clip` | 36 | 36 | 0 | 83 | 34 | 24 | 0 |
| `@flighthq/clipboard` | 27 | 27 | 0 | 1 | 0 | 0 | 0 |
| `@flighthq/clock` | 14 | 14 | 0 | 13 | 2 | 2 | 0 |
| `@flighthq/collision` | 508 | 508 | 0 | 1443 | 743 | 1067 | 0 |
| `@flighthq/color` | 32 | 32 | 0 | 23 | 13 | 75 | 0 |
| `@flighthq/command` | 40 | 40 | 0 | 47 | 21 | 24 | 0 |
| `@flighthq/compression` | 59 | 59 | 0 | 83 | 59 | 67 | 3 |
| `@flighthq/connectivity` | 13 | 13 | 0 | 14 | 0 | 0 | 0 |
| `@flighthq/debug` | 22 | 22 | 0 | 14 | 1 | 1 | 0 |
| `@flighthq/device` | 10 | 10 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/dialog` | 16 | 16 | 0 | 8 | 0 | 0 | 0 |
| `@flighthq/easing` | 69 | 69 | 0 | 74 | 48 | 6 | 0 |
| `@flighthq/effects` | 198 | 198 | 0 | 103 | 50 | 121 | 1 |
| `@flighthq/effects-canvas` | 120 | 120 | 0 | 100 | 46 | 101 | 0 |
| `@flighthq/effects-gl` | 323 | 323 | 0 | 154 | 27 | 55 | 0 |
| `@flighthq/effects-wgpu` | 334 | 334 | 0 | 164 | 29 | 291 | 0 |
| `@flighthq/encoding` | 8 | 8 | 0 | 56 | 42 | 24 | 0 |
| `@flighthq/entity` | 24 | 24 | 0 | 16 | 0 | 0 | 0 |
| `@flighthq/filesystem` | 42 | 42 | 0 | 57 | 5 | 2 | 0 |
| `@flighthq/flow` | 9 | 9 | 0 | 11 | 10 | 9 | 0 |
| `@flighthq/font` | 37 | 37 | 0 | 70 | 17 | 34 | 0 |
| `@flighthq/font-formats` | 127 | 127 | 0 | 435 | 196 | 117 | 15 |
| `@flighthq/geolocation` | 26 | 26 | 0 | 23 | 0 | 0 | 0 |
| `@flighthq/geometry` | 418 | 418 | 0 | 488 | 305 | 910 | 11 |
| `@flighthq/gizmo` | 67 | 67 | 0 | 123 | 21 | 31 | 0 |
| `@flighthq/glyphatlas` | 42 | 42 | 0 | 54 | 16 | 0 | 0 |
| `@flighthq/gui` | 150 | 150 | 0 | 238 | 25 | 8 | 0 |
| `@flighthq/haptics` | 10 | 10 | 0 | 3 | 0 | 0 | 0 |
| `@flighthq/host-capacitor` | 53 | 53 | 0 | 96 | 6 | 2 | 0 |
| `@flighthq/host-electron` | 95 | 95 | 0 | 257 | 16 | 18 | 0 |
| `@flighthq/host-tauri` | 37 | 37 | 0 | 125 | 8 | 1 | 0 |
| `@flighthq/host-web` | 327 | 327 | 0 | 752 | 40 | 15 | 3 |
| `@flighthq/image` | 46 | 46 | 0 | 38 | 3 | 10 | 1 |
| `@flighthq/image-codec` | 37 | 37 | 0 | 62 | 7 | 53 | 0 |
| `@flighthq/importdiagnostics` | 3 | 3 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/input` | 76 | 76 | 0 | 134 | 13 | 8 | 0 |
| `@flighthq/interaction` | 181 | 181 | 0 | 312 | 31 | 10 | 0 |
| `@flighthq/intl` | 25 | 25 | 0 | 7 | 1 | 0 | 0 |
| `@flighthq/ipc` | 2 | 2 | 0 | 3 | 0 | 0 | 0 |
| `@flighthq/keyboard` | 15 | 15 | 0 | 10 | 2 | 0 | 0 |
| `@flighthq/layout` | 53 | 53 | 0 | 251 | 53 | 52 | 0 |
| `@flighthq/lifecycle` | 15 | 15 | 0 | 20 | 1 | 1 | 0 |
| `@flighthq/lighting` | 41 | 41 | 0 | 51 | 27 | 17 | 0 |
| `@flighthq/loader` | 39 | 39 | 0 | 92 | 14 | 1 | 0 |
| `@flighthq/log` | 93 | 93 | 0 | 116 | 13 | 2 | 0 |
| `@flighthq/materials` | 91 | 91 | 0 | 71 | 15 | 15 | 0 |
| `@flighthq/math` | 80 | 80 | 0 | 111 | 59 | 20 | 0 |
| `@flighthq/media` | 97 | 97 | 0 | 128 | 5 | 1 | 0 |
| `@flighthq/mediasession` | 16 | 16 | 0 | 18 | 3 | 0 | 0 |
| `@flighthq/menu` | 30 | 30 | 0 | 26 | 2 | 0 | 0 |
| `@flighthq/mesh` | 152 | 152 | 0 | 460 | 256 | 477 | 21 |
| `@flighthq/midi` | 61 | 61 | 0 | 103 | 9 | 2 | 0 |
| `@flighthq/motionpath` | 9 | 9 | 0 | 15 | 13 | 0 | 0 |
| `@flighthq/movieclip` | 34 | 34 | 0 | 28 | 5 | 6 | 0 |
| `@flighthq/net` | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/node` | 161 | 161 | 0 | 245 | 43 | 55 | 0 |
| `@flighthq/notification` | 46 | 46 | 0 | 26 | 0 | 0 | 0 |
| `@flighthq/particleemitter` | 84 | 84 | 0 | 356 | 178 | 595 | 0 |
| `@flighthq/particles` | 54 | 54 | 0 | 188 | 98 | 253 | 0 |
| `@flighthq/particles-formats` | 147 | 147 | 0 | 535 | 49 | 24 | 0 |
| `@flighthq/path` | 186 | 186 | 0 | 544 | 278 | 569 | 0 |
| `@flighthq/path-boolean` | 77 | 77 | 0 | 187 | 102 | 119 | 0 |
| `@flighthq/path-formats` | 5 | 5 | 0 | 129 | 12 | 0 | 0 |
| `@flighthq/permissions` | 35 | 35 | 0 | 64 | 0 | 0 | 0 |
| `@flighthq/physics2d` | 262 | 262 | 0 | 1060 | 235 | 395 | 0 |
| `@flighthq/physics2d-abi` | 150 | 150 | 0 | 439 | 70 | 219 | 0 |
| `@flighthq/physics3d` | 549 | 549 | 0 | 1230 | 293 | 1104 | 0 |
| `@flighthq/physics3d-abi` | 149 | 149 | 0 | 519 | 77 | 284 | 0 |
| `@flighthq/picking` | 49 | 49 | 0 | 68 | 11 | 58 | 0 |
| `@flighthq/platform` | 14 | 14 | 0 | 12 | 6 | 2 | 0 |
| `@flighthq/power` | 24 | 24 | 0 | 35 | 1 | 0 | 0 |
| `@flighthq/protocol` | 21 | 21 | 0 | 35 | 13 | 0 | 0 |
| `@flighthq/quadbatch` | 39 | 39 | 0 | 103 | 74 | 87 | 0 |
| `@flighthq/registry` | 12 | 12 | 0 | 23 | 3 | 4 | 0 |
| `@flighthq/registry-catalog` | 8 | 8 | 0 | 4 | 0 | 1 | 0 |
| `@flighthq/registry-codegen` | 2 | 2 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/render` | 142 | 142 | 0 | 214 | 28 | 134 | 1 |
| `@flighthq/render-gl` | 241 | 241 | 0 | 273 | 39 | 113 | 0 |
| `@flighthq/render-wgpu` | 249 | 249 | 0 | 432 | 74 | 97 | 0 |
| `@flighthq/requirements` | 9 | 9 | 0 | 4 | 0 | 1 | 0 |
| `@flighthq/scene-document` | 200 | 200 | 0 | 803 | 82 | 64 | 0 |
| `@flighthq/scene2d` | 40 | 40 | 0 | 20 | 3 | 22 | 0 |
| `@flighthq/scene2d-canvas` | 199 | 199 | 0 | 352 | 70 | 171 | 0 |
| `@flighthq/scene2d-dom` | 123 | 123 | 0 | 192 | 38 | 25 | 0 |
| `@flighthq/scene2d-formats` | 712 | 712 | 0 | 1269 | 246 | 501 | 0 |
| `@flighthq/scene2d-gl` | 218 | 218 | 0 | 406 | 112 | 243 | 3 |
| `@flighthq/scene2d-resources` | 26 | 26 | 0 | 41 | 6 | 13 | 0 |
| `@flighthq/scene2d-wgpu` | 216 | 216 | 0 | 469 | 128 | 311 | 4 |
| `@flighthq/scene3d` | 89 | 89 | 0 | 120 | 32 | 92 | 1 |
| `@flighthq/scene3d-formats` | 399 | 399 | 0 | 1332 | 501 | 668 | 6 |
| `@flighthq/scene3d-gl` | 401 | 401 | 0 | 659 | 77 | 259 | 0 |
| `@flighthq/scene3d-resources` | 72 | 72 | 0 | 142 | 17 | 17 | 0 |
| `@flighthq/scene3d-wgpu` | 431 | 431 | 0 | 690 | 104 | 549 | 4 |
| `@flighthq/screen` | 33 | 33 | 0 | 16 | 11 | 2 | 0 |
| `@flighthq/sdk` | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/selection` | 36 | 36 | 0 | 57 | 14 | 12 | 0 |
| `@flighthq/sensors` | 54 | 54 | 0 | 38 | 1 | 13 | 0 |
| `@flighthq/shading` | 31 | 31 | 0 | 25 | 2 | 0 | 0 |
| `@flighthq/shape` | 182 | 182 | 0 | 316 | 108 | 306 | 0 |
| `@flighthq/shape-formats` | 24 | 24 | 0 | 67 | 5 | 5 | 0 |
| `@flighthq/share` | 14 | 14 | 0 | 14 | 0 | 1 | 0 |
| `@flighthq/shell` | 10 | 10 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/shortcut` | 50 | 50 | 0 | 44 | 3 | 0 | 0 |
| `@flighthq/signals` | 25 | 25 | 0 | 69 | 16 | 29 | 0 |
| `@flighthq/skeleton2d` | 115 | 115 | 0 | 237 | 97 | 196 | 1 |
| `@flighthq/skeleton2d-formats` | 182 | 182 | 0 | 608 | 176 | 108 | 0 |
| `@flighthq/skeleton3d` | 34 | 34 | 0 | 100 | 55 | 167 | 3 |
| `@flighthq/snapshot` | 18 | 18 | 0 | 70 | 4 | 6 | 0 |
| `@flighthq/socket` | 20 | 20 | 0 | 32 | 0 | 0 | 0 |
| `@flighthq/spatial` | 101 | 101 | 0 | 468 | 212 | 184 | 0 |
| `@flighthq/spring` | 23 | 23 | 0 | 14 | 6 | 0 | 0 |
| `@flighthq/spritesheet` | 38 | 38 | 0 | 62 | 21 | 17 | 0 |
| `@flighthq/spritesheet-formats` | 79 | 79 | 0 | 119 | 15 | 14 | 0 |
| `@flighthq/statechart` | 28 | 28 | 0 | 86 | 44 | 59 | 0 |
| `@flighthq/statusbar` | 23 | 23 | 0 | 24 | 1 | 1 | 0 |
| `@flighthq/storage` | 46 | 46 | 0 | 73 | 3 | 0 | 0 |
| `@flighthq/swf` | 462 | 462 | 0 | 1105 | 178 | 181 | 8 |
| `@flighthq/text` | 102 | 102 | 0 | 96 | 24 | 3 | 0 |
| `@flighthq/text-markup` | 51 | 51 | 0 | 116 | 9 | 11 | 0 |
| `@flighthq/textbidi` | 45 | 45 | 0 | 176 | 60 | 131 | 0 |
| `@flighthq/textinput` | 83 | 83 | 0 | 262 | 84 | 17 | 0 |
| `@flighthq/textlayout` | 73 | 73 | 0 | 230 | 115 | 46 | 0 |
| `@flighthq/textsegment` | 19 | 19 | 0 | 20 | 9 | 1 | 0 |
| `@flighthq/textshaper` | 47 | 47 | 0 | 118 | 71 | 12 | 0 |
| `@flighthq/textshaper-canvas` | 5 | 5 | 0 | 9 | 1 | 0 | 0 |
| `@flighthq/texture` | 72 | 72 | 0 | 70 | 8 | 13 | 0 |
| `@flighthq/texture-formats` | 87 | 87 | 0 | 139 | 41 | 36 | 0 |
| `@flighthq/textureatlas` | 46 | 46 | 0 | 50 | 20 | 28 | 0 |
| `@flighthq/textureatlas-formats` | 35 | 35 | 0 | 99 | 11 | 18 | 0 |
| `@flighthq/tilemap` | 25 | 25 | 0 | 44 | 34 | 6 | 0 |
| `@flighthq/tilemap-formats` | 75 | 75 | 0 | 211 | 17 | 8 | 2 |
| `@flighthq/timeline` | 30 | 30 | 0 | 32 | 5 | 0 | 0 |
| `@flighthq/tokens` | 32 | 32 | 0 | 45 | 5 | 3 | 0 |
| `@flighthq/tray` | 41 | 41 | 0 | 25 | 1 | 2 | 0 |
| `@flighthq/tween` | 37 | 37 | 0 | 65 | 13 | 4 | 0 |
| `@flighthq/types` | 3277 | 3277 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/updater` | 10 | 10 | 0 | 5 | 0 | 0 | 0 |
| `@flighthq/useragent` | 12 | 12 | 0 | 58 | 1 | 3 | 0 |
| `@flighthq/velocity` | 22 | 22 | 0 | 21 | 6 | 0 | 0 |
| `@flighthq/video` | 34 | 34 | 0 | 51 | 5 | 13 | 0 |
| `@flighthq/webcam` | 15 | 15 | 0 | 17 | 0 | 0 | 0 |
| `@flighthq/xml` | 19 | 19 | 0 | 70 | 23 | 0 | 0 |
