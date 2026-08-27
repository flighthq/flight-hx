# Public Surface and Contract Visibility

Status: implemented design decision, 2026-08-26. Motivated by discoverability pain observed in a real hand-written Flight consumer (`jgranick/haxejam2026`) and by a review of how the contract lane should be expressed in Haxe. Compiled evidence in this document was produced against the pinned `.haxe/4.3.7` toolchain; the enforcement claims are guarded by `tests/generator/contract-visibility.test.ts`.

## Problem: the upstream file name must not be the public address

A Flight consumer thinks in two coordinates, and neither is the defining `.ts` file:

- free functions by `(package, name)` — the TypeScript mental model is `import { fn } from "@flighthq/pkg"`, which never names the file `fn` lives in;
- types by `(types-package, TypeName)`.

Mechanically mirroring the upstream _file_ into a Haxe _module_ leaks Flight's internal file layout into the public API. The `haxejam2026` port shows the three failure modes this produces:

- **File-vs-barrel ambiguity.** `createVector3` is defined in `vector3.ts` and re-exported by the geometry barrel, so both `flighthq.geometry.Vector3.createVector3` and `flighthq.geometry.Geometry.createVector3` resolve; the consumer used both, inconsistently.
- **Forced knowledge of the file split.** `invalidateNodeAppearance` is defined in `node/src/revision.ts` but re-exported by the `@flighthq/node` barrel. The consumer wrote `import flighthq.node.Revision.invalidateNodeAppearance;` — coupling to a file a TypeScript consumer never sees.
- **Buried secondary types.** `RigidBody2D` lives in the multi-type file `types/src/Physics2D.ts`, so the only path was `flighthq.types.Physics2D.RigidBody2D` — the container file, not the type name. At the pinned 0.4.0 surface, 1,425 of 2,223 exported canonical types had a defining-file name that did not match the type name, so this is the common case rather than an exception.

## Decision 1: address by intent, not by file

- **Free functions collapse onto the package barrel class** `flighthq.<pkg>.<Pkg>`. Per-file function modules are not part of the steered public surface. This is the direct realization of "do not output per file name" for functions: one import, no `Revision` to fall into, and — crucially — the runtime class name stays correct (see Decision 2). Source-derived implementation namespaces remain `@:noCompletion` owners for bodies and JavaScript bridges. Upstream's flat barrel re-export namespace guarantees the package's function names are unique, so collapsing cannot introduce a collision.
- **Types get one public module per exported type** at `flighthq.types.<TypeName>` (the split). Source provenance is retained in the manifest so reports and errors still lead back to the origin `.ts`; the file↔module bijection is deliberately traded for a flat, name-addressable type surface, consistent with Flight's globally-searchable-names goal.

## Decision 2: prefer Haxe visibility modifiers over namespace lanes

When the goal is access or completion control, use in-place modifiers (`private` + `@:allow`, `@:noCompletion`) rather than relocating declarations into a hidden namespace lane (`_generated`, `_contract`). Modifiers keep the declaration at its natural path, which preserves runtime identity and avoids a second indirection hop. Relocation is justified only when a name must be genuinely _re-homed_ (the multi-type-file split), and even then structural types re-home for free.

### Why relocation corrupts runtime identity

A `typedef` transparently re-exports a class — including its **static functions** — through every import form (`Pub.fn()`, `import ....Pub.fn;`, `import ....Pub.*;`), and `@:noCompletion` on the target does not suppress the members on the alias. But the runtime name follows the _implementation_ location, not the alias:

```
typedef Ray3D = gen.geometry.Ray3D;     // impl in a hidden "gen" lane
Type.getClassName(Type.getClass(new Ray3D()))  =>  "gen.geometry.Ray3D"   // not the public name
// JS target emits the symbol  gen_geometry_Ray3D
```

For an SDK whose thesis is that names are the API (reflection, logging, serialization by class name), baking a hidden-lane name into runtime identity is a real cost, and the only fixes are target-specific (`@:native`), which fight portability. Structural/anonymous types have no runtime class and so alias for free; nominal classes and function containers should stay named at their public home.

## Decision 3: the contract lane is visibility, not a namespace

Flight's `./contract` lane is a compiler-checked API boundary. Map it to Haxe visibility in three tiers, by canonical source identity and manifest lane (never by a `Contract` filename):

| Tier | What | Haxe expression | Enforced against consumers? |
| --- | --- | --- | --- |
| module-local | symbol referenced only within its own generated module | plain `private` | yes (module privacy) |
| contract member | `private` field / static fn / method reachable by other `flighthq` packages | member-level `private` + `@:allow(flighthq)` | **yes for ordinary out-of-package consumers** |
| contract-exclusive type | a _type_ shared across packages via `./contract`, hidden from users | public + `@:noCompletion` | no (completion-only) |

`private` + `@:allow(flighthq)` is strictly stronger than the previous `@:noCompletion`-only treatment of contract members: `@:noCompletion` only hides from autocomplete and still compiles; this rejects end-user access at compile time.

### Compiled evidence (pinned 4.3.7)

- **A — grant works, recursively, incl. statics.** `flighthq.geometry` reaching an individually allowed `private` field and `private static` function of `flighthq.node.Node` compiles. `@:allow(<package>)` is recursive over sub-packages.
- **B — consumers are rejected.** `game.App` (outside `flighthq`) touching the same member: `Cannot access private field contractY` — a hard error, real enforcement.
- **C — a `private` _type_ is unreachable cross-module, even within `flighthq`.** `Cannot access private type ContractOnly in module flighthq.node.Node`. `@:allow`/`@:access` govern _member_ access, never _type_ visibility; Haxe type visibility is binary (module-private or public).

C is the reason a contract-**exclusive type** cannot be `private`: module privacy would block other `flighthq` packages too. It stays public with `@:noCompletion`. This is completion control, not access control: consumers can still import the type, inspect its structural fields, and construct compatible values. That is Haxe's available ceiling without re-homing the type, and it keeps the contract lane out of the namespace (no `_contract` package needed). A type that genuinely appears in only one module may remain fully `private`.

## Decision 4: precision of `@:allow` — bias toward widening

`@:allow` could be made precise: translate each contract _import_ in package B into `@:allow(flighthq.b)` on the exporting member in package A, mirroring the real contract dependency graph. This buys tighter _intra-SDK_ encapsulation but introduces a class of generation bugs: the allow-set is derived from the TypeScript import graph, while Haxe checks access on _lowered_ output, so any gap — a missed transitive re-export, an access introduced by inlining/generics — compiles to a **spurious build break** in generated code, and the gap surface tracks upstream churn.

The failure modes are asymmetric:

- a spuriously **wide** allow changes only intra-`flighthq` access for that annotated member;
- a spuriously **narrow** allow is a hard compile error.

Therefore the rule is **widen when unsure**, and member-level `@:allow(flighthq)` is the fully-widened, build-safe endpoint for a known contract member. It is the correct default and floor:

- the ordinary public boundary is identical to the precise version — application code outside `flighthq` is locked out either way, so normal consumers lose nothing;
- the only thing given up for that member is enforced encapsulation _between_ generated packages, which the generator authors and tests already govern;
- it is reversible with zero public-API impact (allow annotations are invisible to consumers), so starting broad forecloses nothing.

Stamp the grant on each contract member, never through a global metadata macro. Class- or package-wide metadata would also open unrelated private siblings and erase tier 1. A symbol proven single-module stays plain `private`, so real local encapsulation is retained. Precise accessor-side `@:access(Target)` metadata may later narrow the grant when it is derived from the lowered Haxe access graph and guarded by a complete-namespace compile; it is optional hygiene, not the initial mechanism.

Haxe packages are open: consumer-authored code can itself declare a `flighthq.*` package and receive the recursive grant. This mapping prevents ordinary application-package access and steers the public API, but it is not a security or adversarial ownership boundary.

## Decision 5: generic TS→HX core vs Flight profile

Preserve a future seam between reusable TypeScript-to-Haxe lowering and Flight-specific policy, but do not block Flight ergonomics on extracting a generic transpiler before a second real profile proves the boundary. The current generator may contain Flight vocabulary; its IR should continue to prefer generic concepts such as visibility, barrel strategy, type placement, and language lowering. Flight policy is:

- API preservation (free-function names, `create*` boundary, `out` params, no OO-ification) — Flight policy.
- Topology (barrel-collapse for functions; one-module-per-type split) — generic _strategies_ the core offers, _selected_ by the profile.
- Contract — the profile maps its `./contract` tier onto the generic "restricted-visibility" capability as `(private, @:allow(<rootPackage>))`, with `<rootPackage> = flighthq` supplied by config.
- Semantic patches keyed to Flight identities — Flight layer.

When a reusable core is extracted, generic lowering belongs under generic positive/negative/ambiguity tests and Flight policy under Flight fixtures. Until then, keep these choices localized and tested rather than enforcing a speculative source-directory purity rule.

## Resolved owner choices

- **Hybrid rather than uniform `_generated`+typedef allowlist.** Uniform gives a public namespace containing nothing but the generated allowlist (tidiest, nothing can leak) at the cost of hidden-lane runtime names on every nominal/function class (Decision 2). Hybrid keeps functions/nominal classes named at their public home and aliases only structural types plus genuine cross-name re-exports. Flight uses **hybrid**, weighting honest runtime identity for a name-centric SDK.
- **`flighthq.geometry.Geometry` barrel name.** Keep it: it matches the `flash.display.X` two-lowercase idiom, the stutter is confined to the whole-package convenience import, and once the barrel is the one steered function surface the alternative file-module lane no longer competes with it.

## Guard

`tests/generator/contract-visibility.test.ts` compiles hermetic fixtures against the pinned toolchain and asserts A (allowed members compile), B (ordinary consumers receive `Cannot access private field`), C (`Cannot access private type`), D (an unrelated private sibling stays inaccessible), and E (`@:noCompletion` types remain compile-visible), so both the enforcement and its ceiling are guarded.
