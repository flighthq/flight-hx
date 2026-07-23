# Completed Implementation Plan

All phases reached their exit criteria on 2026-07-22 for upstream revision `5d24729f7360475e28a105ae0caeeaa2e1328260`. This document is now the regression checklist for future upstream revisions; current counts and release decisions live in [`status.md`](status.md).

## Completed Phases

1. **Foundation:** npm command surface, repository-local Haxe 4.3.7, pinned Lix libraries, Oxc quality tools, Haxelib metadata, generated-file boundaries, and agent documentation.
2. **Inventory and symbol graph:** complete package/source/export/test inventory with stable TypeScript identities, fingerprints, SDK policy, collision checks, and generated reports.
3. **Intermediate model and lowering:** executable lowering for all 9,122 candidate declarations with deterministic Haxe emission and zero current diagnostics.
4. **Public modules and types:** flat `flight.*` modules, canonical type ownership, granular package-barrel facades, renamed cross-package re-exports, and the broad `flight.Sdk` facade.
5. **Runtime semantics:** maintained Haxe sources for JavaScript-compatible numeric, nullish, reflection, collection, typed-array, callback, and async behavior with explicit portability seams.
6. **Semantic patches:** typed target matching, AST fingerprints, deterministic ordering, conflict/staleness validation, fragment loading, audit output, and drift tests.
7. **Package translation:** all 131 packages, including host integrations and `tool-capture`, with complete export accounting and no placeholder bodies.
8. **Upstream Vitest harness:** compiled Haxe JavaScript, package and per-source ESM bridges, exact mock seams, focused package commands, and a canonical 131/131 parity report covering all 1,166 test files.
9. **Portability matrix:** Eval, JavaScript, Python, and C++/hxcpp compile-and-run gates, including full namespace reachability through `flight.Sdk`.
10. **Packaging and CI:** reproducible Haxelib zip with provenance/reports, isolated install and clean consumer execution, plus the complete local and GitHub Actions `npm run ci` surface.

## Upstream Update Workflow

1. Update the read-only `upstream` submodule intentionally and record its revision.
2. Run `npm ci` and `npm run setup`.
3. Run `npm run generate`; treat inventory, lowering, facade, fingerprint, or patch failures as translator work rather than generated-file edits.
4. Review `reports/api.json`, `reports/lowering.json`, `reports/patches.json`, generated Haxe diffs, and source/package bridges.
5. Use focused generator and upstream package tests while iterating.
6. Run `npm run generate:check`, then `npm run ci` from the final tree.
7. Confirm the Haxelib artifact installs and its clean `flight.Sdk.*` consumer runs.
8. Update [`status.md`](status.md), counts, upstream revision, support classifications, and release notes.

## Definition of Complete

An upstream revision is complete only when:

- every in-scope package, source file, public export, declaration, and test file is accounted for;
- generated Haxe contains executable implementations and is deterministic;
- every exception is a validated semantic patch or maintained runtime source;
- granular modules and `flight.Sdk` compile from consumer-style fixtures;
- upstream Vitest passes through the compiled Haxe bridges with an honest report;
- the portability matrix passes on its declared host tools;
- the Haxelib artifact builds, installs, and runs in an isolated consumer; and
- `npm run ci` and the documentation describe the same current reality.
