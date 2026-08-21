# Host Seams: hostLime Coverage and Upstream Asks

The host integration rule for this port: `flighthq.hostLime` implements the backend side of seams upstream Flight already defines — named `create*` factories (the `GlSurface` / `LimeCursor` / `LimeAudio` pattern) plugged into upstream's own registration points. Where upstream reaches a browser global directly with no seam, flight-hx does **not** invent a concept; the gap is recorded here as an upstream ask and bridged, if at all, by the narrowest possible adapter.

Surveyed at upstream `598ef6f6`. Re-verify the file/line claims after an upstream re-pin.

## Upstream's seam surface

- 40 global backend setters (`setAppBackend`, `setLoopBackend`, `setWindowBackend`, `setNetBackend`, `setImageBackend`, `setTextShaperBackend`, `setGlyphRasterizerBackend`, `setStorageBackend`, `setFileSystemBackend`, `setClipboardBackend`, `setDialogBackend`, `setAccessibilityBackend`, …). Grep `export function set[A-Z]\w*Backend` in `upstream/packages/*/src` for the full list.
- Per-object backends: `InteractionManager.cursorBackend`.
- Parameter injection: the audio packages take `context: AudioContext` from the caller everywhere (`createAudioMixer`, `playAudioResource`, the loaders) — the "seam" is that the host supplies the context object.

## hostLime status

Implemented:

- `LimeApp.createLimeAppBackend` — `setAppBackend` seam.
- `GlSurface.createGlSurface` / `Scene2dCairo.createCairoSurface` — the render-surface entry the `create*RenderState` family expects.
- `LimeCursor.createLimeCursorBackend` — per-manager `cursorBackend`.
- `LimeAudio.createLimeAudioContext` — the injected `AudioContext`: genuine browser context on js, a node-graph emulation over `lime.media.AudioSource` natively (protocol subset per the `reports/host-types.json` census; `flighthq._internal.dom` audio types are nominal interfaces off-js so emitted calls keep compile-time arity).
- `LimeLoop.createLimeLoopBackend` — `setLoopBackend` over the Lime frame loop, making `startApplicationLoop` drivable natively. Note `stepApplicationLoop` is documented upstream as an explicit-delta driver that bypasses fixed-step accumulation by design — judge the downstream fixed-timestep report against that contract before assuming a port bug.
- `LimeNet.createLimeNetBackend` — `setNetBackend` over `lime.net.HTTPRequest` (libcurl natively; upstream's own web backend on js). Verified end-to-end: GET/headers/JSON decode plus the status-0 transport sentinel. Documented deviations: 'blob' decodes to the raw buffer, redirect 'error' reports the 3xx as a transport failure after receipt, and `url` echoes the request URL (Lime does not expose the post-redirect URL).
- `LimeFileSystem.createLimeFileSystemBackend` — the full `FileSystemBackend` over sys IO, including atomic writes, recursive walks with `maxDepth`, stat, copy/append, and `getPath` over Lime's system directories. Unsupported-per-contract natively: file streams (null), symlinks/permissions (false/null), usage (null), watch (no-op unsubscribe, web parity).
- `LimeStorage.createLimeStorageBackend` — the synchronous `StorageBackend` over a write-through JSON file in the application storage directory (path overridable). `byteSize` reports UTF-16 cost like the web backend; the optional `subscribeChanges` seam is absent by design (no external mutations to observe).
- `LimeClipboard.createLimeClipboardBackend` — `ClipboardBackend` over the Lime plain-text clipboard: text/format/items lanes and change notification (`Clipboard.onUpdate`) are real; HTML/RTF/image/bookmark/file flavors resolve to their documented denied values.
- `LimeDialog.createLimeDialogBackend` — `DialogBackend` with real native file pickers (`lime.ui.FileDialog`, including directory and multi-select); `message`/`confirm` show `window.alert` (single-button), `prompt` resolves null (no native input dialog).

Next candidates, in rough downstream-value order:

1. **TextShaperBackend / GlyphRasterizerBackend** — the seams exist and the web defaults measure through canvas `measureText`; `NativeCanvas2dContext.measureText` now returns real metrics, so wiring the canvas shaper/rasterizer defaults against it natively (or a dedicated Lime backend) is the remaining step.
2. **ImageBackend** — new upstream `setImageBackend` now owns URL image decode behind a host seam. A Lime implementation can decode into Flight's `Image` value without emulating the browser `Image` object.

## Upstream asks (missing or bypassed seams)

Pattern A — no seam exists:

- **Audio node graph.** The audio protocol is the raw Web Audio object surface (`createGain`/`createBufferSource`/`AudioParam`…) injected as a parameter. Every non-DOM host must emulate the node graph (as `LimeAudio` now does). Ask: an `AudioBackend` (decode / play / gain / pan / clock) with the web implementation as default, so hosts implement a contract instead of a browser API.
- **Scratch canvas.** The bitmap package (`bitmapFrom.ts`, `bitmapEncode.ts`, `explainBitmapReadback.ts`) calls `document.createElement('canvas')` directly and returns null/undefined when `document` is absent, silently disabling bitmap ops headless. Ask: a scratch-surface provider seam. (Our `_internal` `NativeScratchCanvas` is the shape such a backend would take.)

Pattern B — a seam exists but call sites bypass it:

- **Resource loaders bypass NetBackend.** `audioResourceFrom.ts`, `audioResourceReference.ts`, `imageResourceReference.ts`, `clipboard.ts`, and `connectivity.ts` call raw `fetch` instead of `getNetBackend()`. Ask: funnel loader transport through the net seam; that single change makes host-neutral resource loading fall out of a `NetBackend` implementation.
- **Window/document listeners.** `application/src/window.ts` registers `document.addEventListener('fullscreenchange'|'visibilitychange')` and creates favicon `link` elements directly even though `setWindowBackend` exists. Ask: fold these into the window backend contract.

Acceptable as-is (do not report): packages whose _default_ backend is inline web glue behind an existing seam (net, dialog, device probes) — that is upstream's documented pattern, and hosts simply install a different backend.
