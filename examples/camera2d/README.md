# Camera2D Scene2D GL

This is a binding example, not a second hand-maintained Flight demo. It takes the deterministic
scene and framebuffer oracle from flight-cpp's `camera2d` port and keeps the authored graph in one
Haxe source:

- `js + flight_esm` maps the scene commands directly to the generated Flight ESM externs and
  renders them with browser WebGL2.
- `cpp` maps the same commands to a narrow, manifest-recorded flight-cpp ownership adapter and
  renders three verified offscreen SDL3/OpenGL frames.

The first slice deliberately omits input, text, and the raster fallback. It still covers 72 nodes,
67 Shapes, deterministic fills and strokes, hierarchy and transform invalidation, renderer and
material registration, render-pass lifecycle, mesh preparation, and native framebuffer readback.
Both adapters require more than 5,000 non-background pixels and the authored yellow player at the
center of every frame before printing their success marker.

The repository's cross-target gate builds both targets from a freshly installed Haxelib and runs
the native executable with SDL's offscreen driver. The browser bundle is compiled and linked but is
not launched by CI yet; its in-browser readback applies the same pixel oracle when it runs.

From the repository root, emit and bundle the web build with:

```sh
node tools/haxe.mjs examples/camera2d/web.hxml
node tools/esm/bundle.mjs bin/camera2d.js bin/camera2d.bundle.mjs --browser
```

Then serve the repository root over HTTP and open `examples/camera2d/index.html`.

Build native after configuring the pinned flight-cpp development preset (including its SDL3/GL
host):

```sh
node tools/haxe.mjs examples/camera2d/native.hxml -cpp bin/camera2d-native \
  -D flight_cpp_root=/absolute/path/to/flight-cpp \
  -D flight_cpp_build=/absolute/path/to/flight-cpp/out/cmake/development \
  -D flight_hx_root=/absolute/path/to/flight-hx
```
