# flight-hx

`flight-hx` is a mechanically generated Haxe source port of the Flight SDK. It preserves Flight's deliberately searchable free-function API in a flat `flight.*` namespace and uses `flight` as the Haxelib name.

The current generation accounts for all 131 upstream packages, 1,898 source files, 9,122 candidate declarations, 12,149 public exports, and 1,166 upstream test files. Lowering has zero diagnostics, and all 131 package suites pass through compiled Haxe JavaScript bridges.

## API shape

Use a granular package module when you know the Flight domain:

```haxe
import flight.Geometry.*;
import flight.Types.Vector2Like;

final point:Vector2Like = createVector2(3, 4);
trace(getVector2Length(point));
```

Use the generated SDK facade for broad discoverability:

```haxe
import flight.Sdk.*;

final point = createVector2(3, 4);
```

Qualified calls such as `flight.Geometry.createVector2()` and `flight.Sdk.createVector2()` work as well. Function names remain unchanged; `createVector2` does not become a constructor, and `getVector2Length` does not become an instance method. Canonical shared types live in `flight.Types`, because Haxe secondary types cannot be duplicated across flat package modules.

## Lime host

`flighthq.HostLime` is a maintained optional host for rendering a Flight scene through Lime. Add Lime to the application, subclass `HostLime`, create the scene in `flightReady`, update it in `flightUpdate`, and assign its root to `root`. The module is compiled only when Lime's `lime` define is active, so the base Flight library does not require Lime. The adapter still needs verification against an installed Lime toolchain.

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
