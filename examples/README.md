# Lime examples

These are mechanical Haxe ports of every package under `upstream/examples/packages`. Each example is an ordinary Lime project with a `project.xml` and `Main.hx`. Their local `ExampleHost` extends `lime.app.Application`, explicitly installs `LimeApp.createLimeAppBackend(this)`, and replaces the upstream Vite/browser render adapters.

The ports keep the upstream example names and core feature demonstrations. Browser lifecycle, keyboard, pointer, and overlay code is expressed with Lime callbacks. Procedurally generated browser canvas assets are represented by asset-free Flight shapes where a native Lime image/media bridge would otherwise be required.

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

Each `project.xml` loads this checkout as the local `flight` Haxelib, which supplies both maintained `src/` and generated `generated/` classpaths, and adds the shared presentation helper in `examples/common/`. No Vite, npm development server, or JavaScript bridge is involved.

## Ports

- `adjustments`
- `benchmark`
- `bitmap`
- `camera2d`
- `clock`
- `collision`
- `effects`
- `flowstates`
- `interaction`
- `motionpath`
- `movieclip`
- `particleeditor`
- `particles`
- `pathboolean`
- `platformer`
- `scene3d`
- `shapes`
- `skeleton`
- `snapshot`
- `sound`
- `spatial`
- `spring`
- `spritesheet`
- `text`
- `textinput`
- `tilemap`
- `tween`
- `video`
