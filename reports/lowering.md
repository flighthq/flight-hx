# Lowering Audit

| Metric | Count |
| --- | ---: |
| Packages | 142 |
| Source files | 2515 |
| Candidate declarations | 13067 |
| Lowered declarations | 13067 |
| Current diagnostics | 0 |
| Proven explicit Boolean truthiness uses | 12890 |
| Proven Boolean conditional conditions | 2830 |
| Proven Boolean logical-left truthiness uses | 4758 |
| Proven Boolean logical expressions | 4522 |
| Proven numeric relations | 6109 |
| Direct Boolean truthiness uses | 12898 |
| Direct Boolean conditional expressions | 2829 |
| Direct Boolean `&&` expressions | 2019 |
| Direct Boolean `\|\|` expressions | 2502 |
| Direct numeric relations | 6109 |
| Proven indexed expressions | 10114 |
| Proven indexed reads | 6803 |
| Proven indexed writes | 3424 |
| Parked width-sensitive mixed indexed writes | 18 |
| Direct indexed reads | 7243 |
| Direct indexed writes | 3421 |
| Guarded in-bounds async-flow for-of Array reads | 8 |
| Guarded in-bounds async-flow for-in key reads | 0 |
| Direct synthetic iteration-binding Array reads | 138 |
| Direct synthetic high-arity-argument Array reads | 27 |
| Proven typed-array `set` calls | 74 |
| Direct typed-array `set` calls | 74 |
| Audited ordinary destructuring indexed reads | 284 |
| Destructuring reads with retained receiver facts | 272 |
| Direct destructuring Array reads | 272 |
| Proven destructuring reads awaiting a direct endpoint | 0 |
| Parked destructuring reads | 12 |

| Indexed receiver | Proven expressions | Proven reads | Proven writes | Direct reads | Direct writes |
| --- | ---: | ---: | ---: | ---: | ---: |
| `Array` | 4837 | 4147 | 717 | 4588 | 715 |
| `ArrayOrFloat32Array` | 56 | 13 | 43 | 13 | 43 |
| `Float32Array` | 3756 | 1734 | 2100 | 1734 | 2100 |
| `Float64Array` | 112 | 70 | 49 | 70 | 49 |
| `Int16Array` | 9 | 5 | 4 | 5 | 4 |
| `Int32Array` | 61 | 38 | 23 | 38 | 23 |
| `Int8Array` | 5 | 3 | 2 | 3 | 2 |
| `Uint16Array` | 78 | 45 | 33 | 45 | 33 |
| `Uint16ArrayOrUint32Array` | 33 | 33 | 0 | 33 | 0 |
| `Uint32Array` | 70 | 36 | 34 | 36 | 34 |
| `Uint8Array` | 369 | 330 | 40 | 329 | 39 |
| `Uint8ClampedArray` | 728 | 349 | 379 | 349 | 379 |

| Typed-array set receiver | Proven calls | Direct calls |
| --- | ---: | ---: |
| `Float32Array` | 37 | 37 |
| `Float64Array` | 0 | 0 |
| `Int16Array` | 1 | 1 |
| `Int32Array` | 0 | 0 |
| `Int8Array` | 0 | 0 |
| `Uint16Array` | 4 | 4 |
| `Uint16ArrayOrUint32Array` | 1 | 1 |
| `Uint32Array` | 7 | 7 |
| `Uint8Array` | 15 | 15 |
| `Uint8ClampedArray` | 9 | 9 |

| Destructuring emission | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| Direct Array | 28 | 233 | 11 | 272 |
| Proven, awaiting endpoint | 0 | 0 | 0 | 0 |
| Parked | 0 | 12 | 0 | 12 |

| Proven destructuring receiver | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| <code>Array</code> | 28 | 233 | 11 | 272 |
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
| `@flighthq/accessibility` | 20 | 20 | 0 | 27 | 0 | 0 | 0 |
| `@flighthq/adjustments` | 65 | 65 | 0 | 60 | 27 | 221 | 0 |
| `@flighthq/animation` | 100 | 100 | 0 | 285 | 120 | 124 | 1 |
| `@flighthq/app` | 44 | 44 | 0 | 16 | 0 | 0 | 0 |
| `@flighthq/application` | 119 | 119 | 0 | 119 | 17 | 4 | 0 |
| `@flighthq/application-gl` | 4 | 4 | 0 | 5 | 0 | 0 | 0 |
| `@flighthq/assets` | 23 | 23 | 0 | 65 | 6 | 3 | 0 |
| `@flighthq/audio` | 36 | 36 | 0 | 76 | 14 | 35 | 0 |
| `@flighthq/binpack` | 18 | 18 | 0 | 74 | 36 | 5 | 0 |
| `@flighthq/bitmap` | 183 | 183 | 0 | 820 | 633 | 770 | 8 |
| `@flighthq/bitmapfont` | 20 | 20 | 0 | 12 | 7 | 2 | 0 |
| `@flighthq/bitmapfont-formats` | 20 | 20 | 0 | 104 | 6 | 3 | 0 |
| `@flighthq/bitmaptext` | 34 | 34 | 0 | 49 | 18 | 8 | 0 |
| `@flighthq/camera` | 62 | 62 | 0 | 38 | 13 | 131 | 2 |
| `@flighthq/camera-controls` | 32 | 32 | 0 | 22 | 13 | 0 | 0 |
| `@flighthq/capture` | 10 | 10 | 0 | 9 | 2 | 0 | 0 |
| `@flighthq/clip` | 37 | 37 | 0 | 83 | 34 | 24 | 0 |
| `@flighthq/clipboard` | 38 | 38 | 0 | 36 | 2 | 0 | 0 |
| `@flighthq/clock` | 14 | 14 | 0 | 13 | 2 | 2 | 0 |
| `@flighthq/collision` | 136 | 136 | 0 | 499 | 249 | 50 | 0 |
| `@flighthq/color` | 31 | 31 | 0 | 23 | 13 | 75 | 0 |
| `@flighthq/compression` | 24 | 24 | 0 | 46 | 31 | 37 | 1 |
| `@flighthq/connectivity` | 22 | 22 | 0 | 27 | 0 | 0 | 0 |
| `@flighthq/debug` | 22 | 22 | 0 | 12 | 0 | 0 | 0 |
| `@flighthq/device` | 19 | 19 | 0 | 40 | 7 | 0 | 0 |
| `@flighthq/dialog` | 33 | 33 | 0 | 52 | 5 | 3 | 0 |
| `@flighthq/easing` | 69 | 69 | 0 | 74 | 48 | 6 | 0 |
| `@flighthq/effects` | 186 | 186 | 0 | 93 | 48 | 119 | 1 |
| `@flighthq/effects-canvas` | 104 | 104 | 0 | 82 | 30 | 63 | 0 |
| `@flighthq/effects-gl` | 298 | 298 | 0 | 122 | 26 | 34 | 0 |
| `@flighthq/effects-wgpu` | 292 | 292 | 0 | 118 | 25 | 263 | 0 |
| `@flighthq/entity` | 18 | 18 | 0 | 15 | 0 | 0 | 0 |
| `@flighthq/filesystem` | 54 | 54 | 0 | 88 | 7 | 6 | 0 |
| `@flighthq/flow` | 9 | 9 | 0 | 11 | 10 | 9 | 0 |
| `@flighthq/font` | 27 | 27 | 0 | 66 | 17 | 34 | 0 |
| `@flighthq/geolocation` | 20 | 20 | 0 | 26 | 0 | 0 | 0 |
| `@flighthq/geometry` | 397 | 397 | 0 | 437 | 262 | 875 | 12 |
| `@flighthq/glyphatlas` | 33 | 33 | 0 | 55 | 17 | 0 | 0 |
| `@flighthq/haptics` | 15 | 15 | 0 | 19 | 0 | 0 | 0 |
| `@flighthq/host-capacitor` | 33 | 33 | 0 | 62 | 3 | 2 | 0 |
| `@flighthq/host-electron` | 35 | 35 | 0 | 96 | 6 | 13 | 0 |
| `@flighthq/host-tauri` | 22 | 22 | 0 | 48 | 3 | 0 | 0 |
| `@flighthq/image` | 25 | 25 | 0 | 14 | 2 | 0 | 1 |
| `@flighthq/image-codec` | 30 | 30 | 0 | 62 | 7 | 53 | 0 |
| `@flighthq/importdiagnostics` | 3 | 3 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/input` | 69 | 69 | 0 | 101 | 13 | 8 | 0 |
| `@flighthq/interaction` | 153 | 153 | 0 | 208 | 24 | 8 | 0 |
| `@flighthq/intl` | 25 | 25 | 0 | 7 | 1 | 0 | 0 |
| `@flighthq/ipc` | 23 | 23 | 0 | 13 | 0 | 0 | 0 |
| `@flighthq/keyboard` | 27 | 27 | 0 | 25 | 4 | 0 | 0 |
| `@flighthq/layout` | 53 | 53 | 0 | 247 | 54 | 51 | 0 |
| `@flighthq/lifecycle` | 16 | 16 | 0 | 20 | 1 | 1 | 0 |
| `@flighthq/lighting` | 41 | 41 | 0 | 50 | 27 | 17 | 0 |
| `@flighthq/loader` | 39 | 39 | 0 | 92 | 14 | 1 | 0 |
| `@flighthq/log` | 91 | 91 | 0 | 114 | 14 | 2 | 0 |
| `@flighthq/materials` | 91 | 91 | 0 | 68 | 15 | 15 | 0 |
| `@flighthq/math` | 72 | 72 | 0 | 72 | 52 | 15 | 0 |
| `@flighthq/media` | 68 | 68 | 0 | 83 | 2 | 0 | 0 |
| `@flighthq/mediasession` | 12 | 12 | 0 | 11 | 0 | 0 | 0 |
| `@flighthq/menu` | 23 | 23 | 0 | 65 | 6 | 2 | 0 |
| `@flighthq/mesh` | 146 | 146 | 0 | 409 | 242 | 517 | 19 |
| `@flighthq/motionpath` | 9 | 9 | 0 | 15 | 13 | 0 | 0 |
| `@flighthq/movieclip` | 34 | 34 | 0 | 28 | 5 | 6 | 0 |
| `@flighthq/net` | 14 | 14 | 0 | 34 | 4 | 0 | 1 |
| `@flighthq/node` | 154 | 154 | 0 | 223 | 40 | 55 | 0 |
| `@flighthq/notification` | 29 | 29 | 0 | 27 | 0 | 0 | 0 |
| `@flighthq/particleemitter` | 81 | 81 | 0 | 376 | 190 | 587 | 0 |
| `@flighthq/particles` | 52 | 52 | 0 | 184 | 96 | 249 | 0 |
| `@flighthq/particles-formats` | 150 | 150 | 0 | 522 | 49 | 22 | 0 |
| `@flighthq/path` | 187 | 187 | 0 | 544 | 278 | 569 | 0 |
| `@flighthq/path-boolean` | 76 | 76 | 0 | 186 | 102 | 119 | 0 |
| `@flighthq/path-formats` | 5 | 5 | 0 | 128 | 12 | 0 | 0 |
| `@flighthq/permissions` | 34 | 34 | 0 | 37 | 0 | 0 | 0 |
| `@flighthq/physics2d` | 229 | 229 | 0 | 943 | 226 | 364 | 0 |
| `@flighthq/picking` | 49 | 49 | 0 | 68 | 11 | 58 | 0 |
| `@flighthq/platform` | 19 | 19 | 0 | 17 | 7 | 2 | 0 |
| `@flighthq/power` | 28 | 28 | 0 | 54 | 3 | 0 | 0 |
| `@flighthq/protocol` | 25 | 25 | 0 | 37 | 14 | 0 | 0 |
| `@flighthq/quadbatch` | 39 | 39 | 0 | 103 | 74 | 87 | 0 |
| `@flighthq/render` | 124 | 124 | 0 | 193 | 27 | 130 | 1 |
| `@flighthq/render-gl` | 227 | 227 | 0 | 251 | 39 | 105 | 0 |
| `@flighthq/render-wgpu` | 186 | 186 | 0 | 314 | 52 | 93 | 0 |
| `@flighthq/scene2d` | 40 | 40 | 0 | 20 | 3 | 22 | 0 |
| `@flighthq/scene2d-canvas` | 175 | 175 | 0 | 326 | 70 | 170 | 0 |
| `@flighthq/scene2d-dom` | 122 | 122 | 0 | 185 | 38 | 25 | 0 |
| `@flighthq/scene2d-formats` | 683 | 683 | 0 | 1157 | 224 | 440 | 0 |
| `@flighthq/scene2d-gl` | 216 | 216 | 0 | 375 | 112 | 234 | 3 |
| `@flighthq/scene2d-resources` | 26 | 26 | 0 | 41 | 6 | 13 | 0 |
| `@flighthq/scene2d-wgpu` | 222 | 222 | 0 | 453 | 128 | 311 | 4 |
| `@flighthq/scene3d` | 78 | 78 | 0 | 108 | 32 | 92 | 1 |
| `@flighthq/scene3d-formats` | 393 | 393 | 0 | 1292 | 485 | 634 | 3 |
| `@flighthq/scene3d-gl` | 380 | 380 | 0 | 601 | 68 | 238 | 0 |
| `@flighthq/scene3d-resources` | 70 | 70 | 0 | 137 | 17 | 16 | 0 |
| `@flighthq/scene3d-wgpu` | 408 | 408 | 0 | 618 | 90 | 541 | 3 |
| `@flighthq/screen` | 45 | 45 | 0 | 95 | 18 | 22 | 0 |
| `@flighthq/sdk` | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/sensors` | 57 | 57 | 0 | 39 | 1 | 13 | 0 |
| `@flighthq/shading` | 31 | 31 | 0 | 25 | 2 | 0 | 0 |
| `@flighthq/shape` | 110 | 110 | 0 | 252 | 100 | 337 | 0 |
| `@flighthq/shape-formats` | 20 | 20 | 0 | 64 | 5 | 5 | 0 |
| `@flighthq/share` | 19 | 19 | 0 | 34 | 3 | 1 | 1 |
| `@flighthq/shell` | 16 | 16 | 0 | 6 | 0 | 0 | 0 |
| `@flighthq/shortcut` | 55 | 55 | 0 | 61 | 3 | 0 | 0 |
| `@flighthq/signals` | 14 | 14 | 0 | 29 | 8 | 4 | 0 |
| `@flighthq/skeleton2d` | 113 | 113 | 0 | 233 | 94 | 196 | 1 |
| `@flighthq/skeleton2d-formats` | 158 | 158 | 0 | 568 | 166 | 104 | 0 |
| `@flighthq/skeleton3d` | 25 | 25 | 0 | 82 | 48 | 116 | 2 |
| `@flighthq/snapshot` | 18 | 18 | 0 | 70 | 4 | 6 | 0 |
| `@flighthq/socket` | 22 | 22 | 0 | 32 | 0 | 0 | 0 |
| `@flighthq/spatial` | 37 | 37 | 0 | 136 | 54 | 2 | 0 |
| `@flighthq/spring` | 14 | 14 | 0 | 9 | 5 | 0 | 0 |
| `@flighthq/spritesheet` | 38 | 38 | 0 | 62 | 21 | 17 | 0 |
| `@flighthq/spritesheet-formats` | 74 | 74 | 0 | 116 | 15 | 12 | 0 |
| `@flighthq/statechart` | 28 | 28 | 0 | 86 | 44 | 59 | 0 |
| `@flighthq/statusbar` | 29 | 29 | 0 | 49 | 1 | 1 | 0 |
| `@flighthq/storage` | 46 | 46 | 0 | 72 | 5 | 2 | 0 |
| `@flighthq/swf` | 453 | 453 | 0 | 1040 | 163 | 179 | 7 |
| `@flighthq/text` | 96 | 96 | 0 | 90 | 22 | 3 | 0 |
| `@flighthq/text-markup` | 51 | 51 | 0 | 114 | 9 | 11 | 0 |
| `@flighthq/textbidi` | 45 | 45 | 0 | 176 | 60 | 131 | 0 |
| `@flighthq/textinput` | 83 | 83 | 0 | 262 | 84 | 17 | 0 |
| `@flighthq/textlayout` | 73 | 73 | 0 | 230 | 115 | 46 | 0 |
| `@flighthq/textsegment` | 19 | 19 | 0 | 20 | 9 | 1 | 0 |
| `@flighthq/textshaper` | 45 | 45 | 0 | 116 | 71 | 12 | 0 |
| `@flighthq/textshaper-canvas` | 5 | 5 | 0 | 9 | 1 | 0 | 0 |
| `@flighthq/texture` | 69 | 69 | 0 | 70 | 8 | 13 | 0 |
| `@flighthq/texture-formats` | 87 | 87 | 0 | 139 | 41 | 36 | 0 |
| `@flighthq/textureatlas` | 46 | 46 | 0 | 50 | 20 | 28 | 0 |
| `@flighthq/textureatlas-formats` | 26 | 26 | 0 | 91 | 10 | 16 | 0 |
| `@flighthq/tilemap` | 25 | 25 | 0 | 44 | 34 | 6 | 0 |
| `@flighthq/tilemap-formats` | 71 | 71 | 0 | 180 | 15 | 8 | 2 |
| `@flighthq/timeline` | 30 | 30 | 0 | 32 | 5 | 0 | 0 |
| `@flighthq/tray` | 34 | 34 | 0 | 6 | 2 | 2 | 0 |
| `@flighthq/tween` | 37 | 37 | 0 | 65 | 13 | 4 | 0 |
| `@flighthq/types` | 2315 | 2315 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/updater` | 27 | 27 | 0 | 4 | 1 | 0 | 0 |
| `@flighthq/useragent` | 12 | 12 | 0 | 58 | 1 | 3 | 0 |
| `@flighthq/velocity` | 21 | 21 | 0 | 16 | 6 | 0 | 0 |
| `@flighthq/video` | 18 | 18 | 0 | 30 | 5 | 13 | 0 |
| `@flighthq/webcam` | 10 | 10 | 0 | 16 | 0 | 0 | 0 |
| `@flighthq/xml` | 18 | 18 | 0 | 68 | 22 | 0 | 0 |
