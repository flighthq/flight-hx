# hostClay native smoke (CI)

A GitHub Actions job that **builds and runs** hostClay's core native paths on a stock `ubuntu-latest` runner — headless, with software Mesa GL under Xvfb and an ALSA null device — and fails loudly on any regression. This is the confirm-it-works-in-CI counterpart to the Haxe/JS compile checks: it proves the native libraries hostClay's adapters call actually link and run.

## What it verifies

`NativeSmoke.hx` exercises the same native libraries hostClay's adapters use, asserting real results:

| Check | hostClay adapter | Native path |
| --- | --- | --- |
| GL render + readback (green pixel) | `GlSurface` / `ClayGlContext` | linc_opengl `viewport`/`clearColor`/`clear`/`readPixels` on a real GL context |
| Bitmap encode (valid PNG) | `ClayBitmap` | linc_stb `write_png_to_mem` |
| Clipboard roundtrip | `ClayClipboard` | SDL `SetClipboardText`/`GetClipboardText` |
| Audio init + PCM buffer + play | `ClayAudioDevice` | SoLoud `init` + `loadRawWave(PCM)` + `play` → active voice |

The program `Sys.exit(1)`s if any check fails, so the CI job goes red.

## How CI runs it

The `clay-native` job of `.github/workflows/host-backends.yml` (on `workflow_dispatch` and on changes under `src/flight/hostClay/**` or the host test dirs):

1. `apt` installs SDL2, GLEW, Mesa (software GL), ALSA, OpenAL, Xvfb.
2. Haxe 4.3.7 + hxcpp.
3. `setup-native.sh` fetches Clay + the linc bindings at **pinned revisions** (fetch-by-SHA; the vendored GLEW and SoLoud core come from submodules, with system-GLEW / curl fallbacks), registers them via `haxelib dev`, and writes an ALSA null device so SoLoud can initialize without a sound card.
4. Compiles `NativeSmoke` to cpp and runs it under `xvfb-run` with `LIBGL_ALWAYS_SOFTWARE=1`.

## Run locally

```bash
bash tests/host-clay/native-smoke/setup-native.sh /tmp/native-deps
haxe -cp tests/host-clay/native-smoke -lib clay -lib linc_opengl -lib linc_stb -lib linc_soloud \
  -D clay -D clay_native -main NativeSmoke -cpp build/native-smoke
LIBGL_ALWAYS_SOFTWARE=1 xvfb-run -a -s "-screen 0 128x128x24 -ac" ./build/native-smoke/NativeSmoke
```

## Scope and follow-ups

- This is a **binding-level** smoke: it runs the native calls hostClay makes, not the compiled `flight.hostClay` adapters. A natural next job is compiling `--macro include('flight.hostClay')` to cpp against the on-base develop `generated/` (proves the real adapters link natively).
- A **full windowed** Clay + Flight render is a further step. On this software-GL/Xvfb setup, Clay's SDL3 window init doesn't complete headless (SDL3 GLX visual matching; and its EGL fallback trips system GLEW's GLX build). That is an environmental headless-GL-driver limitation — the raw GL, encode, clipboard, and audio paths above all run — and is expected to work on a runner with a real GL stack or via Clay's GLES path.
