# Flight Haxe Port

This repository builds a real, mechanically generated Haxe port of the Flight TypeScript SDK in [`upstream/`](upstream/). Externs are not a port. The emitted Haxe must contain executable implementations and must be reproducible from a fresh clone of the upstream submodule.

This document is the authoritative entry point for agents working in this repository. Keep it useful and current. Put durable project rules here and put detailed designs, plans, and continuity notes in [`agents/`](agents/README.md).

## Read Before Working

Read the documents relevant to the task:

- [`agents/architecture.md`](agents/architecture.md) for the translation model, public Haxe API, type placement, runtime boundary, and Vitest bridge.
- [`agents/layout.md`](agents/layout.md) before creating or moving files.
- [`agents/patches.md`](agents/patches.md) before adding an exception, override, template, handwritten Haxe fragment, or unsupported declaration.
- [`agents/quality.md`](agents/quality.md) before adding scripts or deciding which checks to run.
- [`agents/plan.md`](agents/plan.md) for the implementation sequence and completion criteria.
- [`agents/status.md`](agents/status.md) for current decisions, unresolved items, and the next safe work.
- [`upstream/AGENTS.md`](upstream/AGENTS.md) before translating Flight behavior or making assumptions about its package architecture and API conventions.

`upstream/` is the behavioral and API source of truth. Do not edit the submodule unless the user explicitly asks for an upstream Flight change.

## Non-Negotiable Goals

- Generate Haxe source implementations, not externs or declaration-only shells.
- Make generation deterministic and idempotent. Identical upstream, generator, configuration, templates, and patches must produce byte-identical output.
- Treat generated Haxe as disposable. Never solve a problem by editing generated output directly.
- Keep every handwritten exception in configuration, patches, templates, or the portable runtime source of truth.
- Account for every upstream public export. A declaration is translated, patched, or explicitly excluded with a recorded reason; it is never silently dropped.
- Fail loudly on unsupported syntax, stale patches, ambiguous mappings, duplicate Haxe names, or an output drift check.
- Cover all upstream packages. `tool-capture` may be scheduled after the runtime and SDK packages, but it is not silently outside the inventory.
- Preserve portability as the default. Target-specific code belongs behind explicit, narrow seams and conditional adapters, separate from bulk generated code.
- Compile generated Haxe to JavaScript and exercise it through the upstream Vitest harness. Reuse upstream test bodies and assertions wherever mechanically possible.

## API Preservation

Flight is intentionally optimized for globally searchable, free-function APIs. That property is more important than converting the port to an object-oriented Haxe style.

- Preserve exported Flight identifiers exactly whenever Haxe permits it.
- Keep free functions as module-level functions. Do not turn them into instance methods or abbreviate `verb + type + modifier` names.
- Keep `create<Type>` as the public allocation boundary. Do not rewrite it as public `new()`.
- Classes may be used as an internal representation when nominal identity or a target requires them, but they do not acquire behavioral methods merely to look idiomatic in Haxe.
- Preserve explicit `out` parameters, aliasing guarantees, sentinel returns, allocation vocabulary, and side-effect boundaries.
- Prefer a boring, grepable one-to-one mapping over a clever transformation.

The current public-module direction is flat under `flight`: `flight.Sdk` mirrors `@flighthq/sdk`, `flight.Geometry` mirrors `@flighthq/geometry`, and `flight.Types` mirrors `@flighthq/types`. See [`agents/architecture.md`](agents/architecture.md) for the compiler-enforced canonical type import rule and module details. Do not introduce public per-source or per-type ownership without a deliberate architecture change.

## Translation Discipline

- Parse TypeScript with a real TypeScript AST. Do not build a regex transpiler.
- Resolve symbols and the complete upstream export graph before emitting Haxe.
- Translate into a normalized intermediate representation, apply semantic patches to that representation, then emit Haxe.
- Target patches by stable upstream identity: npm package, source path, and export name. Do not target generated line numbers.
- Use normalized declaration fingerprints so upstream changes invalidate affected patches.
- Promote repeated exceptions into general lowering rules. Patches are for genuine exceptions, not a substitute for translator work.
- Retain upstream provenance for every emitted declaration so reports and errors lead back to the TypeScript source.
- Generate a machine-readable API/coverage manifest and patch audit on every full generation.

## Source Boundaries

The intended source-of-truth split is:

- `upstream/`: read-only Flight TypeScript input.
- `generator/`: TypeScript analyzer, intermediate model, transforms, and emitter.
- `patches/`: declarative semantic exceptions and handwritten fragments.
- `templates/`: portable runtime and JavaScript bridge source templates.
- `src/`: publishable Haxe classpath produced by generation.
- `tests/`: generator, Haxe, portability, and bridge tests.
- `build/`: ignored transient compiler and test output.

Do not put handwritten source-of-truth Haxe in `src/`. Runtime or adapter code that appears there must originate in `templates/` or a declared patch and be reproduced by generation.

## Tooling and Commands

Use `npm`, not pnpm or Yarn. The TypeScript generator, formatting, linting, Vitest, and the project-local Haxe toolchain share the root npm command surface.

The planned toolchain uses a pinned local Lix dependency. `package-lock.json` pins Node tooling and Lix, `.haxerc` pins Haxe, and committed `haxe_libraries/*.hxml` files pin Haxe libraries. Do not require a global Haxe or Lix installation.

The target quality commands are documented in [`agents/quality.md`](agents/quality.md). Until their implementations exist, do not claim that they ran. Once present:

- Run the narrowest meaningful test while iterating.
- Run `npm run fix` after editing maintained source or documentation.
- Run `npm run check` for a completed focused change.
- Run `npm run ci` before calling a broad translation or architecture phase complete.
- Run `npm run generate:check` whenever generator rules, patches, templates, upstream revision, or generated Haxe changes.

## Testing Rules

- Generator transforms require focused unit tests with positive, negative, and ambiguity cases.
- Every bug found in generated Haxe should first gain the smallest regression test that exposes the faulty general rule. Add a patch test as well when the fix is a legitimate exception.
- Generated public signatures must be compile-tested from consumer-style Haxe fixtures.
- Upstream Vitest is the primary behavioral oracle on the JavaScript target.
- Portability is verified by compiling and smoke-running representative code on more than one Haxe target; a JavaScript-only success is insufficient for code classified as portable.
- Test both distinct and aliased outputs for translated Flight functions with an `out` parameter.
- Never weaken or silently skip an upstream test to make the port look complete. Record unsupported tests with a reason and a source identity in the coverage report.

## Commit Conventions

Every commit message is a single [Conventional Commits](https://www.conventionalcommits.org/) line — `type(scope): summary` — and nothing else. No body, no blank line, no bullet list, and no `Co-Authored-By` (or any other) trailer. Use `feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `style`, `perf`, or `build`, with an optional scope such as `emit`, `generator`, `examples`, or `upstream`.

## Continuity

Keep transient work state out of generated code and source comments. Update [`agents/status.md`](agents/status.md) when a phase changes, a decision is made, a new blocker appears, or work stops midstream. The status file should tell the next agent what is true, what was verified, and what to do next without reconstructing the project from chat history.
