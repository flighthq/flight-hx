# Lowering Audit

| Metric | Count |
| --- | ---: |
| Packages | 140 |
| Source files | 2363 |
| Candidate declarations | 11421 |
| Lowered declarations | 11421 |
| Current diagnostics | 0 |
| Proven explicit Boolean truthiness uses | 10997 |
| Proven Boolean conditional conditions | 2413 |
| Proven Boolean logical-left truthiness uses | 3939 |
| Proven Boolean logical expressions | 3739 |
| Proven numeric relations | 5328 |
| Direct Boolean truthiness uses | 11001 |
| Direct Boolean conditional expressions | 2414 |
| Direct Boolean `&&` expressions | 1712 |
| Direct Boolean `\|\|` expressions | 2025 |
| Direct numeric relations | 5328 |
| Proven indexed expressions | 8986 |
| Proven indexed reads | 5845 |
| Proven indexed writes | 3264 |
| Parked width-sensitive mixed indexed writes | 16 |
| Direct indexed reads | 6249 |
| Direct indexed writes | 3261 |
| Direct synthetic iteration-binding Array reads | 112 |
| Direct synthetic high-arity-argument Array reads | 27 |
| Audited ordinary destructuring indexed reads | 274 |
| Destructuring reads with retained receiver facts | 262 |
| Direct destructuring Array reads | 262 |
| Proven destructuring reads awaiting a direct endpoint | 0 |
| Parked destructuring reads | 12 |

| Indexed receiver | Proven expressions | Proven reads | Proven writes | Direct reads | Direct writes |
| --- | ---: | ---: | ---: | ---: | ---: |
| `Array` | 4030 | 3452 | 601 | 3857 | 599 |
| `ArrayOrFloat32Array` | 47 | 8 | 39 | 8 | 39 |
| `Float32Array` | 3574 | 1568 | 2078 | 1568 | 2078 |
| `Float64Array` | 100 | 70 | 57 | 70 | 57 |
| `Int16Array` | 9 | 5 | 4 | 5 | 4 |
| `Int32Array` | 39 | 23 | 16 | 23 | 16 |
| `Int8Array` | 0 | 0 | 0 | 0 | 0 |
| `Uint16Array` | 77 | 45 | 32 | 45 | 32 |
| `Uint16ArrayOrUint32Array` | 29 | 29 | 0 | 29 | 0 |
| `Uint32Array` | 46 | 20 | 26 | 20 | 26 |
| `Uint8Array` | 303 | 268 | 36 | 267 | 35 |
| `Uint8ClampedArray` | 732 | 357 | 375 | 357 | 375 |

| Destructuring emission | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| Direct Array | 28 | 223 | 11 | 262 |
| Proven, awaiting endpoint | 0 | 0 | 0 | 0 |
| Parked | 0 | 12 | 0 | 12 |

| Proven destructuring receiver | Assignment reads | Declaration reads | Parameter reads | Total |
| --- | ---: | ---: | ---: | ---: |
| <code>Array</code> | 28 | 223 | 11 | 262 |
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

| Package | Declarations | Lowered | Diagnostics | Boolean truthiness | Numeric relations | Indexed calls |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| `@flighthq/abc` | 19 | 19 | 0 | 130 | 37 | 2 |
| `@flighthq/accessibility` | 20 | 20 | 0 | 27 | 0 | 0 |
| `@flighthq/adjustments` | 65 | 65 | 0 | 60 | 27 | 221 |
| `@flighthq/animation` | 100 | 100 | 0 | 285 | 120 | 124 |
| `@flighthq/app` | 44 | 44 | 0 | 16 | 0 | 0 |
| `@flighthq/application` | 119 | 119 | 0 | 119 | 17 | 4 |
| `@flighthq/application-gl` | 4 | 4 | 0 | 5 | 0 | 0 |
| `@flighthq/assets` | 23 | 23 | 0 | 65 | 6 | 3 |
| `@flighthq/audio` | 20 | 20 | 0 | 51 | 8 | 33 |
| `@flighthq/binpack` | 18 | 18 | 0 | 74 | 36 | 5 |
| `@flighthq/bitmap` | 183 | 183 | 0 | 820 | 633 | 770 |
| `@flighthq/bitmapfont` | 20 | 20 | 0 | 12 | 7 | 2 |
| `@flighthq/bitmapfont-formats` | 20 | 20 | 0 | 104 | 6 | 3 |
| `@flighthq/bitmaptext` | 34 | 34 | 0 | 49 | 18 | 8 |
| `@flighthq/camera` | 61 | 61 | 0 | 38 | 13 | 131 |
| `@flighthq/camera-controls` | 32 | 32 | 0 | 22 | 13 | 0 |
| `@flighthq/capture` | 10 | 10 | 0 | 8 | 2 | 0 |
| `@flighthq/clip` | 37 | 37 | 0 | 83 | 34 | 24 |
| `@flighthq/clipboard` | 38 | 38 | 0 | 36 | 2 | 0 |
| `@flighthq/clock` | 14 | 14 | 0 | 13 | 2 | 2 |
| `@flighthq/collision` | 98 | 98 | 0 | 313 | 173 | 44 |
| `@flighthq/color` | 31 | 31 | 0 | 23 | 13 | 75 |
| `@flighthq/compression` | 24 | 24 | 0 | 46 | 31 | 37 |
| `@flighthq/connectivity` | 22 | 22 | 0 | 27 | 0 | 0 |
| `@flighthq/debug` | 22 | 22 | 0 | 12 | 0 | 0 |
| `@flighthq/device` | 19 | 19 | 0 | 40 | 7 | 0 |
| `@flighthq/dialog` | 33 | 33 | 0 | 52 | 5 | 3 |
| `@flighthq/easing` | 61 | 61 | 0 | 65 | 45 | 6 |
| `@flighthq/effects` | 186 | 186 | 0 | 93 | 48 | 119 |
| `@flighthq/effects-canvas` | 104 | 104 | 0 | 82 | 30 | 63 |
| `@flighthq/effects-gl` | 298 | 298 | 0 | 122 | 26 | 34 |
| `@flighthq/effects-wgpu` | 292 | 292 | 0 | 118 | 25 | 263 |
| `@flighthq/entity` | 18 | 18 | 0 | 15 | 0 | 0 |
| `@flighthq/filesystem` | 54 | 54 | 0 | 88 | 7 | 6 |
| `@flighthq/flow` | 9 | 9 | 0 | 11 | 10 | 9 |
| `@flighthq/font` | 27 | 27 | 0 | 66 | 17 | 34 |
| `@flighthq/geolocation` | 20 | 20 | 0 | 26 | 0 | 0 |
| `@flighthq/geometry` | 397 | 397 | 0 | 437 | 262 | 875 |
| `@flighthq/glyphatlas` | 33 | 33 | 0 | 55 | 17 | 0 |
| `@flighthq/haptics` | 15 | 15 | 0 | 19 | 0 | 0 |
| `@flighthq/host-capacitor` | 33 | 33 | 0 | 62 | 3 | 2 |
| `@flighthq/host-electron` | 35 | 35 | 0 | 96 | 6 | 13 |
| `@flighthq/host-tauri` | 22 | 22 | 0 | 48 | 3 | 0 |
| `@flighthq/image` | 19 | 19 | 0 | 8 | 2 | 0 |
| `@flighthq/image-codec` | 30 | 30 | 0 | 62 | 7 | 53 |
| `@flighthq/importdiagnostics` | 3 | 3 | 0 | 2 | 0 | 0 |
| `@flighthq/input` | 69 | 69 | 0 | 101 | 13 | 8 |
| `@flighthq/interaction` | 153 | 153 | 0 | 208 | 24 | 8 |
| `@flighthq/intl` | 25 | 25 | 0 | 7 | 1 | 0 |
| `@flighthq/ipc` | 23 | 23 | 0 | 13 | 0 | 0 |
| `@flighthq/keyboard` | 27 | 27 | 0 | 25 | 4 | 0 |
| `@flighthq/lifecycle` | 16 | 16 | 0 | 20 | 1 | 1 |
| `@flighthq/lighting` | 41 | 41 | 0 | 50 | 27 | 17 |
| `@flighthq/loader` | 39 | 39 | 0 | 92 | 14 | 1 |
| `@flighthq/log` | 91 | 91 | 0 | 114 | 14 | 2 |
| `@flighthq/materials` | 91 | 91 | 0 | 68 | 15 | 15 |
| `@flighthq/math` | 72 | 72 | 0 | 72 | 52 | 15 |
| `@flighthq/media` | 68 | 68 | 0 | 83 | 2 | 0 |
| `@flighthq/mediasession` | 12 | 12 | 0 | 11 | 0 | 0 |
| `@flighthq/menu` | 23 | 23 | 0 | 65 | 6 | 2 |
| `@flighthq/mesh` | 137 | 137 | 0 | 346 | 216 | 426 |
| `@flighthq/motionpath` | 9 | 9 | 0 | 15 | 13 | 0 |
| `@flighthq/movieclip` | 23 | 23 | 0 | 17 | 0 | 2 |
| `@flighthq/net` | 14 | 14 | 0 | 34 | 4 | 0 |
| `@flighthq/node` | 131 | 131 | 0 | 192 | 30 | 20 |
| `@flighthq/notification` | 29 | 29 | 0 | 27 | 0 | 0 |
| `@flighthq/particleemitter` | 81 | 81 | 0 | 376 | 190 | 587 |
| `@flighthq/particles` | 52 | 52 | 0 | 184 | 96 | 249 |
| `@flighthq/particles-formats` | 150 | 150 | 0 | 522 | 49 | 22 |
| `@flighthq/path` | 156 | 156 | 0 | 477 | 250 | 529 |
| `@flighthq/path-boolean` | 76 | 76 | 0 | 186 | 102 | 119 |
| `@flighthq/path-formats` | 5 | 5 | 0 | 128 | 12 | 0 |
| `@flighthq/permissions` | 34 | 34 | 0 | 37 | 0 | 0 |
| `@flighthq/physics2d` | 70 | 70 | 0 | 225 | 59 | 89 |
| `@flighthq/picking` | 49 | 49 | 0 | 68 | 11 | 58 |
| `@flighthq/platform` | 19 | 19 | 0 | 17 | 7 | 2 |
| `@flighthq/power` | 28 | 28 | 0 | 54 | 3 | 0 |
| `@flighthq/protocol` | 25 | 25 | 0 | 37 | 14 | 0 |
| `@flighthq/quadbatch` | 39 | 39 | 0 | 103 | 74 | 87 |
| `@flighthq/render` | 110 | 110 | 0 | 160 | 25 | 108 |
| `@flighthq/render-gl` | 228 | 228 | 0 | 252 | 40 | 113 |
| `@flighthq/render-wgpu` | 187 | 187 | 0 | 315 | 52 | 101 |
| `@flighthq/scene2d` | 37 | 37 | 0 | 13 | 1 | 19 |
| `@flighthq/scene2d-canvas` | 172 | 172 | 0 | 329 | 72 | 250 |
| `@flighthq/scene2d-dom` | 119 | 119 | 0 | 187 | 38 | 25 |
| `@flighthq/scene2d-formats` | 133 | 133 | 0 | 513 | 56 | 202 |
| `@flighthq/scene2d-gl` | 208 | 208 | 0 | 358 | 113 | 238 |
| `@flighthq/scene2d-resources` | 23 | 23 | 0 | 32 | 3 | 5 |
| `@flighthq/scene2d-wgpu` | 210 | 210 | 0 | 438 | 131 | 309 |
| `@flighthq/scene3d` | 75 | 75 | 0 | 96 | 28 | 88 |
| `@flighthq/scene3d-formats` | 319 | 319 | 0 | 1085 | 424 | 545 |
| `@flighthq/scene3d-gl` | 376 | 376 | 0 | 581 | 65 | 235 |
| `@flighthq/scene3d-resources` | 68 | 68 | 0 | 140 | 18 | 17 |
| `@flighthq/scene3d-wgpu` | 401 | 401 | 0 | 589 | 89 | 551 |
| `@flighthq/screen` | 45 | 45 | 0 | 95 | 18 | 22 |
| `@flighthq/sdk` | 0 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/sensors` | 57 | 57 | 0 | 39 | 1 | 13 |
| `@flighthq/shading` | 31 | 31 | 0 | 25 | 2 | 0 |
| `@flighthq/shape` | 77 | 77 | 0 | 204 | 106 | 244 |
| `@flighthq/shape-formats` | 20 | 20 | 0 | 64 | 5 | 5 |
| `@flighthq/share` | 19 | 19 | 0 | 34 | 3 | 1 |
| `@flighthq/shell` | 16 | 16 | 0 | 6 | 0 | 0 |
| `@flighthq/shortcut` | 55 | 55 | 0 | 61 | 3 | 0 |
| `@flighthq/signals` | 14 | 14 | 0 | 29 | 8 | 4 |
| `@flighthq/skeleton2d` | 32 | 32 | 0 | 85 | 29 | 92 |
| `@flighthq/skeleton2d-formats` | 152 | 152 | 0 | 539 | 160 | 98 |
| `@flighthq/skeleton3d` | 25 | 25 | 0 | 82 | 48 | 116 |
| `@flighthq/snapshot` | 18 | 18 | 0 | 70 | 4 | 6 |
| `@flighthq/socket` | 22 | 22 | 0 | 32 | 0 | 0 |
| `@flighthq/spatial` | 37 | 37 | 0 | 136 | 54 | 2 |
| `@flighthq/spring` | 14 | 14 | 0 | 9 | 5 | 0 |
| `@flighthq/spritesheet` | 38 | 38 | 0 | 62 | 21 | 17 |
| `@flighthq/spritesheet-formats` | 74 | 74 | 0 | 116 | 15 | 12 |
| `@flighthq/statusbar` | 29 | 29 | 0 | 49 | 1 | 1 |
| `@flighthq/storage` | 46 | 46 | 0 | 72 | 5 | 2 |
| `@flighthq/swf` | 249 | 249 | 0 | 593 | 112 | 91 |
| `@flighthq/text` | 96 | 96 | 0 | 90 | 22 | 3 |
| `@flighthq/text-markup` | 51 | 51 | 0 | 114 | 9 | 11 |
| `@flighthq/textbidi` | 45 | 45 | 0 | 176 | 60 | 131 |
| `@flighthq/textinput` | 83 | 83 | 0 | 262 | 84 | 17 |
| `@flighthq/textlayout` | 73 | 73 | 0 | 230 | 115 | 46 |
| `@flighthq/textsegment` | 19 | 19 | 0 | 20 | 9 | 1 |
| `@flighthq/textshaper` | 45 | 45 | 0 | 116 | 71 | 12 |
| `@flighthq/textshaper-canvas` | 5 | 5 | 0 | 9 | 1 | 0 |
| `@flighthq/texture` | 69 | 69 | 0 | 70 | 8 | 13 |
| `@flighthq/texture-formats` | 87 | 87 | 0 | 139 | 41 | 36 |
| `@flighthq/textureatlas` | 46 | 46 | 0 | 50 | 20 | 28 |
| `@flighthq/textureatlas-formats` | 26 | 26 | 0 | 91 | 10 | 16 |
| `@flighthq/tilemap` | 25 | 25 | 0 | 44 | 34 | 6 |
| `@flighthq/tilemap-formats` | 71 | 71 | 0 | 180 | 15 | 8 |
| `@flighthq/timeline` | 29 | 29 | 0 | 32 | 5 | 0 |
| `@flighthq/tray` | 34 | 34 | 0 | 6 | 2 | 2 |
| `@flighthq/tween` | 37 | 37 | 0 | 65 | 13 | 4 |
| `@flighthq/types` | 2080 | 2080 | 0 | 0 | 0 | 0 |
| `@flighthq/updater` | 27 | 27 | 0 | 4 | 1 | 0 |
| `@flighthq/useragent` | 12 | 12 | 0 | 58 | 1 | 3 |
| `@flighthq/velocity` | 21 | 21 | 0 | 16 | 6 | 0 |
| `@flighthq/video` | 18 | 18 | 0 | 30 | 5 | 13 |
| `@flighthq/webcam` | 10 | 10 | 0 | 16 | 0 | 0 |
| `@flighthq/xml` | 13 | 13 | 0 | 62 | 20 | 0 |
