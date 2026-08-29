# hostWeb browser smoke (CI)

The `web-browser` job of `.github/workflows/host-backends.yml`. It **builds and runs** the compiled Flight SDK in a **real headless Chromium** (SwiftShader software GL) and fails loudly on a regression. It fans out across **Linux, macOS, and Windows** runners so a per-OS browser regression is visible by name. This is the web-target counterpart to the Clay native smoke: it gives the signal that `node` + `jsdom` cannot — that the SDK loads and real WebGL2 works in an actual browser.

## What it verifies

`smoke.mjs` loads `build/haxe-js/flight.cjs` into a browser page and asserts:

| Check | What it proves |
| --- | --- |
| flight SDK loads in browser | `window.flight` initializes and exposes its public facades (`App`, `Application`, `RenderGl`, `Bitmap`, `Audio`, …) — the Haxe→JS bundle runs end to end in a browser, not just under node |
| WebGL2 render + readback (green) | a real `webgl2` context clears and `readPixels` returns the cleared color — the browser GL path the `RenderGl` / `WebGl2Backend` layer targets actually works on the runner |

The script `process.exit(1)`s if any check fails.

## How CI runs it

1. Shared `./.github/actions/toolchain` (Node + pinned Haxe).
2. `npm run build:haxe:js` → `build/haxe-js/flight.cjs`.
3. `npm i --no-save playwright` + `npx playwright install --with-deps chromium`.
4. `node tests/host-web/browser-smoke/smoke.mjs`.

Playwright is installed ad hoc in the job rather than added to the repo lockfile, so this browser-only dependency does not touch the fast `ci.yml` lane.

## Run locally

```bash
npm run build:haxe:js
npm i --no-save playwright && npx playwright install --with-deps chromium
node tests/host-web/browser-smoke/smoke.mjs
```

## Scope and follow-ups

- This is the **first** hostWeb job: it confirms the SDK loads in a browser and the browser's WebGL2 works. Driving Flight's full GL pipeline in-browser (`createGlContextFromCanvasElement` → render a frame → read it back through `flight.RenderGl`) is the natural next assertion, matching the depth the Clay job will reach once it compiles the real adapters.
- Flight's web host path is the SDK's **default** browser behavior (there is no separate `src/flight/hostWeb/` package — the JS-target implementations are the web backend), so this job exercises the generated SDK directly rather than a host-adapter module.
