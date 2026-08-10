# flight-hx

`flight-hx` is a mechanically generated Haxe source port of the Flight SDK. It preserves Flight's deliberately searchable free-function API under source-derived `flighthq.*` packages and uses `flight` as the Haxelib name.

The current generation accounts for all 143 upstream packages, 32,998 public exports, and 1,419 upstream test files. Lowering has zero diagnostics, and every translated package suite passes through compiled Haxe JavaScript bridges (the Node-only `tool-capture` CLI is the one recorded exclusion).

## API shape

Use a granular package module when you know the Flight domain:

```haxe
import flighthq.geometry.Vector2.*;
import flighthq.types.Vector2.Vector2Like;

final point:Vector2Like = createVector2(3, 4);
trace(getVector2Length(point));
```

Use the generated SDK facade for broad discoverability:

```haxe
import flighthq.sdk.Sdk.*;

final point = createVector2(3, 4);
```

Qualified calls such as `flighthq.geometry.Vector2.createVector2()` and `flighthq.geometry.Geometry.createVector2()` work as well. Function names remain unchanged; `createVector2` does not become a constructor, and `getVector2Length` does not become an instance method. Canonical shared types remain in their defining modules under `flighthq.types`.

## Lime host

`flighthq.hostLime.LimeApp` provides the optional Lime application backend. A Lime application explicitly installs it with `flighthq.app.App.setAppBackend(LimeApp.createLimeAppBackend(this))`, matching the factory-based Capacitor, Tauri, and Electron hosts. The adapter does not own the Lime application lifecycle or renderer. It is compiled only when Lime's `lime` define is active, so the base Flight library does not require Lime. The adapter still needs verification against an installed Lime toolchain.

## Repository setup

Node.js 22 and npm install the project tooling, the exact Haxe 4.3.7 compiler, Lix, and pinned Haxe libraries locally:

```sh
git submodule update --init --recursive
npm ci
npm run setup
```

No global Haxe or Lix installation is required. The setup fallback currently supports Linux x64 and uses `curl` and `tar`. The complete portability matrix additionally needs Python 3 and a C++ compiler (`g++` or `clang++`). Haxelib package-install verification needs Neko for the Haxe-distributed `haxelib` executable.

## Commands

```sh
npm run generate       # regenerate generated/, bridges, and reports
npm run check          # drift, type, lint, format, and API checks
npm run test           # unit, Haxe, portability, and upstream parity suites
npm run test:coverage  # maintained TypeScript coverage
npm run package        # build, install, and consume the Haxelib zip
npm run ci             # complete release-quality surface
```

Generated Haxe under `generated/` is disposable. Maintained runtime and host integration live under `src/`; generator code and semantic patches live under `tools/generator/`. Change those sources instead of editing generated output. See [AGENTS.md](AGENTS.md) and [agents/architecture.md](agents/architecture.md) for the durable design.

## Porting to native targets

Native rendering uses the same generated code as the web, with two rules that are easy to miss:

- **Mark adapter classes `@:keep`.** Objects you hand to Flight (renderers, canvas/surface adapters, texture resolvers, media sources) are currently reached reflectively, so dead-code elimination will silently strip members the compiler cannot see being used, and Haxe properties (`get`/`set`) reflect as absent — use plain physical fields for values Flight reads (for example a surface's `width`/`height`). `flighthq.scene2dCairo.CairoSurface` is the reference adapter. Typed protocol access is planned, which will turn these rules into ordinary compile-time contracts.
- **On Neko, callbacks must match arity exactly.** Neko dispatch requires the declared parameter count, including trailing optionals; JavaScript's drop-or-pad tolerance does not apply. Prefer callbacks without optional parameters, and call optional-arity Flight endpoints with every argument supplied. C++ (`hxcpp`) is the primary native target and does not have this restriction; Neko remains supported as the fast-iteration target.
- **On Neko, `-dce full` is required.** Without dead-code elimination the whole generated SDK links into the module (~9 MB), and Neko fails at load with `module.c(560) : Stack check failed for function scope` — an error that looks nothing like its cause. Every project under `examples/` sets `<haxeflag name="-dce" value="full" />`; copy it into any new Lime project consuming this library.
- **Public escapes for toolkit types.** Consumer code should not reach into `flighthq._internal`: typed arrays are exported at the package root (`flighthq.Float32Array`, `flighthq.UInt8Array`, … — natively their constructors accept `haxe.io.Bytes` directly, so SWF or asset bytes wrap without an element copy), the union carrier as `flighthq.Union2`, and Lime font registration as `flighthq.hostLime.LimeFonts.registerLimeFont`.

The examples under `examples/` are working Lime applications demonstrating the full wiring, including the per-frame present-skip (`window.onRender.cancel()`) that avoids double-buffer flicker when a scene is unchanged.
