# Lowering Audit

| Metric | Count |
| --- | ---: |
| Packages | 138 |
| Source files | 2313 |
| Candidate declarations | 10972 |
| Lowered declarations | 10972 |
| Current diagnostics | 0 |
| Proven explicit Boolean truthiness uses | 10397 |
| Proven Boolean conditional conditions | 2242 |
| Proven Boolean logical-left truthiness uses | 3756 |
| Proven Boolean logical expressions | 3565 |
| Proven numeric relations | 5098 |
| Direct Boolean truthiness uses | 10410 |
| Direct Boolean conditional expressions | 2248 |
| Direct Boolean `&&` expressions | 1638 |
| Direct Boolean `\|\|` expressions | 1927 |
| Direct numeric relations | 5104 |
| Proven indexed expressions | 8825 |
| Proven indexed reads | 5713 |
| Proven indexed writes | 3218 |
| Parked width-sensitive mixed indexed writes | 16 |
| Direct indexed reads | 6113 |
| Direct indexed writes | 3216 |
| Direct synthetic iteration-binding Array reads | 106 |
| Direct synthetic high-arity-argument Array reads | 27 |
| Audited ordinary destructuring indexed reads | 274 |
| Destructuring reads with retained receiver facts | 262 |
| Direct destructuring Array reads | 262 |
| Proven destructuring reads awaiting a direct endpoint | 0 |
| Parked destructuring reads | 12 |

| Indexed receiver | Proven expressions | Proven reads | Proven writes | Direct reads | Direct writes |
| --- | ---: | ---: | ---: | ---: | ---: |
| `Array` | 3943 | 3377 | 589 | 3777 | 587 |
| `ArrayOrFloat32Array` | 47 | 8 | 39 | 8 | 39 |
| `Float32Array` | 3538 | 1536 | 2058 | 1536 | 2058 |
| `Float64Array` | 100 | 70 | 57 | 70 | 57 |
| `Int16Array` | 9 | 5 | 4 | 5 | 4 |
| `Int32Array` | 39 | 23 | 16 | 23 | 16 |
| `Int8Array` | 0 | 0 | 0 | 0 | 0 |
| `Uint16Array` | 77 | 45 | 32 | 45 | 32 |
| `Uint16ArrayOrUint32Array` | 29 | 29 | 0 | 29 | 0 |
| `Uint32Array` | 46 | 20 | 26 | 20 | 26 |
| `Uint8Array` | 290 | 256 | 34 | 256 | 34 |
| `Uint8ClampedArray` | 707 | 344 | 363 | 344 | 363 |

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
| `@flighthq/accessibility` | 20 | 20 | 0 | 27 | 0 | 0 |
| `@flighthq/adjustments` | 65 | 65 | 0 | 60 | 27 | 221 |
| `@flighthq/animation` | 100 | 100 | 0 | 285 | 120 | 124 |
| `@flighthq/app` | 44 | 44 | 0 | 16 | 0 | 0 |
| `@flighthq/application` | 119 | 119 | 0 | 119 | 17 | 4 |
| `@flighthq/application-gl` | 4 | 4 | 0 | 5 | 0 | 0 |
| `@flighthq/assets` | 15 | 15 | 0 | 53 | 6 | 3 |
| `@flighthq/audio` | 20 | 20 | 0 | 51 | 8 | 33 |
| `@flighthq/binpack` | 14 | 14 | 0 | 56 | 29 | 5 |
| `@flighthq/bitmap` | 183 | 183 | 0 | 809 | 632 | 778 |
| `@flighthq/bitmapfont` | 9 | 9 | 0 | 4 | 2 | 2 |
| `@flighthq/bitmapfont-formats` | 19 | 19 | 0 | 104 | 6 | 3 |
| `@flighthq/bitmaptext` | 34 | 34 | 0 | 49 | 18 | 8 |
| `@flighthq/camera` | 60 | 60 | 0 | 38 | 13 | 107 |
| `@flighthq/camera-controls` | 32 | 32 | 0 | 22 | 13 | 0 |
| `@flighthq/capture` | 10 | 10 | 0 | 8 | 2 | 0 |
| `@flighthq/clip` | 37 | 37 | 0 | 83 | 34 | 24 |
| `@flighthq/clipboard` | 38 | 38 | 0 | 36 | 2 | 0 |
| `@flighthq/clock` | 14 | 14 | 0 | 13 | 2 | 2 |
| `@flighthq/collision` | 73 | 73 | 0 | 176 | 134 | 30 |
| `@flighthq/color` | 30 | 30 | 0 | 23 | 13 | 72 |
| `@flighthq/connectivity` | 22 | 22 | 0 | 27 | 0 | 0 |
| `@flighthq/debug` | 22 | 22 | 0 | 12 | 0 | 0 |
| `@flighthq/device` | 19 | 19 | 0 | 40 | 7 | 0 |
| `@flighthq/dialog` | 33 | 33 | 0 | 52 | 5 | 3 |
| `@flighthq/easing` | 61 | 61 | 0 | 65 | 45 | 6 |
| `@flighthq/effects` | 186 | 186 | 0 | 93 | 48 | 119 |
| `@flighthq/effects-canvas` | 65 | 65 | 0 | 52 | 15 | 38 |
| `@flighthq/effects-gl` | 298 | 298 | 0 | 118 | 26 | 34 |
| `@flighthq/effects-wgpu` | 292 | 292 | 0 | 118 | 25 | 263 |
| `@flighthq/entity` | 18 | 18 | 0 | 15 | 0 | 0 |
| `@flighthq/filesystem` | 54 | 54 | 0 | 88 | 7 | 6 |
| `@flighthq/flow` | 9 | 9 | 0 | 11 | 10 | 9 |
| `@flighthq/font` | 15 | 15 | 0 | 31 | 2 | 26 |
| `@flighthq/geolocation` | 20 | 20 | 0 | 26 | 0 | 0 |
| `@flighthq/geometry` | 397 | 397 | 0 | 437 | 262 | 875 |
| `@flighthq/glyphatlas` | 33 | 33 | 0 | 55 | 17 | 0 |
| `@flighthq/haptics` | 15 | 15 | 0 | 19 | 0 | 0 |
| `@flighthq/host-capacitor` | 33 | 33 | 0 | 62 | 3 | 2 |
| `@flighthq/host-electron` | 35 | 35 | 0 | 96 | 6 | 13 |
| `@flighthq/host-tauri` | 22 | 22 | 0 | 48 | 3 | 0 |
| `@flighthq/image` | 15 | 15 | 0 | 8 | 2 | 0 |
| `@flighthq/image-codec` | 28 | 28 | 0 | 59 | 7 | 53 |
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
| `@flighthq/materials` | 92 | 92 | 0 | 68 | 15 | 15 |
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
| `@flighthq/permissions` | 23 | 23 | 0 | 27 | 0 | 0 |
| `@flighthq/physics2d` | 70 | 70 | 0 | 225 | 59 | 89 |
| `@flighthq/picking` | 49 | 49 | 0 | 68 | 11 | 58 |
| `@flighthq/platform` | 19 | 19 | 0 | 17 | 7 | 2 |
| `@flighthq/power` | 28 | 28 | 0 | 54 | 3 | 0 |
| `@flighthq/protocol` | 25 | 25 | 0 | 37 | 14 | 0 |
| `@flighthq/quadbatch` | 39 | 39 | 0 | 103 | 74 | 87 |
| `@flighthq/render` | 108 | 108 | 0 | 160 | 25 | 84 |
| `@flighthq/render-gl` | 223 | 223 | 0 | 231 | 39 | 103 |
| `@flighthq/render-wgpu` | 179 | 179 | 0 | 285 | 48 | 91 |
| `@flighthq/scene2d` | 37 | 37 | 0 | 13 | 1 | 19 |
| `@flighthq/scene2d-canvas` | 172 | 172 | 0 | 329 | 72 | 250 |
| `@flighthq/scene2d-dom` | 119 | 119 | 0 | 187 | 38 | 25 |
| `@flighthq/scene2d-formats` | 133 | 133 | 0 | 513 | 56 | 202 |
| `@flighthq/scene2d-gl` | 208 | 208 | 0 | 358 | 113 | 238 |
| `@flighthq/scene2d-resources` | 23 | 23 | 0 | 32 | 3 | 5 |
| `@flighthq/scene2d-wgpu` | 210 | 210 | 0 | 435 | 131 | 309 |
| `@flighthq/scene3d` | 73 | 73 | 0 | 88 | 27 | 87 |
| `@flighthq/scene3d-formats` | 303 | 303 | 0 | 1092 | 441 | 581 |
| `@flighthq/scene3d-gl` | 372 | 372 | 0 | 569 | 65 | 235 |
| `@flighthq/scene3d-resources` | 68 | 68 | 0 | 140 | 18 | 17 |
| `@flighthq/scene3d-wgpu` | 400 | 400 | 0 | 573 | 89 | 547 |
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
| `@flighthq/socket` | 14 | 14 | 0 | 22 | 0 | 0 |
| `@flighthq/spatial` | 36 | 36 | 0 | 118 | 49 | 2 |
| `@flighthq/spring` | 14 | 14 | 0 | 9 | 5 | 0 |
| `@flighthq/spritesheet` | 37 | 37 | 0 | 64 | 21 | 17 |
| `@flighthq/spritesheet-formats` | 74 | 74 | 0 | 116 | 15 | 12 |
| `@flighthq/statusbar` | 29 | 29 | 0 | 49 | 1 | 1 |
| `@flighthq/storage` | 46 | 46 | 0 | 72 | 5 | 2 |
| `@flighthq/swf` | 86 | 86 | 0 | 220 | 35 | 42 |
| `@flighthq/text` | 96 | 96 | 0 | 90 | 22 | 3 |
| `@flighthq/text-markup` | 51 | 51 | 0 | 114 | 9 | 11 |
| `@flighthq/textbidi` | 45 | 45 | 0 | 176 | 60 | 131 |
| `@flighthq/textinput` | 83 | 83 | 0 | 262 | 84 | 17 |
| `@flighthq/textlayout` | 73 | 73 | 0 | 230 | 115 | 46 |
| `@flighthq/textsegment` | 19 | 19 | 0 | 20 | 9 | 1 |
| `@flighthq/textshaper` | 40 | 40 | 0 | 116 | 71 | 12 |
| `@flighthq/textshaper-canvas` | 5 | 5 | 0 | 9 | 1 | 0 |
| `@flighthq/texture` | 66 | 66 | 0 | 67 | 8 | 13 |
| `@flighthq/texture-formats` | 69 | 69 | 0 | 129 | 41 | 36 |
| `@flighthq/textureatlas` | 42 | 42 | 0 | 35 | 11 | 17 |
| `@flighthq/textureatlas-formats` | 26 | 26 | 0 | 91 | 10 | 16 |
| `@flighthq/tilemap` | 25 | 25 | 0 | 44 | 34 | 6 |
| `@flighthq/tilemap-formats` | 71 | 71 | 0 | 180 | 15 | 8 |
| `@flighthq/timeline` | 29 | 29 | 0 | 32 | 5 | 0 |
| `@flighthq/tray` | 34 | 34 | 0 | 6 | 2 | 2 |
| `@flighthq/tween` | 37 | 37 | 0 | 65 | 13 | 4 |
| `@flighthq/types` | 2033 | 2033 | 0 | 0 | 0 | 0 |
| `@flighthq/updater` | 27 | 27 | 0 | 4 | 1 | 0 |
| `@flighthq/useragent` | 12 | 12 | 0 | 58 | 1 | 3 |
| `@flighthq/velocity` | 21 | 21 | 0 | 16 | 6 | 0 |
| `@flighthq/video` | 18 | 18 | 0 | 30 | 5 | 13 |
| `@flighthq/webcam` | 10 | 10 | 0 | 16 | 0 | 0 |
| `@flighthq/xml` | 13 | 13 | 0 | 62 | 20 | 0 |
