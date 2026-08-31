# Lowering Audit

| Metric | Count |
| --- | ---: |
| Packages | 157 |
| Source files | 2878 |
| Candidate declarations | 16807 |
| Lowered declarations | 16807 |
| Current diagnostics | 0 |
| Proven explicit Boolean truthiness uses | 17162 |
| Proven Boolean conditional conditions | 3485 |
| Proven Boolean logical-left truthiness uses | 6511 |
| Proven Boolean logical expressions | 6180 |
| Proven numeric relations | 7795 |
| Direct Boolean truthiness uses | 17129 |
| Direct Boolean conditional expressions | 3477 |
| Direct Boolean `&&` expressions | 2781 |
| Direct Boolean `\|\|` expressions | 3370 |
| Direct numeric relations | 7782 |
| Proven indexed expressions | 13439 |
| Proven indexed reads | 9145 |
| Proven indexed writes | 4441 |
| Parked width-sensitive mixed indexed writes | 19 |
| Direct indexed reads | 9610 |
| Direct indexed writes | 4436 |
| Guarded in-bounds async-flow for-of Array reads | 21 |
| Guarded in-bounds async-flow for-in key reads | 0 |
| Direct synthetic iteration-binding Array reads | 189 |
| Direct synthetic high-arity-argument Array reads | 27 |
| Proven typed-array `set` calls | 96 |
| Direct typed-array `set` calls | 90 |
| Audited ordinary destructuring indexed reads | 259 |
| Destructuring reads with retained receiver facts | 247 |
| Direct destructuring Array reads | 247 |
| Proven destructuring reads awaiting a direct endpoint | 0 |
| Parked destructuring reads | 12 |

| Indexed receiver | Proven expressions | Proven reads | Proven writes | Direct reads | Direct writes |
| --- | ---: | ---: | ---: | ---: | ---: |
| `Array` | 7622 | 6223 | 1463 | 6688 | 1463 |
| `ArrayOrFloat32Array` | 56 | 13 | 43 | 15 | 43 |
| `Float32Array` | 3846 | 1805 | 2113 | 1805 | 2113 |
| `Float64Array` | 396 | 178 | 228 | 178 | 228 |
| `Int16Array` | 9 | 5 | 4 | 5 | 4 |
| `Int32Array` | 83 | 51 | 32 | 51 | 32 |
| `Int8Array` | 15 | 11 | 4 | 11 | 4 |
| `Uint16Array` | 85 | 49 | 36 | 49 | 36 |
| `Uint16ArrayOrUint32Array` | 28 | 28 | 0 | 28 | 0 |
| `Uint32Array` | 117 | 52 | 65 | 52 | 65 |
| `Uint8Array` | 413 | 363 | 51 | 361 | 46 |
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
| `Uint8Array` | 30 | 24 |
| `Uint8ClampedArray` | 10 | 10 |

| Destructuring emission | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| Direct Array | 30 | 199 | 18 | 247 |
| Proven, awaiting endpoint | 0 | 0 | 0 | 0 |
| Parked | 0 | 12 | 0 | 12 |

| Proven destructuring receiver | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| <code>Array</code> | 30 | 199 | 18 | 247 |
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
| `@flighthq/bitmaptext` | 34 | 34 | 0 | 49 | 18 | 8 | 0 |
| `@flighthq/camera` | 76 | 76 | 0 | 42 | 16 | 155 | 2 |
| `@flighthq/camera-controls` | 56 | 56 | 0 | 23 | 14 | 0 | 0 |
| `@flighthq/capture` | 13 | 13 | 0 | 12 | 2 | 0 | 0 |
| `@flighthq/clip` | 36 | 36 | 0 | 83 | 34 | 24 | 0 |
| `@flighthq/clipboard` | 27 | 27 | 0 | 1 | 0 | 0 | 0 |
| `@flighthq/clock` | 14 | 14 | 0 | 13 | 2 | 2 | 0 |
| `@flighthq/collision` | 505 | 505 | 0 | 1442 | 742 | 1067 | 0 |
| `@flighthq/color` | 32 | 32 | 0 | 23 | 13 | 75 | 0 |
| `@flighthq/command` | 40 | 40 | 0 | 47 | 21 | 24 | 0 |
| `@flighthq/compression` | 30 | 30 | 0 | 55 | 36 | 39 | 1 |
| `@flighthq/connectivity` | 13 | 13 | 0 | 14 | 0 | 0 | 0 |
| `@flighthq/debug` | 22 | 22 | 0 | 14 | 1 | 1 | 0 |
| `@flighthq/device` | 10 | 10 | 0 | 1 | 0 | 0 | 0 |
| `@flighthq/dialog` | 16 | 16 | 0 | 6 | 0 | 0 | 0 |
| `@flighthq/easing` | 69 | 69 | 0 | 74 | 48 | 6 | 0 |
| `@flighthq/effects` | 186 | 186 | 0 | 94 | 48 | 119 | 1 |
| `@flighthq/effects-canvas` | 120 | 120 | 0 | 100 | 46 | 101 | 0 |
| `@flighthq/effects-gl` | 316 | 316 | 0 | 142 | 27 | 55 | 0 |
| `@flighthq/effects-wgpu` | 320 | 320 | 0 | 141 | 28 | 283 | 0 |
| `@flighthq/entity` | 19 | 19 | 0 | 14 | 0 | 0 | 0 |
| `@flighthq/filesystem` | 42 | 42 | 0 | 29 | 5 | 2 | 0 |
| `@flighthq/flow` | 9 | 9 | 0 | 11 | 10 | 9 | 0 |
| `@flighthq/font` | 37 | 37 | 0 | 70 | 17 | 34 | 0 |
| `@flighthq/font-formats` | 127 | 127 | 0 | 435 | 196 | 117 | 15 |
| `@flighthq/geolocation` | 26 | 26 | 0 | 23 | 0 | 0 | 0 |
| `@flighthq/geometry` | 418 | 418 | 0 | 488 | 305 | 910 | 11 |
| `@flighthq/gizmo` | 64 | 64 | 0 | 84 | 13 | 26 | 0 |
| `@flighthq/glyphatlas` | 39 | 39 | 0 | 52 | 15 | 0 | 0 |
| `@flighthq/gui` | 138 | 138 | 0 | 217 | 23 | 4 | 0 |
| `@flighthq/haptics` | 10 | 10 | 0 | 3 | 0 | 0 | 0 |
| `@flighthq/host-capacitor` | 57 | 57 | 0 | 96 | 6 | 2 | 0 |
| `@flighthq/host-electron` | 105 | 105 | 0 | 255 | 16 | 18 | 0 |
| `@flighthq/host-tauri` | 43 | 43 | 0 | 125 | 8 | 1 | 0 |
| `@flighthq/host-web` | 327 | 327 | 0 | 745 | 40 | 15 | 3 |
| `@flighthq/image` | 46 | 46 | 0 | 38 | 3 | 10 | 1 |
| `@flighthq/image-codec` | 37 | 37 | 0 | 62 | 7 | 53 | 0 |
| `@flighthq/importdiagnostics` | 3 | 3 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/input` | 76 | 76 | 0 | 134 | 13 | 8 | 0 |
| `@flighthq/interaction` | 152 | 152 | 0 | 208 | 24 | 8 | 0 |
| `@flighthq/intl` | 25 | 25 | 0 | 7 | 1 | 0 | 0 |
| `@flighthq/ipc` | 2 | 2 | 0 | 3 | 0 | 0 | 0 |
| `@flighthq/keyboard` | 15 | 15 | 0 | 10 | 2 | 0 | 0 |
| `@flighthq/layout` | 53 | 53 | 0 | 251 | 53 | 52 | 0 |
| `@flighthq/lifecycle` | 15 | 15 | 0 | 20 | 1 | 1 | 0 |
| `@flighthq/lighting` | 41 | 41 | 0 | 50 | 27 | 17 | 0 |
| `@flighthq/loader` | 39 | 39 | 0 | 92 | 14 | 1 | 0 |
| `@flighthq/log` | 93 | 93 | 0 | 116 | 13 | 2 | 0 |
| `@flighthq/materials` | 91 | 91 | 0 | 68 | 15 | 15 | 0 |
| `@flighthq/math` | 80 | 80 | 0 | 109 | 58 | 20 | 0 |
| `@flighthq/media` | 96 | 96 | 0 | 125 | 5 | 1 | 0 |
| `@flighthq/mediasession` | 16 | 16 | 0 | 18 | 3 | 0 | 0 |
| `@flighthq/menu` | 30 | 30 | 0 | 26 | 2 | 0 | 0 |
| `@flighthq/mesh` | 152 | 152 | 0 | 460 | 256 | 477 | 21 |
| `@flighthq/midi` | 61 | 61 | 0 | 103 | 9 | 2 | 0 |
| `@flighthq/motionpath` | 9 | 9 | 0 | 15 | 13 | 0 | 0 |
| `@flighthq/movieclip` | 34 | 34 | 0 | 28 | 5 | 6 | 0 |
| `@flighthq/net` | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/node` | 161 | 161 | 0 | 245 | 43 | 55 | 0 |
| `@flighthq/notification` | 46 | 46 | 0 | 26 | 0 | 0 | 0 |
| `@flighthq/particleemitter` | 81 | 81 | 0 | 376 | 190 | 587 | 0 |
| `@flighthq/particles` | 52 | 52 | 0 | 184 | 96 | 249 | 0 |
| `@flighthq/particles-formats` | 139 | 139 | 0 | 522 | 49 | 22 | 0 |
| `@flighthq/path` | 186 | 186 | 0 | 544 | 278 | 569 | 0 |
| `@flighthq/path-boolean` | 76 | 76 | 0 | 186 | 102 | 119 | 0 |
| `@flighthq/path-formats` | 5 | 5 | 0 | 129 | 12 | 0 | 0 |
| `@flighthq/permissions` | 37 | 37 | 0 | 64 | 0 | 0 | 0 |
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
| `@flighthq/render` | 141 | 141 | 0 | 213 | 28 | 134 | 1 |
| `@flighthq/render-gl` | 240 | 240 | 0 | 263 | 39 | 113 | 0 |
| `@flighthq/render-wgpu` | 248 | 248 | 0 | 432 | 74 | 97 | 0 |
| `@flighthq/requirements` | 9 | 9 | 0 | 4 | 0 | 1 | 0 |
| `@flighthq/scene-document` | 132 | 132 | 0 | 474 | 62 | 51 | 0 |
| `@flighthq/scene2d` | 40 | 40 | 0 | 20 | 3 | 22 | 0 |
| `@flighthq/scene2d-canvas` | 197 | 197 | 0 | 349 | 70 | 171 | 0 |
| `@flighthq/scene2d-dom` | 123 | 123 | 0 | 192 | 38 | 25 | 0 |
| `@flighthq/scene2d-formats` | 712 | 712 | 0 | 1269 | 246 | 501 | 0 |
| `@flighthq/scene2d-gl` | 220 | 220 | 0 | 406 | 112 | 243 | 3 |
| `@flighthq/scene2d-resources` | 26 | 26 | 0 | 41 | 6 | 13 | 0 |
| `@flighthq/scene2d-wgpu` | 216 | 216 | 0 | 469 | 128 | 311 | 4 |
| `@flighthq/scene3d` | 87 | 87 | 0 | 117 | 32 | 92 | 1 |
| `@flighthq/scene3d-formats` | 399 | 399 | 0 | 1332 | 501 | 668 | 6 |
| `@flighthq/scene3d-gl` | 401 | 401 | 0 | 659 | 77 | 259 | 0 |
| `@flighthq/scene3d-resources` | 72 | 72 | 0 | 142 | 17 | 17 | 0 |
| `@flighthq/scene3d-wgpu` | 431 | 431 | 0 | 690 | 104 | 549 | 4 |
| `@flighthq/screen` | 33 | 33 | 0 | 16 | 11 | 2 | 0 |
| `@flighthq/sdk` | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/selection` | 36 | 36 | 0 | 57 | 14 | 12 | 0 |
| `@flighthq/sensors` | 54 | 54 | 0 | 38 | 1 | 13 | 0 |
| `@flighthq/shading` | 31 | 31 | 0 | 25 | 2 | 0 | 0 |
| `@flighthq/shape` | 181 | 181 | 0 | 316 | 108 | 306 | 0 |
| `@flighthq/shape-formats` | 24 | 24 | 0 | 67 | 5 | 5 | 0 |
| `@flighthq/share` | 14 | 14 | 0 | 14 | 0 | 1 | 0 |
| `@flighthq/shell` | 9 | 9 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/shortcut` | 50 | 50 | 0 | 44 | 3 | 0 | 0 |
| `@flighthq/signals` | 14 | 14 | 0 | 29 | 8 | 4 | 0 |
| `@flighthq/skeleton2d` | 115 | 115 | 0 | 237 | 97 | 196 | 1 |
| `@flighthq/skeleton2d-formats` | 182 | 182 | 0 | 608 | 176 | 108 | 0 |
| `@flighthq/skeleton3d` | 34 | 34 | 0 | 100 | 55 | 167 | 3 |
| `@flighthq/snapshot` | 18 | 18 | 0 | 70 | 4 | 6 | 0 |
| `@flighthq/socket` | 19 | 19 | 0 | 32 | 0 | 0 | 0 |
| `@flighthq/spatial` | 101 | 101 | 0 | 468 | 212 | 184 | 0 |
| `@flighthq/spring` | 14 | 14 | 0 | 9 | 5 | 0 | 0 |
| `@flighthq/spritesheet` | 38 | 38 | 0 | 62 | 21 | 17 | 0 |
| `@flighthq/spritesheet-formats` | 79 | 79 | 0 | 117 | 15 | 14 | 0 |
| `@flighthq/statechart` | 28 | 28 | 0 | 86 | 44 | 59 | 0 |
| `@flighthq/statusbar` | 23 | 23 | 0 | 24 | 1 | 1 | 0 |
| `@flighthq/storage` | 46 | 46 | 0 | 73 | 3 | 0 | 0 |
| `@flighthq/swf` | 462 | 462 | 0 | 1105 | 178 | 181 | 8 |
| `@flighthq/text` | 96 | 96 | 0 | 90 | 22 | 3 | 0 |
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
| `@flighthq/textureatlas-formats` | 31 | 31 | 0 | 92 | 10 | 18 | 0 |
| `@flighthq/tilemap` | 25 | 25 | 0 | 44 | 34 | 6 | 0 |
| `@flighthq/tilemap-formats` | 71 | 71 | 0 | 182 | 17 | 8 | 2 |
| `@flighthq/timeline` | 30 | 30 | 0 | 32 | 5 | 0 | 0 |
| `@flighthq/tray` | 41 | 41 | 0 | 25 | 1 | 2 | 0 |
| `@flighthq/tween` | 37 | 37 | 0 | 65 | 13 | 4 | 0 |
| `@flighthq/types` | 3199 | 3199 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/updater` | 10 | 10 | 0 | 5 | 0 | 0 | 0 |
| `@flighthq/useragent` | 12 | 12 | 0 | 58 | 1 | 3 | 0 |
| `@flighthq/velocity` | 22 | 22 | 0 | 21 | 6 | 0 | 0 |
| `@flighthq/video` | 34 | 34 | 0 | 51 | 5 | 13 | 0 |
| `@flighthq/webcam` | 15 | 15 | 0 | 17 | 0 | 0 | 0 |
| `@flighthq/xml` | 19 | 19 | 0 | 70 | 23 | 0 | 0 |
