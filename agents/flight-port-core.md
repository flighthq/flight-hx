# Flight Port Core

## Objective

Extract the language-neutral kernel of the port compiler — analyzer, symbol
graph, intermediate model, coverage/provenance/fingerprint machinery, and patch
identity — into a shared `flight-port-core` that multiple target ports depend
on. Today that kernel lives inside [`tools/generator/`](layout.md) fused to Haxe
emission.

Separating it makes each language target a thin emitter over one proven model,
so a second target (Rust) is a *derived, oracle-checked sibling* of the Haxe
port rather than a hand-maintained parallel implementation that drifts.

The rule this enforces: **one source of truth (upstream TS), one kernel, N
emitters, one oracle.** A target's trustworthiness is a function of
oracle-parity, not of the target language; the kernel is what makes reaching
parity cheap and repeatable.

## Motivation

- flight-hx already derives Haxe mechanically and proves it against upstream
  Vitest. It does not drift and cannot permanently lag.
- flight-rs is the opposite: hand/agent-authored Rust with per-package parity
  shims. It drifts agent-to-agent and lags upstream. That is not a property of
  Rust; it is the property of *any* target produced without the kernel and the
  oracle.
- The cure is to make Rust a *generated* target off the same kernel, held to the
  same oracle. Extracting the kernel is the prerequisite.

## Boundary: core vs. per-target

Core (language-neutral):

- TypeScript analysis: package/module resolution, export graph, re-exports,
  type-only imports, overloads, symbol identity.
- Normalized intermediate model: declarations and semantics, not formatted TS
  text.
- Neutral semantic lowering not specific to any target language.
- Semantic patches applied to the neutral IR, targeted by stable upstream
  identity (npm package + source path + export name) and invalidated by
  normalized declaration fingerprints.
- Provenance, coverage/API manifest, and patch-audit generation.
- Flight API-contract rules expressed at the model level: free-function
  preservation, the `create<Type>` allocation boundary, `out`/aliasing and
  sentinel semantics.

Per-target (one module/crate per language):

- Language ownership and type lowering. Haxe: GC and structural typing. Rust:
  ownership/borrow — this is where the Rust emitter earns its keep and where the
  TS→Rust semantic gap is absorbed. It lives here, never in core.
- Emitter: module/file layout, formatting, banners, ordering.
- Maintained runtime: Haxe `flighthq._internal`; a Rust equivalent.
- Host adapters and the behavioral bridge to the oracle.
- Target-scoped patches: idiom exceptions that only make sense for one language.

Patches therefore carry a scope: **neutral** (applied in core, shared by all
targets) or **target** (applied by one emitter). Most semantic exceptions
should be neutral; language-idiom exceptions are target-scoped.

## Oracle unification

Both targets are validated against upstream's own tests, never re-authored
assertions:

- Pure/computational packages: extract upstream test I/O as **vectors** and
  replay them natively per target (Rust `#[test]`, Haxe test). No JS runtime
  required.
- Stateful/behavioral packages: a **generated** bridge compiles the target to a
  JS-callable surface (Haxe→JS ESM today; Rust→wasm/napi) and runs upstream
  Vitest. Generated from the manifest — never hand-shimmed per package.

The manifest schema, fingerprint algorithm, and patch-identity model are defined
once in core and shared, so "covered", "stale", and "excluded with reason" mean
the same thing across every target.

## Target topology

```text
Flight monorepo (upstream, pure TS)     source of truth + tests
        │  git submodule (read-only)
        ▼
flight-port-core                        analyzer · IR · patches · manifest · fingerprints · oracle spec
    ├── flight-hx    Haxe emitter + flighthq._internal runtime + Vitest bridge
    └── flight-rs    Rust emitter + Rust runtime + vector/wasm parity harness   (rebuilt)
surface-rs (standalone)                 earned wasm/native accelerator behind the surface seam
```

- `flight-port-core` may begin as a package *inside* flight-hx and graduate to
  its own repo once its API surface is stable. A bolder option is to host the
  generator in the Flight monorepo so a TS change regenerates every target
  atomically; that is Flight's call, not the port's.
- `flight-rs` is rebuilt as a thin emitter over core. Its existing hand-authored
  crates are frozen as a differential-test corpus, not carried forward.

## Extraction plan

1. **Carve the seam in place.** Inside `tools/generator/`, define the core API
   surface (analyzer → IR → patched IR → manifest) and put Haxe ownership
   lowering + emitter behind it. No repo move yet.
2. **Prove no drift.** Regenerate; confirm `generated/` is byte-identical and
   idempotence holds. The refactor is safe only if Haxe output is unchanged.
3. **Extract core** to its own package; flight-hx depends on it. Re-verify
   byte-identical Haxe.
4. **Stand up the Rust emitter** over core on one already-green package (e.g.
   `geometry`). Differential-test emitted Rust against the frozen flight-rs
   crate on shared vectors.
5. **Roll package by package**, hardest-idiom last, deleting each frozen hand
   crate and its shim once the generated crate is green.

## Risks

- **Two-hop lossiness.** Emit Rust from the neutral IR directly (core→Rust), not
  via Haxe. A single hop keeps the Rust faithful and lets its ownership lowering
  be first-class.
- **GC-vs-ownership gap.** Real engineering, and it lives entirely in the Rust
  target's lowering, not in core. It is why a Rust target is "serious effort",
  not a switch.
- **Refactor drift.** The byte-identical Haxe check (step 2) is the guard that
  the extraction changed structure without changing output.

## Related decisions

- **flight-rs:** freeze as an unmaintained reference corpus — capture vectors
  while parity is green, pin a known-green commit — and stop agent maintenance,
  which is the drift engine. Atrophy the effort, preserve the artifact. Gate
  public visibility so a half-trusted port cannot be depended on.
- **surface-rs:** extract to its own maintained crate; do not let it die inside
  the atrophying pile. It is the one earned wasm/native accelerator.
- **surface reference:** the portable TS `surface` belongs in the Flight
  monorepo (restore it if it was removed) as the mechanical-port source and the
  oracle that surface-rs must match. Do not move the Rust implementation into
  the TS monorepo; keep Flight uniformly TS-is-truth.
