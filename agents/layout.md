# Repository Layout

The repository separates maintained inputs from disposable and transient outputs:

```text
flight-hx/
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── agents/
│   ├── README.md
│   ├── architecture.md
│   ├── layout.md
│   ├── patches.md
│   ├── plan.md
│   ├── quality.md
│   └── status.md
├── upstream/                    # read-only Flight git submodule
├── src/                         # maintained publishable Haxe classpath
│   └── flighthq/
│       ├── _internal/           # hidden portable runtime types
│       └── hostLime/            # optional Lime host and backend
│           └── LimeApp.hx
├── generated/                   # disposable generated Haxe classpath
│   └── flighthq/
│       ├── Sdk.hx
│       ├── Types.hx
│       ├── Geometry.hx
│       └── ...
├── tools/
│   ├── generator/
│   │   ├── src/                 # analyzer, IR, lowering, patching, emitter
│   │   ├── patches/             # typed manifest and Haxe fragments
│   │   └── port.config.ts
│   ├── haxe.mjs
│   ├── package-haxelib.mjs
│   └── ...
├── tests/
│   ├── generator/               # analyzer/lowering/emitter tests
│   ├── fixtures/                # small TS and expected-Haxe fixtures
│   ├── haxe/                    # consumer API and runtime tests
│   ├── package/                 # clean Haxelib consumer fixture
│   └── bridges/                 # generated package/source ESM bridges
├── reports/                     # generated inventory/API/lowering/patch/parity reports
├── build/                       # ignored transient output
│   ├── haxe-js/
│   ├── package/
│   └── portable/
├── haxe_libraries/              # committed Lix dependency specifications
├── .haxerc                      # exact Haxe compiler selection
├── haxelib.json                 # Haxelib name flight; classPath src
├── extraParams.hxml             # adds the generated classpath
├── package.json
├── package-lock.json
└── tsconfig.json
```

## Maintained and Generated Boundaries

Maintained sources are `src/`, `tools/`, `tests/`, root configuration, and agent documentation. `generated/` and `reports/` are generated. `build/` is transient and ignored.

Never edit `generated/` to fix a port. Change the generator, configuration, a semantic patch, or the maintained runtime under `src/flighthq/_internal/`, regenerate, and verify idempotence. Generation fails if maintained and generated classpaths contain the same Haxe module.

Every generated file begins with a banner naming its source of truth and the command that regenerates it. The generator owns ordering and formatting inside generated Haxe.

## Publishing Shape

The Haxelib artifact uses `src` as its conventional primary classpath and adds `generated` through `extraParams.hxml`. Repository commands pass both classpaths explicitly.

The current `haxelib.json` values are:

```text
name: flight
classPath: src
extraParams.hxml: -cp generated
```

The package archive includes generated API, inventory, lowering, patch, parity, and provenance records under `generation/`, including the exact upstream revision. The current version remains the pre-release `0.0.0` until a release policy is chosen.

## Generated Source Version Control

Commit `generated/` and the stable reports needed for review. This makes upstream updates and translator changes visible as ordinary diffs and leaves a checkout immediately usable by Haxelib tooling. Scripts support both generation from nothing and drift checking of an existing tree.
