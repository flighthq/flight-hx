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
assertions. Two mechanisms, chosen per package by classification recorded in the
manifest (nothing is silently outside it):

- **Pure / value-in-value-out packages** (math, geometry, path, easing, spring,
  …): **vector replay**. Capture upstream test I/O once as a target-neutral
  vector set and replay it natively per target (Rust `#[test]`, Haxe test on
  every Haxe backend). No JS runtime, no per-package bridge.
- **Stateful / opaque-return packages**: a **generated** bridge compiles the
  target to a JS-callable surface (Haxe→JS ESM; Rust→wasm) and runs upstream
  Vitest against it. Generated from the manifest — never hand-shimmed.

The manifest schema, fingerprint algorithm, and patch-identity model are defined
once in core and shared, so "covered", "stale", and "excluded with reason" mean
the same thing across every target.

### Harness engine vs. substitute shims

The prior hand-Rust effort proved the shape but mislocated the cost. A parity
system of this kind has two parts that must be treated oppositely:

- **Harness engine** — package-agnostic, one copy: the contract driver and
  target registry, the shared wasm-host runtime, the wasm build mechanism, and
  the capture/baseline and functional-render plumbing. It encodes the oracle
  contract and does not scale with package count. **Keep and generalize it.**
- **Substitute shim** — one per package (a hundred-plus): a module that
  re-declares every upstream export and forwards each into the target. It scales
  linearly, is mechanically shaped, and in practice it also smuggles per-function
  logic (target-side magnitude math, host-only fallbacks, hand-mapped argument
  keys). That makes every shim a drift site *and* a correctness leak — a shim
  that reimplements can pass while the crate is wrong. **Never hand-author
  shims.** Pure packages delete the shim entirely (vector replay); stateful
  packages generate a *pure-forwarder* shim from the manifest.

### Vector capture

Vectors are a generated, committed, drift-checked oracle owned by core — captured
once from upstream, replayed by every target:

- **Capture at the function boundary, not by parsing test source.** Instrument
  the upstream package's exports generically (from the manifest) and run upstream
  Vitest once; record each call as `{pkg, fn, args, ret, threw, drivenBy}`.
  Capturing TS's *actual output* is a stricter oracle than replaying the authored
  matcher, which may be looser than TS's real behavior — and for a port,
  byte-parity with TS is exactly the target.
- **Record what value-only capture loses.** Flight is out-param and sentinel
  heavy, so each record must carry: the aliasing relationships among args and
  `out` (capture both distinct and aliased calls), the full post-call state of
  `out` *and* every arg, thrown/sentinel outcomes, and any RNG seed. Encode
  floats as exact IEEE-754 bits so replay is bit-faithful, not lossy-decimal.
- **Per-function float policy.** JS `Math` transcendentals and Rust/`libm` are
  not bit-identical, so bit-exact replay will falsely fail on sin/cos/atan2-heavy
  functions. Default to exact compare for integer/algebraic ops and a small-ULP
  tolerance for transcendental ones; seed that policy by statically scanning
  which upstream matchers used `toBeCloseTo` vs `toEqual` — the one place static
  test analysis earns its keep.
- **Treat vectors like generated code.** Stamp the upstream and capture-tool
  revision into each `vectors/<pkg>.jsonl`; regenerate via script; commit them so
  a changed vector surfaces as a reviewable behavior diff; gate with a capture
  idempotence check. Coverage — captured vs bridged vs skipped-with-reason — goes
  in the same manifest.

Vectors are also the *only* way to get parity coverage on Haxe's non-JS backends
(hxcpp/HL), which cannot run the Vitest bridge. They serve the native Haxe story,
not just Rust.

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

- **flight-rs topology:** slim the repo to the maintained keeper under the
  retained name, so the `flight ↔ flight-rs` seam and its testing contract stay
  stable while contents transition from hand-authored to generated. Keep the
  harness engine, `runtime-rs`, and the surface keeper (`crates/flighthq-surface`
  + `surface-rs` — a real self-contained wasm module, not a marshalling façade);
  drop the hundred-plus substitute shims and hand crates. Build the slim repo by
  `git filter-repo` over a clone, keeping surface's paths plus the engine, so
  surface's real history and blame survive and the pile never enters it; record
  the source archive SHA for lineage. The full current repo becomes a **separate
  private** archive, pinned at a known-green commit and unmaintained — the
  differential-test corpus. Capture vectors *before* it goes cold. Stop agent
  maintenance, which is the drift engine.
- **surface-rs:** extract to its own maintained crate; do not let it die inside
  the atrophying pile. It is the one earned wasm/native accelerator.
- **surface reference:** the portable TS `surface` belongs in the Flight
  monorepo (restore it if it was removed) as the mechanical-port source and the
  oracle that surface-rs must match. Do not move the Rust implementation into
  the TS monorepo; keep Flight uniformly TS-is-truth.
