# Host adapter adaptation to develop seams (hostLime + hostClay)

Status: write-ahead blueprint, 2026-08-29. The user directed moving Flight to upstream develop (`2cf1c5cef`, 230 commits past `0.4.0`) for its better host-integration seams and maturing **both** hostLime and hostClay against them. builder owns the pin + regenerate + typed-struct re-audit (446 fingerprint-locked entries; regeneration currently fails on `WgpuShapeRasterSurface` drift). This doc is the mechanical adaptation plan so the adapter code lands fast — and correct — the moment the regenerated develop base is on the tree. **Nothing here compiles until then**; Haxe names below are predicted from the established generation pattern (`@flighthq/<pkg>` → `flight._<Facade>`, host slot `install<Name>HostBackend` as a `private static` `@:allow(flight)` function, `_sentinel__<name>` for sentinel-backed seams) and must be reconciled against the generated output.

## Why this migration (closes the gaps in `host-lime-maturity.md`)

develop turns the awkward host gaps into installable backends: Net gains a host slot, Audio gains a real backend contract, Input gains a normalized ingress seam, text/font/bitmap gain seams, and `BackendOperationExplanation` enables per-operation partial-backend capability reporting.

## New seams → Haxe host slot → Clay impl → Lime impl

| Seam (develop) | owning pkg → Haxe install fn | shape | Clay impl | Lime impl |
| --- | --- | --- | --- | --- |
| `AudioDeviceBackend` | `@flighthq/media` → `flight._Media.installAudioDeviceHostBackend` | handle-keyed full impl (createDevice/Buffer/Source, start/stop/setSourceGain/setSourcePlaybackRate, getDeviceTime, onSourceEnded, resume, destroy\*) | `clay.soloud.SoloudAudio` (native) — device=SoLoud instance, source=voice handle, buffer=`SoloudAudioData`; gain=setVolume, rate=setRelativePlaySpeed, getDeviceTime=SoLoud clock | port builder's `LimeAudio` buffered-playback logic (offset/duration mapping) onto the handle-keyed shape over `lime.media.AudioSource` |
| `AudioBackend` | `@flighthq/audio` → `flight._Audio.installAudioHostBackend` | pure `canPlayType(mime)` query | static mime allowlist (ogg/wav/mp3 per SoLoud) | static mime allowlist per Lime codecs |
| `InputIngressBackend` | `@flighthq/input` → `flight._Input.installInputIngressHostBackend` | registration: `attachPointer/Keyboard/Wheel/RelativePointer/Text/Gamepad(source, sink, options) → dispose`; optional pointer-lock | bridge `clay.Events` (mouseDown/Up/Move/Wheel, keyDown/Up, text, touch, gamepad\*) → `sink.*`; app forwards raw events to a `ClayInputIngress` dispatcher (like `ClayLoop.pump`) | port builder's disposable `LimeInput` per-window logic (touch ownership, gamepad opt-in, disposers) onto `attach*` |
| `NetBackend` host slot | `@flighthq/net` → `flight._Net.installNetHostBackend` | install slot (was `setNetBackend` only) | move `ClayNet` native transport (haxe.Http) behind the install slot | **unblocks** builder's `LimeNet` (`lime.net.HTTPRequest`) — it was implemented but had no host slot |
| `FontLoadingBackend` | `@flighthq/font` → `flight._Font.installFontLoadingHostBackend` | font-face load | `linc_stb` (stb_truetype) face load | Lime font / Cairo face load (builder's `LimeFonts`) |
| `TextShaperBackend` | `@flighthq/textlayout` → `flight._TextLayout.setTextShaperBackend` (set\*, no host slot) | shape/measure | `linc_stb` metrics (no shaping) or a stub; HarfBuzz later | Cairo/HarfBuzz shaper |
| `BitmapReadbackBackend` | `@flighthq/bitmap` → `flight._Bitmap.installBitmapReadbackHostBackend` | GL/surface readback | `GL.readPixels` via the ClayGlContext (note: `readBuffer` is one of the 6 GLES3 gaps) | Lime/Cairo readback (builder's image path) |
| `BitmapEncodeBackend` | `@flighthq/bitmap` → `flight._Bitmap.installBitmapEncodeHostBackend` | encode png/jpg | `linc_stb` (stb_image_write) | Lime image encode |
| `VideoCapabilityBackend` | `@flighthq/video` → `flight._Video.installVideoCapabilityHostBackend` | capability query | sentinel (Clay has no video) | sentinel unless Lime video |
| `WgpuHostBackend` | `@flighthq/render-wgpu` → `flight._RenderWgpu.installWgpuHostBackend` | acquisition-scoped WebGPU device/surface | **not a Clay facility** — defer to wgpu-native path (host-strategy.md), do not fake | not a Lime facility (builder's note); window/surface only |

## Partial-backend capability reporting

develop adds `BackendOperationExplanation` and `observe<Name>HostResult(op, ok)` (seen in `host-web/webAudioDevice.ts`). Host backends should call the observer per operation so `explain*Backend()` can report at operation granularity instead of whole-backend — this is the fix for `host-lime-maturity.md` issue #3 (broad interfaces obscuring partial support). Both hosts wire it.

## Aggregator updates

`HostClay.enableHostClay()` and `HostLime.enableHostLime()` install the new backends in addition to the existing ones: audio-device, input-ingress, net (now via `installNetHostBackend`), font, bitmap readback/encode. Input and audio-device are handle-/registration-scoped and caller-owned per `upstream/agents/backend-lifecycle-ownership.md`, so they are attached/created by the caller, not blanket-installed — mirror hostLime's per-window/per-context ownership.

## hostClay seams to re-check after regenerate

The existing hostClay adapters (app/loop/net/cursor/storage/filesystem/clipboard/dialog) and the 102-method `ClayGlContext` were verified against `0.4.0`. After the develop regenerate: re-run the GL coverage gate (`WebGl2Backend`'s method set may have changed), re-check the sentinel names (`_sentinel__*`) and `install*HostBackend` signatures, and confirm `flight._Net` gains the install slot so `ClayNet`/`LimeNet` move onto it.

## Verification plan (once develop base lands)

1. Rebase onto builder's regenerated develop base.
2. Compile `--macro include('flight.hostClay')` / `include('flight.hostLime')` against the new generated `flight.types.*` + `flight._*` + Clay(`8ae994a`)/Lime; reconcile predicted names.
3. Re-run the hostClay GL coverage gate; add coverage gates for the new seams if useful.
4. Native smoke remains the gated end-to-end proof.

## Completion status (write-ahead committed)

**hostClay — comprehensive (21 seams, `#if clay`).** New develop backends: audio-device (full over SoLoud), audio (`canPlayType`), input-ingress (`clay.Events`→sink), net-install, font (registry + stb), bitmap readback (`GL.readPixels`) + encode (stb), text-shaper (stb metrics), video (honest negative), screen/platform/lifecycle/haptics (sentinel-copy + Clay overrides). Existing seams upgraded to real: filesystem (`sys.io`) and storage (write-through JSON). `HostClay.enableHostClay()` installs all of them. Remaining hostClay: clipboard/cursor stay honest sentinels until SDL access via Clay's runtime is wired; app focus/paths is partial.

**hostLime — the genuinely new-shape seams only (`#if (lime && flight_host_develop)`).** Written: `LimeInputIngress` and `LimeAudioDevice` (reshaping builder's Lime logic onto the new seams). NOT rewritten here: builder already owns mature `LimeFonts`, image loading, `LimeScreen`/`LimePlatform`/`LimeLifecycle`/`LimeHaptics`, `LimeNet`, and glyph rasterization — reconciling those to the develop seam shapes (FontLoadingBackend, Bitmap\*, TextShaper, the net install slot, capability backends) is builder's on their own code during the regenerate, to avoid a blind rewrite that loses their nuances. The blueprint rows above are the spec for that reconciliation.

Everything is write-ahead: it compiles only after builder's develop regenerate lands. CI is unaffected — hostClay's `#if clay` is never built in CI, and hostLime's extra `flight_host_develop` guard keeps it out of `test:haxe:lime`.
