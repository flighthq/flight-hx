# flight.hostClay — Clay host backend

A second Haxe host for Flight, alongside `flight.hostLime`, backed by [Clay](https://github.com/ceramic-engine/clay) (the platform layer beneath Ceramic). Clay exposes a raw WebGL-shaped `clay.opengl.GL`, so it feeds Flight's existing `render-gl` with no new render backend. See [`agents/host-strategy.md`](../../../agents/host-strategy.md) for why Clay was chosen.

**Architecture** follows hostLime's matured idiom. On develop the host seam is explicit: instead of global `install<Name>HostBackend` calls, every capability Clay can supply is composed into one `createHost({...})` object built by `HostClay.createClayHost()` and passed to Flight functions (or their capability slices) by the caller. Slots wired today: `app` (+`app.loop`), `clipboard`, `dialog`, `screen`, `graphics.bitmapReadback`/`graphics.bitmapEncode`, `text.fontLoading`, `media.audioCodec`/`media.audioDevice`/`media.video`, `input.haptics`/`input.ingress`, `net.http`, `system.platform`/`system.lifecycle`, and — on `sys` targets — `storage.local`/`storage.fileSystem`. Text measurement rides the surviving `setTextLayoutMeasureProvider` provider seam (not a host slot); the preferred `@flighthq/textshaper` `setTextShaperBackend` seam is not yet emitted by the generator. Adapters exist for the GL surface, cursor, and net as well; deeper Clay implementations remain `TODO(hostClay)`. **Not yet compile-verified against develop** — Clay is not pinned in `haxe_libraries/`, so this package cannot be built in-repo (see Verification status).

## Seam parity with hostLime

| Flight seam (registration) | hostLime | hostClay | status |
| --- | --- | --- | --- |
| render surface (`create*RenderState`) | `GlSurface.createGlSurface` | `GlSurface.createClayGlSurface` | **complete** — object-shaped WebGL context over Clay's static `GL`; all 102 methods `WebGl2Backend` dispatches are forwarded (coverage-gated), 6 GLES3 gaps throw |
| app (`setAppBackend`) | `LimeApp.createLimeAppBackend` | `ClayApp.createClayAppBackend` | implemented (name/quit); focus/showApp TODO (Clay windowing) |
| loop (`setLoopBackend`) | `LimeLoop.createLimeLoopBackend` | `ClayLoop.createClayLoopBackend` | implemented — pump driven from `clay.Events.tick` (see Loop wiring) |
| net (`setNetBackend`) | `LimeNet.createLimeNetBackend` | `ClayNet.createClayNetBackend` | js delegates to web backend; native transport TODO |
| cursor (`setCursorBackend`) | `LimeCursor` | `ClayCursor` | stub (SDL system cursor mapping TODO) |
| storage (`setStorageBackend`) | `LimeStorage` | `ClayStorage` | in-memory (session-functional); file persistence TODO |
| filesystem (`setFileSystemBackend`) | `LimeFileSystem` | `ClayFileSystem` | stub (`sys.io` on native TODO) |
| clipboard (`setClipboardBackend`) | `LimeClipboard` | `ClayClipboard` | stub (SDL clipboard TODO) |
| dialog (`setDialogBackend`) | `LimeDialog` | `ClayDialog` | stub (no portable SDL dialog — honest gap) |
| audio context (injected `AudioContext`) | `LimeAudio.createLimeAudioContext` | — | **not yet stubbed**: return type is the toolkit `AudioContext`; needs a SoLoud-backed node-graph emulation like LimeAudio's over `lime.media`. Tracked, not faked. |

**Track once `builder`'s hostLime work lands:** per-window input (`InputManager`), native image decode (`ImageBackend`), and glyph rasterization (`GlyphRasterizerBackend`/`TextShaperBackend`) — new seams being added to hostLime. hostClay should mirror them (Clay input events + `linc_stb` for image/glyph, matching Clay's own stack).

## Divergences from hostLime (design-relevant)

- **GL is static, not an object.** Lime hands Flight `window.context.webgl` (a WebGL context object). Clay exposes `clay.opengl.GL` as static functions, so `GlSurface` synthesizes the object shape via `ClayGlContext`, forwarding each WebGL method to the Clay static. Handle types differ (WebGL opaque objects vs linc_opengl typed ids); Flight treats them opaquely, so the boundary widens to `Dynamic`.
- **No Cairo.** 2D rides `scene2d-gl`, not a raster canvas backend.
- **Audio is SoLoud** (`clay.Audio` via `linc_soloud`), not `lime.media`.
- **Text/image via `linc_stb`** (stb_truetype / stb_image), matching Clay's stack.

## Loop wiring

Clay is subclass-driven (no `onUpdate` signal). The host app's `clay.Events` subclass must forward its frame to the loop backend:

```haxe
class MyEvents extends clay.Events {
  var host:flight.types.Host;
  override function ready() { host = flight.hostClay.HostClay.createClayHost(); /* pass host / host.<slice> to Flight */ }
  override function tick(delta:Float) { flight.hostClay.HostClay.pumpLoop(); }
}
```

## Dependencies to pin (not on haxelib — git, like Lime)

The haxelib name `clay` is a **different** project (an ECS). Pin the ceramic-engine Clay and its linc bindings by git ref, the way `haxe_libraries/lime.hxml` pins Lime:

- `gh://github.com/ceramic-engine/clay#<sha>` — add classpaths `src` **and** `src-opengl` (Clay's `haxelib.json` declares only `src`; the GL backend lives in `src-opengl`, normally added by Ceramic tooling), and `src-miniaudio` if using SoLoud audio.
- `linc_opengl`, `linc_ogg`, `linc_stb`, `linc_timestamp`, `linc_soloud` — `gh://github.com/ceramic-engine/<name>#<sha>`.
- Native SDL2/GLEW are vendored in Clay's `project/` and built by hxcpp; not separate libs.

Defines: `-D clay -D clay_native -D clay_sdl -D clay_use_glew -D clay_soloud -D clay_app_id=<id>` (native) or `-D clay -D clay_web -D web` (web).

## Verification status (honest)

- **Migrated to develop's host-slot model by inspection; not yet compile-verified against develop.** The install-based aggregator was rewritten to compose `createHost({...})` (see Architecture). Because Clay is not pinned in `haxe_libraries/`, the package cannot currently be built in this repo, so the develop migration is verified structurally (mirroring the compile-green `flight.hostLime`) rather than by a Haxe compile. An earlier install-based revision did typecheck with `-cp src -cp generated` + Clay (pinned `8ae994a`) + `linc_opengl/linc_ogg/linc_stb/linc_timestamp` + `-D clay -D clay_web -D web` via `--macro include('flight.hostClay')`; re-establishing that gate against develop is tracked below.
- **GL adapter is complete and coverage-gated.** render-gl routes all GL through `flight._internal.backend.WebGl2Backend`, which dispatches **102** distinct methods on the context (`GlContext = Dynamic` on Clay, so unchecked at compile time). `ClayGlContext` forwards all 102 to `clay.opengl.GL`; `tests/generator/hostclay-gl-coverage.test.ts` asserts completeness from source. Measured GL capability of Clay's binding vs the 102 required: **native `opengl.WebGL` (linc_opengl) covers 96/102; web covers 90/102.** The 6 native gaps are GLES3 methods absent from linc_opengl (`texImage3D`, `texStorage3D`, `compressedTexSubImage3D`, `readBuffer`, `clearBufferfi`, `vertexAttribIPointer`) — the adapter throws a clear unsupported error for these rather than corrupting GL state, so a scene that needs 3D/array textures, integer vertex attributes, or MRT read-buffers fails loudly. The other 96 map 1:1. (web also lacks VAO/instancing/`drawBuffers`, but Clay-on-web is not the intended target; native is.)
- **Clay pin.** Clay HEAD has internal drift (`GLGraphicsDriver` doesn't satisfy Clay's own `GraphicsDriver` spec, introduced by the `GraphicsBatcher` refactor `c24a8ac`). Pin at its parent `8ae994a`, which compiles clean. hostClay never uses Clay's graphics driver, but a full Clay compile needs the clean pin.

### Remaining to full maturity

- **Deep seam impls** (currently sentinel-copy with `TODO` overrides): native net (haxe.Http), SDL clipboard/cursor, storage persistence + filesystem over sys.io, app focus/paths.
- **Audio** (`AudioContext` over SoLoud) — not yet adapted.
- **New seams** as hostLime grows: screen/platform/lifecycle/haptics, and image/glyph via `linc_stb`.
- **Build integration**: pin clay + linc in `haxe_libraries/` and add a hostClay compile target so it is CI-checked, not verified ad-hoc. (Attempted: `lix install` of the linc libs works, but pinning clay at a specific commit needs the GitHub API host, which was network-blocked in the sandbox — this needs a host-side network allowance or a tag-based clay pin. Until then the compile is verified with the libs registered via `haxelib dev`.)
- **Native smoke**: SDL/GLEW link + a Clay window running a Flight scene (the gated native-toolchain step).
