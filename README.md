# flight-hx

`flight-hx` is a mechanically generated Haxe source port of the Flight SDK. It preserves Flight's deliberately searchable free-function API as root modules such as `flight.Geometry` and uses `flight` as the Haxelib name. Each public package facade has one completion-hidden implementation sibling (`flight.Geometry` → `flight._Geometry`); upstream source files do not become public Haxe modules.

The upstream npm scope remains `@flighthq/*`; `flight.*` is the Haxe namespace used by this port.

The current generation inventories 153 upstream packages, 36,488 export records, and 1,599 upstream test files. Lowering has zero diagnostics; the two tooling-only package exclusions and current parity results are recorded in the generated reports.

## API shape

Use the package facade when you know the Flight domain:

```haxe
import flight.Geometry.*;
import flight.types.Vector2Like;

final point:Vector2Like = createVector2(3, 4);
trace(getVector2Length(point));
```

Use the generated SDK facade for broad discoverability:

```haxe
import flight.Sdk.*;

final point = createVector2(3, 4);
```

The qualified form is `flight.Geometry.createVector2()`. Function names remain unchanged; `createVector2` does not become a constructor, and `getVector2Length` does not become an instance method. Every exported canonical type is directly addressable by name under `flight.types`, independent of its defining TypeScript file.

## Lime host

`flight.hostLime.LimeApp` provides the optional Lime application backend. A Lime application explicitly installs it with `flight.App.setAppBackend(LimeApp.createLimeAppBackend(this))`, matching the factory-based Capacitor, Tauri, and Electron hosts. The adapter does not own the Lime application lifecycle or renderer. It is compiled only when Lime's `lime` define is active, so the base Flight library does not require Lime. The adapter still needs verification against an installed Lime toolchain.

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

- **Mark adapter classes `@:keep`.** Objects you hand to Flight (renderers, canvas/surface adapters, texture resolvers, media sources) are currently reached reflectively, so dead-code elimination will silently strip members the compiler cannot see being used, and Haxe properties (`get`/`set`) reflect as absent — use plain physical fields for values Flight reads (for example a surface's `width`/`height`). `flight.Scene2DCairo.createCairoSurface` exposes the reference adapter. Typed protocol access is planned, which will turn these rules into ordinary compile-time contracts.
- **On Neko, callbacks must match arity exactly.** Neko dispatch requires the declared parameter count, including trailing optionals; JavaScript's drop-or-pad tolerance does not apply. Prefer callbacks without optional parameters, and call optional-arity Flight endpoints with every argument supplied. C++ (`hxcpp`) is the primary native target and does not have this restriction; Neko remains supported as the fast-iteration target.
- **On Neko, `-dce full` is required.** Without dead-code elimination the whole generated SDK links into the module (~9 MB), and Neko fails at load with `module.c(560) : Stack check failed for function scope` — an error that looks nothing like its cause. Every project under `examples/` sets `<haxeflag name="-dce" value="full" />`; copy it into any new Lime project consuming this library.
- **Public escapes for toolkit types.** Consumer code should not reach into `flight._internal`: typed arrays are exported at the package root (`flight.Float32Array`, `flight.UInt8Array`, … — natively their constructors accept `haxe.io.Bytes` directly, so SWF or asset bytes wrap without an element copy), the union carrier as `flight.Union2`, and Lime font registration as `flight.hostLime.LimeFonts.registerLimeFont`.

The examples under `examples/` are working Lime applications demonstrating the full wiring, including the per-frame present-skip (`window.onRender.cancel()`) that avoids double-buffer flicker when a scene is unchanged.
