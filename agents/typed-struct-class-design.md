# Typed Struct Class-Emission Feasibility

Status: the `Camera2D` cpp pilot passed every Gate 1-3 acceptance check. Gate 4 retains `ParticleEmitterState`; `ParticleEmitterData` was reverted after the provenance audit proved its parent ingress can carry anonymous data into a class-typed read. No Gate-5 schema is enabled. The deterministic census covers all 1,536 eligible canonical typed-struct schemas at the pinned upstream commit.

## Decision

Pilot target-conditional `@:structInit` classes on hxcpp only. Preserve the existing anonymous `typedef` on every other target, retain a canonical-ID allowlist, and begin with required-field schemas that have no normalization or observability findings. Do not emit classes on JavaScript. Do not expand to Neko until the hxcpp mechanism is benchmarked and the same allowlist passes a separate Neko CPU benchmark.

The intended declaration shape is:

```haxe
#if cpp
@:structInit
class Camera2D {
    public var x:Float;
    public var y:Float;

    public function new(x:Float, y:Float) {
        this.x = x;
        this.y = y;
    }
}
#else
typedef Camera2D = {
    var x:Float;
    var y:Float;
}
#end
```

This is now the emitted shape for the exact canonical ID `@flighthq/types:upstream/packages/types/src/Camera2D.ts#Camera2D`. The generated constructor includes every declared field in deterministic declaration order and uses the same lowered field types as the typedef. `@:structInit` is the compatibility mechanism for contextual object literals; it is not a license to cast anonymous or dynamic native objects to a class.

The allowlist is default-off: only exact reviewed canonical IDs enter, and generation fails when an enabled identity is absent, indirect, ineligible, generic, inherited, optional, or not an anonymous required-field record. The pilot also records construction identity in the IR, validates the exact field set and declaration order at emission, and leaves all non-cpp declarations on the existing typedef branch. A cpp build with `-D flight_cpp_struct_init_baseline` selects that same typedef branch, providing a controlled A/B baseline from one generated tree without changing the normal class-enabled build.

## Camera pilot verdict

The class fixture constructs a real nominal instance under the compiler interpreter while exercising the cpp branch syntax, and the maintained Haxe smoke checks every `Camera2D` field. A focused JavaScript fixture compares the pilot emission against the previous return-cast emission byte for byte; both files currently have SHA-256 `2d0b0b4da3dba8d197b56b68453cecccf230fe044026fbcdbb0a7ef6cb6a92b1`.

The complete generated-source tree changed from SHA-256 `7fb39b6fb779838926fded9d2aa44ff31f2ca54f7778801660fa046c7ea9914f` to `fd76c64a2957d9d52a31c1f5b6d8a900271bb56bb8e92dc41c18998195aaecb4`; only `Camera2D.hx` and its construction site changed. Review confirmed the same candidate hash after integration.

The integrated html5 camera bundle matched its parent byte for byte except for Lime's auto-incrementing `app.meta` build-counter line. Future class parcels compare the whole bundle after excluding only that nondeterministic build-meta line; every remaining byte must match. The focused raw-Haxe fixture remains supporting byte-identity evidence.

The cpp camera build compiled cleanly and rendered pixel-identically to the known-good post-`bufferSubData` capture. On the quiet llvmpipe Linux machine, six interleaved parent/candidate pairs of the 600-frame script benchmark measured 102.0 fps parent mean versus 108.2 fps candidate mean; the candidate won four of six pairs, about a 6% positive lean. A sequential-block run had first reported a false regression from machine drift. Interleaved parent/candidate pairs are therefore mandatory for all future class benchmarks.

## Gate-4 particle resolution

The initial Gate-4 experiment added both `ParticleEmitterData` and `ParticleEmitterState`. Its integrated JS, cpp compile, render, and interleaved performance gates were green, and its allocation window showed a consistent reduction from about 2.36 MB to 1.64 MB. Correctness still takes precedence: the later containment audit found that `ParticleEmitterData` inherits normalization provenance through its `ParticleEmitter` parent.

That taint is realizable on cpp. The generated `ParticleEmitter` and `ParticleEmitter3D` outer typedefs flatten their overridden `data: ParticleEmitterData` field to `data: Null<NodeData>`, while `NodeData` is `Dynamic`. A structurally supplied outer emitter can therefore carry anonymous `data`. The generated GL and WGPU 3D render paths assign that dynamic slot to a local typed as `ParticleEmitterData` and then read `data.worldSpace`, so the nominal boundary is not closed. The seven parent findings are all casts, but the erased outer field means those casts do not prove or restore child identity.

Gate 4 therefore uses the revert resolution: `ParticleEmitterData` remains a typedef, and the allowlist retains only the provenance-closed `@flighthq/types:upstream/packages/types/src/ParticleEmitterState.ts#ParticleEmitterState`. The full generated-source SHA is `7d3a64de84e772382b9d85b7adbf02694f0f4e820ebf667f61d6f3bec15103c9`. Relative to the accepted Camera2D parent, the generated delta is exactly the `ParticleEmitterState` type declaration and factory module. Relative to the rejected two-schema experiment at `4f77361fa772d1b009930aecf87fbb3cc14483f0827fcb78d7061f00b1655ba0`, the revert changes exactly the `ParticleEmitterData` type declaration and factory module.

## Rectangle disposition

`RectangleLike` remains a strict structural four-field typedef on every target, and generated geometry operations now use direct typed fields. This removes Haxe-level `_Runtime.field`/`setField` traffic without changing the API accepted by callers.

It is not safe to add either Rectangle identity to the cpp class allowlist yet. `Rectangle` has a production cross-schema transfer through `Entity` and strict-identity observations; because it is not mechanically compatible, it is absent from the nominal-provenance candidate set. `RectangleLike` is mechanically compatible in isolation but is not provenance-closed: its `Scale9Shape -> data -> scale9Grid` containment path inherits cross-schema normalization. An hxcpp cast would not repair either representation and a copying adapter would break the aliasing contract. The generator therefore keeps the structural typedef and fails `validateCppStructInitProvenance` if either identity is proposed for nominal emission.

That boundary is observable in the current portable cpp output: `geometry/Rectangle.cpp` contains 122 `__Field` and 62 `__SetField` operations. They are hxcpp's representation of the intentionally structural typedef, not reflective access emitted by the Haxe generator. Removing them requires closing provenance and enabling a real nominal class; routing them through `_Runtime` or adding an unchecked cast would only hide the same operation or make the representation unsound.

## Census result

The checked-in source of truth is [`reports/typed-struct-classes.json`](../reports/typed-struct-classes.json). It contains one sorted record per canonical schema plus sorted source locations for every migration or observability finding. [`reports/typed-struct-classes.md`](../reports/typed-struct-classes.md) is the compact 1,536-row review table. Both are generator outputs, not manually maintained inventories.

| Surface | Sites or fields | Affected schemas | Direct sites on affected schemas |
| --- | --: | --: | --: |
| Eligible canonical schemas | 1,536 | 1,536 | 11,816 |
| Production object literals | 1,842 | 881 | 4,782 |
| Plain production object literals | 1,666 | 796 | 4,721 |
| Production object literals with spread | 174 | 119 | 1,232 |
| Production object literals with computed keys | 2 | 2 | 0 |
| Cross-schema structural transfers | 1,391 | 275 targets | 6,376 |
| Anonymous structural transfers | 148 | 53 | 244 |
| Dynamic ingresses | 67 | 31 | 979 |
| Declared optional fields | 1,970 | 535 | 1,119 |
| Required fields whose type includes `undefined` | 2 | 2 | 6 |
| Object literals omitting optional fields | 392 | 149 | 411 |
| Production object spreads | 100 | 42 sources | 1,181 |
| Production object rests | 0 | 0 | 0 |
| Production enumeration | 8 | 2 | 0 |
| Production JSON serialization | 6 | 6 | 2 |
| Exported input signature references | 8,275 | 819 | 10,702 |
| Exported output signature references | 1,670 | 712 | 9,608 |
| Test object literals | 5,262 | 602 | 6,748 |
| Test oracle observations | 244 | 73 | 2,098 |

The 244 oracle observations are two enumerations, nine JSON serializations, 212 object spreads, and 21 strict-equality assertions. The audit found no object rest or explicit prototype observation in the current tests. A zero is useful drift evidence, not proof that a public JavaScript consumer never observes the behavior.

The exported-signature counts are schema references, not unique functions or dynamic crossings: each exported callable parameter contributes an input reference, each callable return contributes an output reference, and an exported non-callable variable contributes an output reference. They measure JavaScript bridge exposure if classes were emitted on JavaScript; they do not make a cpp-only class unsafe by themselves.

## Feasibility classes

`mechanicallyCompatible` means the schema has no anonymous transfer, cross-schema transfer, dynamic ingress, computed-key literal, or spread literal. Observability is deliberately reported independently: JSON, enumeration, object rest/spread, optional omission, prototype checks, and strict-equality oracles may compile while changing behavior.

| Gate | Schemas | Direct sites | Meaning |
| --- | --: | --: | --- |
| No normalization findings | 1,143 | 3,974 | Existing production values have a canonical construction or flow identity. |
| Requires normalization | 393 | 7,842 | At least one source value is not already the target nominal class. |
| No normalization or observability findings | 986 | 3,587 | Candidate set for target-conditional classes after compile validation. |
| Previous row, required fields only | 740 | 3,093 | Safest mechanical gate; 3,465 fields, 898 production literals, and no optional-presence policy. |
| Previous row, optional/undefined fields present | 246 | 494 | Needs constructor-default and absence policy before enablement. |
| Any observability review | 238 | 3,241 | Requires target-specific parity evidence or continued typedef emission. |

The remaining 550 schemas outside the 986 clean set are not necessarily impossible. Findings are a required design input. In particular, 393 schemas carry normalization findings and 238 carry observability findings, with overlap between the groups.

### Object construction

`@:structInit` plus a generated constructor is mechanically compatible with the 1,666 plain contextual object literals. The 174 literals containing spread are not constructor calls in disguise: property order, overwrite order, enumerable-own-property behavior, and source identity must remain explicit. Those sites need a generated projection/merge expression whose result is a real class instance, or the target schema remains a typedef.

The two computed-key construction sites remain excluded because a computed key cannot initialize a closed nominal layout safely without a named normalization step.

A plain class without `@:structInit` would require rewriting all 1,842 production construction sites to `new`, plus every generated fixture or helper that relies on structural initialization. That churn buys no additional layout benefit on hxcpp. A plain constructor remains useful only at normalization boundaries where an explicit allocation is semantically intended.

### Structural assignments

The 1,391 cross-schema transfers affect 275 target schemas. These are nominally invalid even when the field sets are assignable in TypeScript; the generated report is the source of truth for each exact relation.

An hxcpp `cast` is not a conversion: an anonymous value and a class instance have different native representations. Copying is also not a general fix because the current typed-struct model promises internal reference identity and out-parameter aliasing. Each cross-schema pair must therefore choose one of:

- create the value as the destination class at its authoritative construction site;
- unify the canonical runtime identity when both TypeScript schemas describe the same object;
- introduce an explicit copying adapter only at a boundary where identity is documented as irrelevant;
- leave that destination schema as a typedef.

The same rule applies to the 148 anonymous transfers across 53 schemas. These are high-value follow-ups only when their exact report locations can create canonical instances without copying aliased values.

The 67 dynamic ingresses across 31 schemas require the existing typed-struct boundary seam. A validator/copying constructor may be appropriate for external data, but it must run once at the boundary. Casting a dynamic anonymous object and then using native class-offset access is prohibited.

### Optional fields and observation

An optional constructor parameter can make `@:structInit` accept an omitted argument, but a native class field still exists after construction. That is not the same model as an absent JavaScript own property. The 392 actual omissions across 149 schemas are therefore an observability gate. Both required-undefined fields must remain required nullable constructor arguments; they must not silently become optional.

On cpp, Flight already collapses much of absent/`undefined` behavior to `null`, but serialization, enumeration, and spread can still reveal field presence. Optional class migration needs target-specific tests for omission, explicit `undefined`, `null`, JSON, and copy/spread behavior before it joins the allowlist.

On JavaScript, class instances add prototype/constructor identity and omitted constructor fields can become enumerable own properties with `null` or `undefined` values. That threatens the 5,262 current test literals, 9,945 exported signature references, 21 strict-equality assertions, nine JSON oracles, and 212 object-spread oracles. Keeping the typedef branch on JavaScript removes that risk rather than asking the bridge to normalize every public input and output.

## Design comparison

| Design | Existing plain literals | Non-canonical flows | hxcpp layout | JavaScript behavior | Recommendation |
| --- | --- | --- | --- | --- | --- |
| `@:structInit` class with generated constructor | 1,666 plain production literals can retain structural syntax | Exact adapters or canonical construction still required | Native class fields can use fixed layout | Prototype and optional-own-property changes if enabled on JS | Use behind a cpp canonical-ID allowlist. |
| Plain class with generated constructor | Rewrite all 1,842 production literals to `new` or factories | Exact adapters still required | Same class-layout opportunity | Same prototype risk if enabled on JS | Use only for explicit boundary adapters, not general emission. |
| Class on every target | Same source mechanics as chosen class form | Same normalization work | Captures cpp opportunity | Changes the established JS plain-object bridge and its oracles | Reject. |
| `#if cpp` class, typedef elsewhere | Same Haxe type name on both branches | cpp compiler exposes every nominal mismatch | Captures the user-priority target | JS output and Vitest oracle remain byte-for-byte on the typedef path | Adopt first. |
| cpp-and-Neko conditional class | Same as cpp branch | Must compile and test both native representations | Captures cpp opportunity | JS remains unchanged | Consider only after separate Neko measurement. |

## Expected performance

The current 11,816 direct Haxe accesses are the maximum static opportunity, not a speedup prediction. Anonymous structures still use dynamic/hash-oriented field representation on hxcpp; a real class gives hxcpp a nominal layout and makes fixed-offset/native member access possible. The strongest expected gains are in frequently executed math, transform, particle, and render-state paths, while cold serialization documents may show no meaningful wall-clock change.

`Camera2D` is an ideal correctness/performance pilot: it has six required fields, one plain production literal, no normalization or observability finding, and 17 direct static sites. The existing camera projection executes 50 `Camera2D` field accesses in one representative update. Converting the clean camera record first can validate the layout hypothesis without entangling transform normalization. Converting all relevant camera/transform records could eventually address the full 205-access frame projection, but `HasTransform2D` and `HasTransform2DRuntime` first need their anonymous, dynamic, and cross-schema sites normalized.

`ParticleEmitterState` is a closed required-field record with 236 direct static sites and remains the Gate-4 particle class. `ParticleEmitterData` has 461 direct sites but is parked until its containing outer types preserve or normalize the nominal data identity.

Neko has a hash-oriented object model too, so the same source hot paths could benefit from a more nominal representation, but it does not offer the same fixed native-layout argument as hxcpp. Treat the benefit as plausible and unquantified. More importantly, the known Neko GL cost includes a large FFI component that this change cannot remove. Neko acceptance should use a CPU-only camera/math/particle benchmark and must not infer class success or failure from GL frame time.

The Linux missing-shapes/text defect is outside this design. It was traced independently to `bufferSubData` behavior and fixed in the Lime CFFI workaround; no class-emission decision should use that correctness bug as evidence.

## Migration gates

1. Add a default-off cpp class allowlist keyed by the exact canonical IDs already used by typed-struct lowering. No checker-derived schema may enter automatically.
2. Emit `@:structInit` class plus deterministic constructor under `#if cpp`, with the current typedef under `#else`. Start with `Camera2D` only.
3. Require unchanged JS generation and upstream Vitest results, cpp compile/portable tests, and an interleaved parent/candidate cpp benchmark against the same renderer, build mode, frame count, and machine.
4. Retain the provenance-closed `ParticleEmitterState`. Keep `ParticleEmitterData` as a typedef until the outer `ParticleEmitter` and `ParticleEmitter3D` data slots preserve or normalize its nominal identity; the positive experimental allocation result does not waive this correctness gate.
5. Apply the containment and nominal-closure policy in [`typed-struct-provenance-audit.md`](typed-struct-provenance-audit.md) before any further required-field entry. The 199-row direct-census set is not a bulk gate: each schema must be closed or carry a reviewed source-specific proof before a separate allowlist diff. Compile success is necessary but not sufficient; preserve mutation and reference identity.
6. Apply the constructor/default, absence, and provenance policy in [`typed-struct-optional-policy.md`](typed-struct-optional-policy.md), then consider reviewed subsets of the remaining 92 clean schemas. The current direct-site filter is not sufficient for bulk enablement.
7. Resolve the itemized normalization and observability sites before enabling any of the remaining schemas. Never replace normalization with an unchecked native cast.
8. After hxcpp results are positive, try the identical reviewed allowlist on Neko behind a separate condition and CPU-only benchmark. Keep it target-disabled if it does not earn its complexity.

Every class tranche must keep `reports/typed-struct-classes.json` stable except for intentional classification changes, run the full generator and Haxe portability checks, and report generated `_Runtime` residuals plus the target benchmark. The census itself authorizes no emission change.
