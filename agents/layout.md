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
├── generator/
│   └── src/
│       ├── analyze/             # TS program, symbols, exports
│       ├── model/               # normalized intermediate representation
│       ├── lower/               # TypeScript-to-Haxe semantic lowering
│       ├── patch/               # patch loading, matching, validation
│       ├── emit/                # deterministic Haxe and report emission
│       └── cli.ts
├── patches/
│   ├── manifest.ts              # typed declarative patch manifest
│   ├── bodies/                  # replacement Haxe bodies
│   ├── declarations/            # replacement/additional declarations
│   └── modules/                 # rare whole-module replacements
├── templates/
│   └── runtime/                 # maintained portable/runtime Haxe
├── src/                         # entirely generated Haxelib classpath
│   └── flight/
│       ├── Sdk.hx
│       ├── Types.hx
│       ├── Geometry.hx
│       └── ...
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
├── package.json
├── package-lock.json
└── tsconfig.json
```

## Maintained and Generated Boundaries

Maintained sources are `generator/`, `patches/`, `templates/`, `tests/`, root configuration, and agent documentation. `src/` and `reports/` are generated. `build/` is transient and ignored.

Never edit `src/` to fix a port. Change the generator, configuration, a semantic patch, or a runtime template, regenerate, and verify idempotence.

Every generated file begins with a banner naming its source of truth and the command that regenerates it. The generator owns ordering and formatting inside generated Haxe.

## Publishing Shape

The development repository uses additional test classpaths internally, while the Haxelib artifact presents one conventional `src` classpath. Runtime templates and patch fragments are assembled into that classpath during generation.

The current `haxelib.json` values are:

```text
name: flight
classPath: src
```

The package archive includes generated API, inventory, lowering, patch, parity, and provenance records under `generation/`, including the exact upstream revision. The current version remains the pre-release `0.0.0` until a release policy is chosen.

## Generated Source Version Control

Commit `src/` and the stable reports needed for review. This makes upstream updates and translator changes visible as ordinary diffs and leaves a checkout immediately usable by Haxelib tooling. Scripts support both generation from nothing and drift checking of an existing tree.
