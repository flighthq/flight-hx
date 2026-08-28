# Host seams and HostLime coverage

Flight platform capabilities use `custom > host > sentinel` precedence. Maintained host packages install through each capability's protected `install*HostBackend` door; direct `set*Backend` calls are custom application overrides and are not a host registration mechanism.

HostLime's supported door is `HostLime.enableHostLime(application)`, with individual `enableHostLime*` methods for smaller profiles. Factories remain public for tests, composition, and per-object injection, but consumers do not need access to protected setters. The current capability matrix, maturity limits, and design forks live in [`host-lime-maturity.md`](host-lime-maturity.md).

## Seam shapes

- Host-installed globals: App, Loop, Lifecycle, Platform, Screen, Haptics, Clipboard, Dialog, FileSystem, and Storage are implemented by HostLime.
- Per-object injection: `InteractionManager.cursorBackend` is supplied by `LimeCursor.createLimeCursorBackend(window)`.
- Protocol injection: audio operations accept an `AudioContext`; native callers create one with `LimeAudio.createLimeAudioContext()`.
- Render surfaces: `GlSurface.createGlSurface(window)` and `Scene2DCairo.createCairoSurface(window)` bridge Lime windows to Flight render-state creation.
- Host gap: Net has a custom setter but no host installation slot. `LimeNet.createLimeNetBackend()` is implemented, but the HostLime enabler deliberately does not install it.

## Remaining upstream asks

1. Add a host-layer Net installation slot and route loaders that still call raw `fetch` through NetBackend.
2. Make broad App/Dialog/FileSystem support observable per operation, or permit composable partial backends, so a truthful native subset does not look globally available.
3. Establish an explicit WindowBackend attachment-versus-ownership contract before HostLime maps `ApplicationWindow` to Lime windows.
4. Add a host-neutral audio backend if Flight needs native streaming and scheduled node-graph semantics beyond its current injected Web Audio protocol.
5. Provide scratch-surface and image-decode seams for bitmap/image paths that still create DOM canvas/image values directly.
6. Keep native WebGPU behind a genuine graphics-device implementation; do not treat a Lime window adapter as a WGPU backend.
