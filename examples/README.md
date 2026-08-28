# Lime examples

Faithful, **line-by-line** Haxe/Lime ports of every example under [`upstream/examples/packages`](../upstream/examples/packages), written directly against the generated Flight Haxe surface (`flight.*`). Each example is an ordinary, **self-contained** Lime project — a `project.xml` and a single `Main.hx` — with no shared base class or helper module.

## Structure

Each `Main.hx` is a standalone `lime.app.Application`. Every statement of the upstream `app.ts` is translated faithfully; only the irreducible browser glue is adapted onto Lime's lifecycle:

- Flight's Lime host capabilities are enabled in `onWindowCreate` with `HostLime.enableHostLime(this)`, followed by the GL render-state setup and renderer registration for the kinds the example draws.
- The upstream `./render` module and `render(root)` become the `render(context)` override; its `scale` becomes `window.scale`.
- `requestAnimationFrame` + `performance.now()` become the `update(deltaTime)` override.
- Browser input is normally wired to Lime callbacks directly. The `interaction` port demonstrates the reusable, disposable `LimeInput.attachLimeInput()` adapter for Flight's `InputManager`, including pointer, keyboard, composition/text, touch, and optional gamepad events.
- Browser-only asset painting (Canvas-2D texture generation, DOM control panels, Web Audio/Video output) is reduced to a minimal in-file stub that keeps the surrounding Flight SDK call sites identical.

The full scene graph, materials, meshes, labels, and per-frame logic are otherwise a direct port. 3D examples (`scene3d`, `skeleton`) inline the upstream WebGL scene path (`createGlRenderEffectPipeline` → `prepareSceneRender` → `drawGlScene`).

## Prerequisites

Running an example needs a Haxe compiler and the Lime command-line tool on the host. `npm run setup` provisions the repository-local Haxe and the pinned Haxe libraries (including the `lime` classpath used at compile time), but the Lime _command_ that turns a `project.xml` into a build is a separate Haxelib install:

```sh
haxelib install lime      # provides the `lime` command plus its native ndll
```

Haxe itself can come from the repo-local toolchain (`npm run setup`), a system package (`apt install haxe`), or npm. The `html5` target compiles to JavaScript and needs no native `lime.ndll`; the desktop targets (`linux`/`windows`/`mac`) additionally require Lime's native library — the prebuilt one from a Lime Haxelib release, or `lime rebuild cpp`.

## Running

From an example directory, use Lime normally:

```sh
cd examples/clock
lime test html5
lime test linux     # or windows / mac
```

The root convenience command delegates to the same Lime project:

```sh
npm run example -- clock html5
```

Each `project.xml` loads this checkout as the local `flight` Haxelib (maintained `src/` and generated `generated/` classpaths). No Vite, npm dev server, or JavaScript bridge is involved.

## Ports

- `adjustments` — color adjustments (brightness/contrast/hue) via color-matrix composition
- `benchmark` — batched quad rendering with bouncing-ball physics (bunnymark)
- `bitmap` — bitmap display objects with transform/alpha
- `camera2d` — 2D game camera: deadzone follow, zoom, parallax layers
- `clock` — hierarchical scaled/pausable clocks driving spinning shapes
- `collision` — 2D colliders (circle/AABB/polygon) with manifolds and MTV
- `effects` — post-processing effect chain (bloom + vignette + tone-map)
- `flowstates` — screen/mode flow-state stack (boot → menu → play → pause → game-over)
- `interaction` — pointer interaction and hit testing (hover/drag/overlap)
- `motionpath` — bezier path following with heading and loop modes
- `movieclip` — timeline-driven frame animation with frame labels/scripts
- `particleeditor` — particle emitter with editable curves, forces, blend modes
- `particles` — particle emitters with textures, forces, additive blending
- `pathboolean` — path boolean ops (union/intersect/difference/xor)
- `platformer` — 2D platformer physics with camera follow and lifecycle
- `scene3d` — 3D scene: StandardPbr materials, mesh primitives, camera, lights
- `shapes` — shape gallery: fills, strokes, curves, polygons, caps/joins
- `skeleton` — skeletal animation on a 3D mesh (joint chain, skinning)
- `snapshot` — game-state snapshot capture/restore/equality/interpolation
- `sound` — audio buses with gain/pan and a mixer, interactive controls
- `spatial` — broadphase spatial queries on a uniform grid
- `spring` — spring-physics animation vs. a damped follower
- `spritesheet` — spritesheet animation playback (slicing, frame regions, modes)
- `text` — text labels and RichText: alignment, word-wrap, styles, border
- `textinput` — editable text fields with focus, caret, undo/redo, restrictions
- `tilemap` — procedural tilemap built from a tileset and tile data
- `tween` — tween animation across easing families
- `video` — video display objects with transforms and per-frame updates
