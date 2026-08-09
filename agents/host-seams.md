# Host Seams: hostLime Coverage and Upstream Asks

The host integration rule for this port: `flighthq.hostLime` implements the backend side of seams upstream Flight already defines — named `create*` factories (the `GlSurface` / `LimeCursor` / `LimeAudio` pattern) plugged into upstream's own registration points. Where upstream reaches a browser global directly with no seam, flight-hx does **not** invent a concept; the gap is recorded here as an upstream ask and bridged, if at all, by the narrowest possible adapter.

Surveyed at upstream `cad72aa3`. Re-verify the file/line claims after an upstream re-pin.

## Upstream's seam surface

- 39 global backend setters (`setAppBackend`, `setLoopBackend`, `setWindowBackend`, `setNetBackend`, `setTextShaperBackend`, `setGlyphRasterizerBackend`, `setStorageBackend`, `setFileSystemBackend`, `setClipboardBackend`, `setDialogBackend`, `setAccessibilityBackend`, …). Grep `export function set[A-Z]\w*Backend` in `upstream/packages/*/src` for the full list.
- Per-object backends: `InteractionManager.cursorBackend`.
- Parameter injection: the audio packages take `context: AudioContext` from the caller everywhere (`createAudioMixer`, `playAudioResource`, the loaders) — the "seam" is that the host supplies the context object.

## hostLime status

Implemented:

- `LimeApp.createLimeAppBackend` — `setAppBackend` seam.
- `GlSurface.createGlSurface` / `Scene2dCairo.createCairoSurface` — the render-surface entry the `create*RenderState` family expects.
- `LimeCursor.createLimeCursorBackend` — per-manager `cursorBackend`.
- `LimeAudio.createLimeAudioContext` — the injected `AudioContext`: genuine browser context on js, a node-graph emulation over `lime.media.AudioSource` natively (protocol subset per the `reports/host-types.json` census; `flighthq._internal.dom` audio types are nominal interfaces off-js so emitted calls keep compile-time arity).

Next candidates, in rough downstream-value order:

1. **TextShaperBackend / GlyphRasterizerBackend** — the seams exist and the web defaults measure through canvas `measureText`; natively our `NativeCanvas2dContext.measureText` must return real metrics (cairo text extents) instead of fabricated numbers. This is the downstream "TextMetrics" complaint; it is a hostLime/toolkit backfill, not a seam gap.
2. **NetBackend** — `createWebNetBackend` is fetch-based; a Lime/haxe HTTP implementation gives the net package native parity and becomes the carrier for resource loading once upstream routes loaders through it (see asks below).
3. **LoopBackend** — `setLoopBackend` exists (`requestFrame`/`cancelFrame`); LimeApp should provide it over the Lime frame loop. Note `stepApplicationLoop` is documented upstream as an explicit-delta driver that bypasses fixed-step accumulation by design — the downstream fixed-timestep report should be judged against that contract before assuming a port bug.
4. **Storage / FileSystem / Clipboard / Dialog backends** — mechanical Lime/sys mappings.

## Upstream asks (missing or bypassed seams)

Pattern A — no seam exists:

- **Audio node graph.** The audio protocol is the raw Web Audio object surface (`createGain`/`createBufferSource`/`AudioParam`…) injected as a parameter. Every non-DOM host must emulate the node graph (as `LimeAudio` now does). Ask: an `AudioBackend` (decode / play / gain / pan / clock) with the web implementation as default, so hosts implement a contract instead of a browser API.
- **Image decode.** `loadImageResourceFromUrl` (`image/src/imageResourceFrom.ts`) uses `new Image()` + `src`. Ask: an image-decode backend (bytes → pixels) with the browser `Image` path as default.
- **Scratch canvas.** The bitmap package (`bitmapFrom.ts`, `bitmapEncode.ts`, `explainBitmapReadback.ts`) calls `document.createElement('canvas')` directly and returns null/undefined when `document` is absent, silently disabling bitmap ops headless. Ask: a scratch-surface provider seam. (Our `_internal` `NativeScratchCanvas` is the shape such a backend would take.)

Pattern B — a seam exists but call sites bypass it:

- **Resource loaders bypass NetBackend.** `audioResourceFrom.ts`, `audioResourceReference.ts`, `imageResourceReference.ts`, `clipboard.ts`, and `connectivity.ts` call raw `fetch` instead of `getNetBackend()`. Ask: funnel loader transport through the net seam; that single change makes host-neutral resource loading fall out of a `NetBackend` implementation.
- **Window/document listeners.** `application/src/window.ts` registers `document.addEventListener('fullscreenchange'|'visibilitychange')` and creates favicon `link` elements directly even though `setWindowBackend` exists. Ask: fold these into the window backend contract.

Acceptable as-is (do not report): packages whose _default_ backend is inline web glue behind an existing seam (net, dialog, device probes) — that is upstream's documented pattern, and hosts simply install a different backend.
