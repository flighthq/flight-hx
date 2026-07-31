# Lowering Audit

| Metric | Count |
| --- | ---: |
| Packages | 131 |
| Source files | 1898 |
| Candidate declarations | 9122 |
| Lowered declarations | 9122 |
| Current diagnostics | 0 |
| Proven explicit Boolean truthiness uses | 7991 |
| Proven Boolean conditional conditions | 1709 |
| Proven Boolean logical-left truthiness uses | 2739 |
| Proven Boolean logical expressions | 2613 |
| Proven numeric relations | 4033 |
| Direct Boolean truthiness uses | 7882 |
| Direct Boolean conditional expressions | 1689 |
| Direct Boolean `&&` expressions | 1223 |
| Direct Boolean `\|\|` expressions | 1364 |
| Direct numeric relations | 4021 |
| Proven indexed expressions | 7373 |
| Proven indexed reads | 4555 |
| Proven indexed writes | 2932 |
| Parked width-sensitive mixed indexed writes | 13 |
| Direct indexed reads | 4658 |
| Direct indexed writes | 2930 |
| Direct synthetic iteration-binding Array reads | 79 |
| Direct synthetic high-arity-argument Array reads | 27 |

| Indexed receiver | Proven expressions | Proven reads | Proven writes | Direct reads | Direct writes |
| --- | ---: | ---: | ---: | ---: | ---: |
| `Array` | 2944 | 2512 | 455 | 2615 | 453 |
| `ArrayOrFloat32Array` | 19 | 4 | 15 | 4 | 15 |
| `Float32Array` | 3307 | 1392 | 1979 | 1392 | 1979 |
| `Float64Array` | 83 | 59 | 51 | 59 | 51 |
| `Int16Array` | 9 | 5 | 4 | 5 | 4 |
| `Int32Array` | 20 | 13 | 7 | 13 | 7 |
| `Int8Array` | 0 | 0 | 0 | 0 | 0 |
| `Uint16Array` | 63 | 37 | 26 | 37 | 26 |
| `Uint16ArrayOrUint32Array` | 27 | 27 | 0 | 27 | 0 |
| `Uint32Array` | 10 | 2 | 8 | 2 | 8 |
| `Uint8Array` | 192 | 164 | 28 | 164 | 28 |
| `Uint8ClampedArray` | 699 | 340 | 359 | 340 | 359 |

| Package | Declarations | Lowered | Diagnostics | Boolean truthiness | Numeric relations | Indexed calls |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| `@flighthq/accessibility` | 20 | 20 | 0 | 27 | 0 | 0 |
| `@flighthq/adjustments` | 62 | 62 | 0 | 55 | 26 | 220 |
| `@flighthq/animation` | 30 | 30 | 0 | 69 | 36 | 18 |
| `@flighthq/app` | 44 | 44 | 0 | 16 | 0 | 0 |
| `@flighthq/application` | 113 | 113 | 0 | 115 | 17 | 4 |
| `@flighthq/assets` | 11 | 11 | 0 | 29 | 2 | 0 |
| `@flighthq/audio` | 20 | 20 | 0 | 49 | 8 | 33 |
| `@flighthq/binpack` | 14 | 14 | 0 | 56 | 29 | 5 |
| `@flighthq/bitmapfont` | 8 | 8 | 0 | 3 | 2 | 2 |
| `@flighthq/bitmapfont-formats` | 23 | 23 | 0 | 103 | 6 | 3 |
| `@flighthq/bitmaptext` | 34 | 34 | 0 | 50 | 17 | 5 |
| `@flighthq/camera` | 48 | 48 | 0 | 21 | 6 | 95 |
| `@flighthq/camera2d` | 15 | 15 | 0 | 8 | 8 | 0 |
| `@flighthq/capture` | 10 | 10 | 0 | 8 | 2 | 0 |
| `@flighthq/clip` | 32 | 32 | 0 | 81 | 34 | 24 |
| `@flighthq/clipboard` | 38 | 38 | 0 | 37 | 2 | 0 |
| `@flighthq/clock` | 14 | 14 | 0 | 13 | 2 | 2 |
| `@flighthq/collision` | 41 | 41 | 0 | 113 | 98 | 28 |
| `@flighthq/color` | 32 | 32 | 0 | 23 | 13 | 72 |
| `@flighthq/connectivity` | 22 | 22 | 0 | 27 | 0 | 0 |
| `@flighthq/debug` | 23 | 23 | 0 | 13 | 0 | 0 |
| `@flighthq/device` | 19 | 19 | 0 | 40 | 7 | 0 |
| `@flighthq/dialog` | 33 | 33 | 0 | 52 | 5 | 3 |
| `@flighthq/displayobject` | 52 | 52 | 0 | 15 | 0 | 0 |
| `@flighthq/displayobject-canvas` | 141 | 141 | 0 | 278 | 65 | 254 |
| `@flighthq/displayobject-dom` | 118 | 118 | 0 | 189 | 38 | 25 |
| `@flighthq/displayobject-gl` | 181 | 181 | 0 | 291 | 88 | 201 |
| `@flighthq/displayobject-wgpu` | 186 | 186 | 0 | 355 | 106 | 267 |
| `@flighthq/easing` | 56 | 56 | 0 | 63 | 44 | 6 |
| `@flighthq/effects` | 126 | 126 | 0 | 80 | 44 | 119 |
| `@flighthq/effects-canvas` | 122 | 122 | 0 | 43 | 14 | 37 |
| `@flighthq/effects-gl` | 258 | 258 | 0 | 99 | 24 | 33 |
| `@flighthq/effects-wgpu` | 248 | 248 | 0 | 103 | 24 | 260 |
| `@flighthq/entity` | 13 | 13 | 0 | 13 | 0 | 0 |
| `@flighthq/filesystem` | 54 | 54 | 0 | 88 | 7 | 6 |
| `@flighthq/flow` | 9 | 9 | 0 | 11 | 10 | 9 |
| `@flighthq/font` | 15 | 15 | 0 | 31 | 2 | 26 |
| `@flighthq/geolocation` | 20 | 20 | 0 | 26 | 0 | 0 |
| `@flighthq/geometry` | 397 | 397 | 0 | 435 | 262 | 875 |
| `@flighthq/glyphatlas` | 23 | 23 | 0 | 37 | 11 | 0 |
| `@flighthq/haptics` | 15 | 15 | 0 | 19 | 0 | 0 |
| `@flighthq/host-capacitor` | 83 | 83 | 0 | 62 | 3 | 2 |
| `@flighthq/host-electron` | 72 | 72 | 0 | 96 | 6 | 13 |
| `@flighthq/host-tauri` | 62 | 62 | 0 | 48 | 3 | 0 |
| `@flighthq/image` | 21 | 21 | 0 | 13 | 2 | 0 |
| `@flighthq/image-codec` | 24 | 24 | 0 | 31 | 3 | 28 |
| `@flighthq/input` | 69 | 69 | 0 | 97 | 13 | 8 |
| `@flighthq/interaction` | 158 | 158 | 0 | 206 | 24 | 8 |
| `@flighthq/intl` | 25 | 25 | 0 | 7 | 1 | 0 |
| `@flighthq/ipc` | 23 | 23 | 0 | 13 | 0 | 0 |
| `@flighthq/keyboard` | 27 | 27 | 0 | 25 | 4 | 0 |
| `@flighthq/lifecycle` | 16 | 16 | 0 | 20 | 1 | 1 |
| `@flighthq/lighting` | 40 | 40 | 0 | 23 | 13 | 0 |
| `@flighthq/loader` | 35 | 35 | 0 | 86 | 11 | 1 |
| `@flighthq/log` | 93 | 93 | 0 | 113 | 14 | 2 |
| `@flighthq/materials` | 81 | 81 | 0 | 35 | 10 | 15 |
| `@flighthq/math` | 72 | 72 | 0 | 72 | 52 | 15 |
| `@flighthq/media` | 61 | 61 | 0 | 79 | 2 | 0 |
| `@flighthq/mediasession` | 12 | 12 | 0 | 11 | 0 | 0 |
| `@flighthq/menu` | 22 | 22 | 0 | 53 | 4 | 2 |
| `@flighthq/mesh` | 98 | 98 | 0 | 255 | 175 | 402 |
| `@flighthq/motionpath` | 9 | 9 | 0 | 15 | 13 | 0 |
| `@flighthq/movieclip` | 23 | 23 | 0 | 17 | 0 | 3 |
| `@flighthq/net` | 14 | 14 | 0 | 34 | 4 | 0 |
| `@flighthq/node` | 119 | 119 | 0 | 175 | 30 | 20 |
| `@flighthq/notification` | 29 | 29 | 0 | 27 | 0 | 0 |
| `@flighthq/particleemitter` | 78 | 78 | 0 | 359 | 179 | 564 |
| `@flighthq/particles` | 52 | 52 | 0 | 184 | 96 | 249 |
| `@flighthq/particles-formats` | 197 | 197 | 0 | 500 | 47 | 22 |
| `@flighthq/path` | 118 | 118 | 0 | 374 | 200 | 466 |
| `@flighthq/path-boolean` | 76 | 76 | 0 | 186 | 102 | 119 |
| `@flighthq/path-formats` | 5 | 5 | 0 | 128 | 12 | 0 |
| `@flighthq/permissions` | 23 | 23 | 0 | 27 | 0 | 0 |
| `@flighthq/picking` | 30 | 30 | 0 | 27 | 7 | 27 |
| `@flighthq/platform` | 19 | 19 | 0 | 17 | 7 | 2 |
| `@flighthq/power` | 28 | 28 | 0 | 54 | 3 | 0 |
| `@flighthq/protocol` | 25 | 25 | 0 | 37 | 14 | 0 |
| `@flighthq/render` | 88 | 88 | 0 | 129 | 24 | 83 |
| `@flighthq/render-gl` | 113 | 113 | 0 | 124 | 31 | 85 |
| `@flighthq/render-wgpu` | 96 | 96 | 0 | 124 | 23 | 79 |
| `@flighthq/scene` | 65 | 65 | 0 | 54 | 12 | 59 |
| `@flighthq/scene-formats` | 261 | 261 | 0 | 707 | 283 | 427 |
| `@flighthq/scene-gl` | 352 | 352 | 0 | 503 | 44 | 208 |
| `@flighthq/scene-resources` | 48 | 48 | 0 | 52 | 5 | 5 |
| `@flighthq/scene-wgpu` | 317 | 317 | 0 | 362 | 35 | 405 |
| `@flighthq/screen` | 45 | 45 | 0 | 95 | 18 | 22 |
| `@flighthq/sdk` | 0 | 0 | 0 | 0 | 0 | 0 |
| `@flighthq/sensors` | 57 | 57 | 0 | 39 | 1 | 13 |
| `@flighthq/shading` | 42 | 42 | 0 | 25 | 2 | 0 |
| `@flighthq/shape` | 53 | 53 | 0 | 84 | 58 | 138 |
| `@flighthq/shape-formats` | 15 | 15 | 0 | 47 | 2 | 3 |
| `@flighthq/share` | 18 | 18 | 0 | 34 | 4 | 1 |
| `@flighthq/shell` | 16 | 16 | 0 | 6 | 0 | 0 |
| `@flighthq/shortcut` | 40 | 40 | 0 | 39 | 1 | 0 |
| `@flighthq/signals` | 15 | 15 | 0 | 29 | 8 | 4 |
| `@flighthq/skeleton3d` | 20 | 20 | 0 | 63 | 43 | 107 |
| `@flighthq/snapshot` | 12 | 12 | 0 | 54 | 3 | 6 |
| `@flighthq/socket` | 14 | 14 | 0 | 22 | 0 | 0 |
| `@flighthq/spatial` | 27 | 27 | 0 | 71 | 45 | 2 |
| `@flighthq/spring` | 14 | 14 | 0 | 9 | 5 | 0 |
| `@flighthq/sprite` | 78 | 78 | 0 | 150 | 102 | 91 |
| `@flighthq/spritesheet` | 38 | 38 | 0 | 66 | 23 | 17 |
| `@flighthq/spritesheet-formats` | 110 | 110 | 0 | 116 | 15 | 12 |
| `@flighthq/statusbar` | 25 | 25 | 0 | 31 | 1 | 1 |
| `@flighthq/storage` | 46 | 46 | 0 | 72 | 5 | 2 |
| `@flighthq/surface` | 196 | 196 | 0 | 803 | 628 | 778 |
| `@flighthq/text` | 96 | 96 | 0 | 90 | 22 | 3 |
| `@flighthq/text-markup` | 51 | 51 | 0 | 114 | 9 | 11 |
| `@flighthq/textbidi` | 45 | 45 | 0 | 176 | 60 | 131 |
| `@flighthq/textinput` | 83 | 83 | 0 | 262 | 84 | 17 |
| `@flighthq/textlayout` | 74 | 74 | 0 | 226 | 111 | 46 |
| `@flighthq/textsegment` | 19 | 19 | 0 | 20 | 9 | 1 |
| `@flighthq/textshaper` | 40 | 40 | 0 | 115 | 72 | 12 |
| `@flighthq/textshaper-canvas` | 6 | 6 | 0 | 9 | 1 | 0 |
| `@flighthq/texture` | 43 | 43 | 0 | 41 | 7 | 34 |
| `@flighthq/texture-formats` | 62 | 62 | 0 | 121 | 38 | 34 |
| `@flighthq/textureatlas` | 20 | 20 | 0 | 7 | 2 | 0 |
| `@flighthq/textureatlas-formats` | 36 | 36 | 0 | 72 | 10 | 16 |
| `@flighthq/tilemap-formats` | 75 | 75 | 0 | 180 | 15 | 8 |
| `@flighthq/tileset` | 9 | 9 | 0 | 9 | 6 | 1 |
| `@flighthq/timeline` | 26 | 26 | 0 | 31 | 5 | 0 |
| `@flighthq/tool-capture` | 84 | 84 | 0 | 147 | 12 | 2 |
| `@flighthq/tray` | 25 | 25 | 0 | 3 | 1 | 2 |
| `@flighthq/tween` | 38 | 38 | 0 | 65 | 13 | 4 |
| `@flighthq/types` | 1287 | 1287 | 0 | 0 | 0 | 0 |
| `@flighthq/updater` | 27 | 27 | 0 | 4 | 1 | 0 |
| `@flighthq/useragent` | 12 | 12 | 0 | 51 | 0 | 3 |
| `@flighthq/velocity` | 21 | 21 | 0 | 16 | 6 | 0 |
| `@flighthq/video` | 18 | 18 | 0 | 29 | 5 | 13 |
| `@flighthq/webcam` | 11 | 11 | 0 | 16 | 0 | 0 |
| `@flighthq/xml` | 14 | 14 | 0 | 35 | 9 | 0 |
