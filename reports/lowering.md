# Lowering Audit

| Metric | Count |
| --- | ---: |
| Packages | 159 |
| Source files | 2939 |
| Candidate declarations | 17855 |
| Lowered declarations | 17855 |
| Current diagnostics | 0 |
| Proven explicit Boolean truthiness uses | 17813 |
| Proven Boolean conditional conditions | 3576 |
| Proven Boolean logical-left truthiness uses | 6708 |
| Proven Boolean logical expressions | 6369 |
| Proven numeric relations | 7966 |
| Direct Boolean truthiness uses | 17798 |
| Direct Boolean conditional expressions | 3591 |
| Direct Boolean `&&` expressions | 2849 |
| Direct Boolean `\|\|` expressions | 3495 |
| Direct numeric relations | 7956 |
| Proven indexed expressions | 13646 |
| Proven indexed reads | 9285 |
| Proven indexed writes | 4508 |
| Parked width-sensitive mixed indexed writes | 19 |
| Direct indexed reads | 9789 |
| Direct indexed writes | 4503 |
| Guarded in-bounds async-flow for-of Array reads | 21 |
| Guarded in-bounds async-flow for-in key reads | 0 |
| Direct synthetic iteration-binding Array reads | 205 |
| Direct synthetic high-arity-argument Array reads | 27 |
| Proven typed-array `set` calls | 101 |
| Direct typed-array `set` calls | 95 |
| Audited ordinary destructuring indexed reads | 268 |
| Destructuring reads with retained receiver facts | 256 |
| Direct destructuring Array reads | 256 |
| Proven destructuring reads awaiting a direct endpoint | 0 |
| Parked destructuring reads | 12 |

| Indexed receiver | Proven expressions | Proven reads | Proven writes | Direct reads | Direct writes |
| --- | ---: | ---: | ---: | ---: | ---: |
| `Array` | 7746 | 6337 | 1473 | 6841 | 1473 |
| `ArrayOrFloat32Array` | 58 | 13 | 45 | 15 | 45 |
| `Float32Array` | 3876 | 1805 | 2143 | 1805 | 2143 |
| `Float64Array` | 396 | 178 | 228 | 178 | 228 |
| `Int16Array` | 9 | 5 | 4 | 5 | 4 |
| `Int32Array` | 94 | 55 | 39 | 55 | 39 |
| `Int8Array` | 15 | 11 | 4 | 11 | 4 |
| `Uint16Array` | 85 | 49 | 36 | 49 | 36 |
| `Uint16ArrayOrUint32Array` | 28 | 28 | 0 | 28 | 0 |
| `Uint32Array` | 119 | 53 | 66 | 53 | 66 |
| `Uint8Array` | 451 | 384 | 68 | 382 | 63 |
| `Uint8ClampedArray` | 769 | 367 | 402 | 367 | 402 |

| Typed-array set receiver | Proven calls | Direct calls |
| --- | ---: | ---: |
| `Float32Array` | 43 | 43 |
| `Float64Array` | 0 | 0 |
| `Int16Array` | 1 | 1 |
| `Int32Array` | 0 | 0 |
| `Int8Array` | 0 | 0 |
| `Uint16Array` | 6 | 6 |
| `Uint16ArrayOrUint32Array` | 1 | 1 |
| `Uint32Array` | 8 | 8 |
| `Uint8Array` | 32 | 26 |
| `Uint8ClampedArray` | 10 | 10 |

| Destructuring emission | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| Direct Array | 38 | 200 | 18 | 256 |
| Proven, awaiting endpoint | 0 | 0 | 0 | 0 |
| Parked | 0 | 12 | 0 | 12 |

| Proven destructuring receiver | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| <code>Array</code> | 38 | 200 | 18 | 256 |
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
| `@flighthq/adjustments` | 82 | 82 | 0 | 60 | 27 | 221 | 0 |
| `@flighthq/animation` | 113 | 113 | 0 | 285 | 120 | 124 | 1 |
| `@flighthq/app` | 46 | 46 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/application` | 124 | 124 | 0 | 99 | 19 | 4 | 0 |
| `@flighthq/application-gl` | 4 | 4 | 0 | 5 | 0 | 0 | 0 |
| `@flighthq/assets` | 24 | 24 | 0 | 65 | 6 | 3 | 0 |
| `@flighthq/audio` | 39 | 39 | 0 | 79 | 14 | 35 | 0 |
| `@flighthq/binpack` | 18 | 18 | 0 | 73 | 36 | 5 | 0 |
| `@flighthq/bitmap` | 194 | 194 | 0 | 817 | 630 | 761 | 7 |
| `@flighthq/bitmapfont` | 22 | 22 | 0 | 12 | 7 | 2 | 0 |
| `@flighthq/bitmapfont-formats` | 21 | 21 | 0 | 107 | 9 | 3 | 0 |
| `@flighthq/bitmaptext` | 44 | 44 | 0 | 55 | 19 | 8 | 0 |
| `@flighthq/camera` | 80 | 80 | 0 | 42 | 16 | 155 | 2 |
| `@flighthq/camera-controls` | 60 | 60 | 0 | 23 | 14 | 0 | 0 |
| `@flighthq/capture` | 13 | 13 | 0 | 12 | 2 | 0 | 0 |
| `@flighthq/clip` | 39 | 39 | 0 | 83 | 34 | 24 | 0 |
| `@flighthq/clipboard` | 28 | 28 | 0 | 1 | 0 | 0 | 0 |
| `@flighthq/clock` | 15 | 15 | 0 | 13 | 2 | 2 | 0 |
| `@flighthq/collision` | 519 | 519 | 0 | 1443 | 743 | 1067 | 0 |
| `@flighthq/color` | 32 | 32 | 0 | 23 | 13 | 75 | 0 |
| `@flighthq/command` | 47 | 47 | 0 | 47 | 21 | 24 | 0 |
| `@flighthq/compression` | 59 | 59 | 0 | 83 | 59 | 67 | 3 |
| `@flighthq/connectivity` | 14 | 14 | 0 | 14 | 0 | 0 | 0 |
| `@flighthq/debug` | 22 | 22 | 0 | 14 | 1 | 1 | 0 |
| `@flighthq/device` | 14 | 14 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/dialog` | 22 | 22 | 0 | 11 | 0 | 0 | 0 |
| `@flighthq/easing` | 69 | 69 | 0 | 74 | 48 | 6 | 0 |
| `@flighthq/effects` | 254 | 254 | 0 | 104 | 50 | 121 | 1 |
| `@flighthq/effects-canvas` | 122 | 122 | 0 | 100 | 46 | 101 | 0 |
| `@flighthq/effects-gl` | 324 | 324 | 0 | 154 | 27 | 55 | 0 |
| `@flighthq/effects-wgpu` | 338 | 338 | 0 | 164 | 29 | 291 | 0 |
| `@flighthq/encoding` | 8 | 8 | 0 | 56 | 42 | 24 | 0 |
| `@flighthq/entity` | 29 | 29 | 0 | 17 | 0 | 0 | 0 |
| `@flighthq/filesystem` | 42 | 42 | 0 | 57 | 5 | 2 | 0 |
| `@flighthq/flow` | 10 | 10 | 0 | 11 | 10 | 9 | 0 |
| `@flighthq/font` | 24 | 24 | 0 | 66 | 17 | 34 | 0 |
| `@flighthq/font-formats` | 128 | 128 | 0 | 435 | 196 | 117 | 15 |
| `@flighthq/geolocation` | 17 | 17 | 0 | 16 | 0 | 0 | 0 |
| `@flighthq/geometry` | 435 | 435 | 0 | 488 | 305 | 910 | 11 |
| `@flighthq/gizmo` | 67 | 67 | 0 | 123 | 21 | 31 | 0 |
| `@flighthq/glyphatlas` | 32 | 32 | 0 | 43 | 16 | 0 | 0 |
| `@flighthq/gui` | 150 | 150 | 0 | 238 | 25 | 8 | 0 |
| `@flighthq/haptics` | 10 | 10 | 0 | 3 | 0 | 0 | 0 |
| `@flighthq/host-capacitor` | 74 | 74 | 0 | 96 | 6 | 2 | 0 |
| `@flighthq/host-electron` | 186 | 186 | 0 | 259 | 16 | 18 | 0 |
| `@flighthq/host-tauri` | 53 | 53 | 0 | 129 | 8 | 1 | 0 |
| `@flighthq/host-web` | 389 | 389 | 0 | 783 | 44 | 25 | 4 |
| `@flighthq/image` | 37 | 37 | 0 | 21 | 2 | 0 | 0 |
| `@flighthq/image-codec` | 37 | 37 | 0 | 62 | 7 | 53 | 0 |
| `@flighthq/importdiagnostics` | 3 | 3 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/input` | 81 | 81 | 0 | 134 | 13 | 8 | 0 |
| `@flighthq/interaction` | 186 | 186 | 0 | 312 | 31 | 10 | 0 |
| `@flighthq/intl` | 25 | 25 | 0 | 7 | 1 | 0 | 0 |
| `@flighthq/ipc` | 6 | 6 | 0 | 3 | 0 | 0 | 0 |
| `@flighthq/keyboard` | 16 | 16 | 0 | 10 | 2 | 0 | 0 |
| `@flighthq/layout` | 54 | 54 | 0 | 251 | 53 | 52 | 0 |
| `@flighthq/lifecycle` | 17 | 17 | 0 | 20 | 1 | 1 | 0 |
| `@flighthq/lighting` | 51 | 51 | 0 | 62 | 27 | 17 | 0 |
| `@flighthq/loader` | 40 | 40 | 0 | 92 | 14 | 1 | 0 |
| `@flighthq/log` | 94 | 94 | 0 | 116 | 13 | 2 | 0 |
| `@flighthq/materials` | 101 | 101 | 0 | 71 | 15 | 15 | 0 |
| `@flighthq/math` | 80 | 80 | 0 | 111 | 59 | 20 | 0 |
| `@flighthq/media` | 101 | 101 | 0 | 133 | 9 | 1 | 0 |
| `@flighthq/mediasession` | 17 | 17 | 0 | 18 | 3 | 0 | 0 |
| `@flighthq/menu` | 32 | 32 | 0 | 26 | 2 | 0 | 0 |
| `@flighthq/mesh` | 153 | 153 | 0 | 460 | 256 | 477 | 21 |
| `@flighthq/midi` | 67 | 67 | 0 | 103 | 9 | 2 | 0 |
| `@flighthq/motionpath` | 10 | 10 | 0 | 15 | 13 | 0 | 0 |
| `@flighthq/movieclip` | 36 | 36 | 0 | 28 | 5 | 6 | 0 |
| `@flighthq/net` | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/node` | 164 | 164 | 0 | 245 | 43 | 55 | 0 |
| `@flighthq/notification` | 48 | 48 | 0 | 26 | 0 | 0 | 0 |
| `@flighthq/particleemitter` | 85 | 85 | 0 | 356 | 178 | 595 | 0 |
| `@flighthq/particles` | 58 | 58 | 0 | 188 | 98 | 253 | 0 |
| `@flighthq/particles-formats` | 147 | 147 | 0 | 535 | 49 | 24 | 0 |
| `@flighthq/path` | 190 | 190 | 0 | 545 | 278 | 569 | 0 |
| `@flighthq/path-boolean` | 78 | 78 | 0 | 187 | 102 | 119 | 0 |
| `@flighthq/path-formats` | 5 | 5 | 0 | 129 | 12 | 0 | 0 |
| `@flighthq/permissions` | 35 | 35 | 0 | 64 | 0 | 0 | 0 |
| `@flighthq/physics2d` | 285 | 285 | 0 | 1060 | 235 | 395 | 0 |
| `@flighthq/physics2d-abi` | 156 | 156 | 0 | 439 | 70 | 219 | 0 |
| `@flighthq/physics3d` | 582 | 582 | 0 | 1230 | 293 | 1104 | 0 |
| `@flighthq/physics3d-abi` | 155 | 155 | 0 | 519 | 77 | 284 | 0 |
| `@flighthq/picking` | 50 | 50 | 0 | 68 | 11 | 58 | 0 |
| `@flighthq/platform` | 15 | 15 | 0 | 12 | 6 | 2 | 0 |
| `@flighthq/power` | 25 | 25 | 0 | 35 | 1 | 0 | 0 |
| `@flighthq/protocol` | 22 | 22 | 0 | 35 | 13 | 0 | 0 |
| `@flighthq/quadbatch` | 41 | 41 | 0 | 103 | 74 | 87 | 0 |
| `@flighthq/registry` | 15 | 15 | 0 | 23 | 3 | 4 | 0 |
| `@flighthq/registry-catalog` | 9 | 9 | 0 | 4 | 0 | 1 | 0 |
| `@flighthq/registry-codegen` | 3 | 3 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/render` | 140 | 140 | 0 | 218 | 29 | 134 | 1 |
| `@flighthq/render-gl` | 251 | 251 | 0 | 273 | 39 | 113 | 0 |
| `@flighthq/render-wgpu` | 264 | 264 | 0 | 432 | 74 | 97 | 0 |
| `@flighthq/requirements` | 10 | 10 | 0 | 4 | 0 | 1 | 0 |
| `@flighthq/scene-document` | 206 | 206 | 0 | 790 | 82 | 64 | 0 |
| `@flighthq/scene2d` | 50 | 50 | 0 | 20 | 3 | 22 | 0 |
| `@flighthq/scene2d-canvas` | 217 | 217 | 0 | 384 | 85 | 187 | 0 |
| `@flighthq/scene2d-dom` | 134 | 134 | 0 | 206 | 43 | 38 | 0 |
| `@flighthq/scene2d-formats` | 717 | 717 | 0 | 1269 | 246 | 501 | 0 |
| `@flighthq/scene2d-gl` | 223 | 223 | 0 | 424 | 116 | 264 | 3 |
| `@flighthq/scene2d-resources` | 29 | 29 | 0 | 41 | 6 | 13 | 0 |
| `@flighthq/scene2d-wgpu` | 220 | 220 | 0 | 485 | 130 | 332 | 4 |
| `@flighthq/scene3d` | 102 | 102 | 0 | 133 | 39 | 97 | 2 |
| `@flighthq/scene3d-formats` | 399 | 399 | 0 | 1332 | 501 | 664 | 6 |
| `@flighthq/scene3d-gl` | 412 | 412 | 0 | 683 | 85 | 263 | 1 |
| `@flighthq/scene3d-resources` | 76 | 76 | 0 | 142 | 17 | 17 | 0 |
| `@flighthq/scene3d-wgpu` | 442 | 442 | 0 | 712 | 111 | 552 | 5 |
| `@flighthq/screen` | 37 | 37 | 0 | 16 | 11 | 2 | 0 |
| `@flighthq/sdk` | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/selection` | 37 | 37 | 0 | 57 | 14 | 12 | 0 |
| `@flighthq/sensors` | 62 | 62 | 0 | 38 | 1 | 13 | 0 |
| `@flighthq/shading` | 42 | 42 | 0 | 25 | 2 | 0 | 0 |
| `@flighthq/shape` | 190 | 190 | 0 | 316 | 108 | 306 | 0 |
| `@flighthq/shape-formats` | 24 | 24 | 0 | 67 | 5 | 5 | 0 |
| `@flighthq/share` | 15 | 15 | 0 | 14 | 0 | 1 | 0 |
| `@flighthq/shell` | 10 | 10 | 0 | 2 | 0 | 0 | 0 |
| `@flighthq/shortcut` | 51 | 51 | 0 | 44 | 3 | 0 | 0 |
| `@flighthq/signals` | 27 | 27 | 0 | 69 | 16 | 29 | 0 |
| `@flighthq/skeleton2d` | 123 | 123 | 0 | 237 | 96 | 196 | 1 |
| `@flighthq/skeleton2d-formats` | 188 | 188 | 0 | 608 | 176 | 108 | 0 |
| `@flighthq/skeleton3d` | 35 | 35 | 0 | 100 | 55 | 167 | 3 |
| `@flighthq/snapshot` | 18 | 18 | 0 | 70 | 4 | 6 | 0 |
| `@flighthq/socket` | 21 | 21 | 0 | 32 | 0 | 0 | 0 |
| `@flighthq/spatial` | 106 | 106 | 0 | 468 | 212 | 184 | 0 |
| `@flighthq/spring` | 28 | 28 | 0 | 14 | 6 | 0 | 0 |
| `@flighthq/spritesheet` | 45 | 45 | 0 | 62 | 21 | 17 | 0 |
| `@flighthq/spritesheet-formats` | 79 | 79 | 0 | 119 | 15 | 14 | 0 |
| `@flighthq/statechart` | 30 | 30 | 0 | 86 | 44 | 59 | 0 |
| `@flighthq/statusbar` | 25 | 25 | 0 | 24 | 1 | 1 | 0 |
| `@flighthq/storage` | 47 | 47 | 0 | 73 | 3 | 0 | 0 |
| `@flighthq/swf` | 466 | 466 | 0 | 1107 | 178 | 181 | 8 |
| `@flighthq/text` | 105 | 105 | 0 | 96 | 24 | 3 | 0 |
| `@flighthq/text-markup` | 52 | 52 | 0 | 116 | 9 | 11 | 0 |
| `@flighthq/textbidi` | 46 | 46 | 0 | 176 | 60 | 131 | 0 |
| `@flighthq/textinput` | 85 | 85 | 0 | 262 | 84 | 17 | 0 |
| `@flighthq/textlayout` | 78 | 78 | 0 | 230 | 115 | 46 | 0 |
| `@flighthq/textsegment` | 21 | 21 | 0 | 19 | 9 | 1 | 0 |
| `@flighthq/textshaper` | 53 | 53 | 0 | 121 | 71 | 12 | 0 |
| `@flighthq/textshaper-canvas` | 6 | 6 | 0 | 9 | 1 | 0 | 0 |
| `@flighthq/texture` | 77 | 77 | 0 | 70 | 8 | 13 | 0 |
| `@flighthq/texture-formats` | 87 | 87 | 0 | 139 | 41 | 36 | 0 |
| `@flighthq/textureatlas` | 48 | 48 | 0 | 50 | 20 | 28 | 0 |
| `@flighthq/textureatlas-formats` | 35 | 35 | 0 | 99 | 11 | 18 | 0 |
| `@flighthq/tilemap` | 27 | 27 | 0 | 44 | 34 | 6 | 0 |
| `@flighthq/tilemap-formats` | 75 | 75 | 0 | 211 | 17 | 8 | 2 |
| `@flighthq/timeline` | 32 | 32 | 0 | 32 | 5 | 0 | 0 |
| `@flighthq/tokens` | 34 | 34 | 0 | 45 | 5 | 3 | 0 |
| `@flighthq/tray` | 44 | 44 | 0 | 26 | 1 | 2 | 0 |
| `@flighthq/tween` | 40 | 40 | 0 | 69 | 13 | 4 | 0 |
| `@flighthq/types` | 3319 | 3319 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/updater` | 10 | 10 | 0 | 5 | 0 | 0 | 0 |
| `@flighthq/useragent` | 12 | 12 | 0 | 58 | 1 | 3 | 0 |
| `@flighthq/velocity` | 23 | 23 | 0 | 21 | 6 | 0 | 0 |
| `@flighthq/video` | 21 | 21 | 0 | 39 | 5 | 13 | 0 |
| `@flighthq/webcam` | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/xml` | 19 | 19 | 0 | 70 | 23 | 0 | 0 |
