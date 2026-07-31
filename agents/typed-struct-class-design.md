# Typed Struct Class-Emission Feasibility

Status: the `Camera2D` cpp pilot passed every Gate 1-3 acceptance check. Gate 4 is implemented for `ParticleEmitterData` and `ParticleEmitterState` in a separate parcel and awaits its integrated native benchmark/battery. No Gate-5 schema is enabled. The deterministic census covers all 404 eligible canonical typed-struct schemas at the pinned upstream commit.

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

The allowlist is default-off: only exact reviewed canonical IDs enter, and generation fails when an enabled identity is absent, indirect, ineligible, generic, inherited, optional, or not an anonymous required-field record. The pilot also records construction identity in the IR, validates the exact field set and declaration order at emission, and leaves all non-cpp declarations on the existing typedef branch.

## Camera pilot verdict

The class fixture constructs a real nominal instance under the compiler interpreter while exercising the cpp branch syntax, and the maintained Haxe smoke checks every `Camera2D` field. A focused JavaScript fixture compares the pilot emission against the previous return-cast emission byte for byte; both files currently have SHA-256 `2d0b0b4da3dba8d197b56b68453cecccf230fe044026fbcdbb0a7ef6cb6a92b1`.

The complete generated-source tree changed from SHA-256 `7fb39b6fb779838926fded9d2aa44ff31f2ca54f7778801660fa046c7ea9914f` to `fd76c64a2957d9d52a31c1f5b6d8a900271bb56bb8e92dc41c18998195aaecb4`; only `Camera2D.hx` and its construction site changed. Review confirmed the same candidate hash after integration.

The integrated html5 camera bundle matched its parent byte for byte except for Lime's auto-incrementing `app.meta` build-counter line. Future class parcels compare the whole bundle after excluding only that nondeterministic build-meta line; every remaining byte must match. The focused raw-Haxe fixture remains supporting byte-identity evidence.

The cpp camera build compiled cleanly and rendered pixel-identically to the known-good post-`bufferSubData` capture. On the quiet llvmpipe Linux machine, six interleaved parent/candidate pairs of the 600-frame script benchmark measured 102.0 fps parent mean versus 108.2 fps candidate mean; the candidate won four of six pairs, about a 6% positive lean. A sequential-block run had first reported a false regression from machine drift. Interleaved parent/candidate pairs are therefore mandatory for all future class benchmarks.

## Gate-4 particle state

The Gate-4 allowlist adds exactly:

- `@flighthq/types:upstream/packages/types/src/ParticleEmitter.ts#ParticleEmitterData`;
- `@flighthq/types:upstream/packages/types/src/ParticleEmitterState.ts#ParticleEmitterState`.

They are closed required-field records with no normalization or observability finding and 641 direct accesses combined. The generated-source tree changes from the accepted camera SHA `fd76c64a2957d9d52a31c1f5b6d8a900271bb56bb8e92dc41c18998195aaecb4` to `4f77361fa772d1b009930aecf87fbb3cc14483f0827fcb78d7061f00b1655ba0`. The delta is exactly the two particle type declarations and their two factory return sites. A targeted parent/candidate particle JavaScript build is byte-identical at SHA-256 `ebf43afd9f170a817377b0dbc25317dad02f1b658dfd2682659bfaeb0cc8f312`; the integrated Lime bundle comparison remains a separate acceptance gate.

## Census result

The checked-in source of truth is [`reports/typed-struct-classes.json`](../reports/typed-struct-classes.json). It contains one sorted record per canonical schema plus sorted source locations for every migration or observability finding. [`reports/typed-struct-classes.md`](../reports/typed-struct-classes.md) is the compact 404-row review table. Both are generator outputs, not manually maintained inventories.

| Surface | Sites or fields | Affected schemas | Direct sites on affected schemas |
| --- | --: | --: | --: |
| Eligible canonical schemas | 404 | 404 | 10,257 |
| Production object literals | 530 | 212 | 6,751 |
| Plain production object literals | 490 | 209 | — |
| Production object literals with spread | 40 | 15 | 1,143 |
| Production object literals with computed keys | 0 | 0 | 0 |
| Cross-schema structural transfers | 117 | 15 targets | 547 |
| Anonymous structural transfers | 160 | 50 | 5,186 |
| Dynamic ingresses | 55 | 8 | 1,101 |
| Declared optional fields | 402 | 129 | — |
| Required fields whose type includes `undefined` | 1 | 1 | — |
| Object literals omitting optional fields | 86 | 21 | 331 |
| Production object spreads | 40 | 13 sources | 1,133 |
| Production object rests | 0 | 0 | 0 |
| Production enumeration | 0 | 0 | 0 |
| Production JSON serialization | 6 | 6 | 2 |
| Exported input signature references | 1,755 | 231 | — |
| Exported output signature references | 451 | 165 | — |
| Test object literals | 1,563 | 205 | 5,695 |
| Test oracle observations | 57 | 26 | — |

The 57 oracle observations are one enumeration, seven JSON serializations, 40 object spreads, and nine Vitest `toStrictEqual` assertions. The audit found no object rest or explicit prototype observation in the current tests. A zero is useful drift evidence, not proof that a public JavaScript consumer never observes the behavior.

The exported-signature counts are schema references, not unique functions or dynamic crossings: each exported callable parameter contributes an input reference, each callable return contributes an output reference, and an exported non-callable variable contributes an output reference. They measure JavaScript bridge exposure if classes were emitted on JavaScript; they do not make a cpp-only class unsafe by themselves.

## Feasibility classes

`mechanicallyCompatible` means the schema has no anonymous transfer, cross-schema transfer, dynamic ingress, computed-key literal, or spread literal. Observability is deliberately reported independently: JSON, enumeration, object rest/spread, optional omission, prototype checks, and strict-equality oracles may compile while changing behavior.

| Gate | Schemas | Direct sites | Meaning |
| --- | --: | --: | --- |
| No normalization findings | 328 | 3,628 | Existing production values have a canonical construction or flow identity. |
| Requires normalization | 76 | 6,629 | At least one source value is not already the target nominal class. |
| No normalization or observability findings | 291 | 3,270 | Candidate set for target-conditional classes after compile validation. |
| Previous row, required fields only | 199 | 2,800 | Safest bulk gate; 928 fields, 278 production literals, and no optional-presence policy. |
| Previous row, optional/undefined fields present | 92 | 470 | Needs constructor-default and absence policy before enablement. |
| Any observability review | 59 | 2,733 | Requires target-specific parity evidence or continued typedef emission. |

The remaining 113 schemas outside the 291 clean set are not necessarily impossible. Findings are a required design input. In particular, 76 schemas carry normalization findings and 59 carry observability findings, with overlap between the groups.

### Object construction

`@:structInit` plus a generated constructor is mechanically compatible with the 490 plain contextual object literals. The 40 literals containing spread are not constructor calls in disguise: property order, overwrite order, enumerable-own-property behavior, and source identity must remain explicit. Those sites need a generated projection/merge expression whose result is a real class instance, or the target schema remains a typedef.

There are no computed-key construction sites in the current production corpus. The audit keeps this as a permanent exclusion because a future computed key cannot initialize a closed nominal layout safely without a named normalization step.

A plain class without `@:structInit` would require rewriting all 530 production construction sites to `new`, plus every generated fixture or helper that relies on structural initialization. That churn buys no additional layout benefit on hxcpp. A plain constructor remains useful only at normalization boundaries where an explicit allocation is semantically intended.

### Structural assignments

The 117 cross-schema transfers are concentrated in 15 target schemas. The largest relation is 36 `Surface -> ImageResource` transfers, followed by 19 `Aabb -> AabbLike`, then 28 combined `Mesh`/`SceneNodeTraits` transfers into `HasTransform3D`. These are nominally invalid even when the field sets are assignable in TypeScript.

An hxcpp `cast` is not a conversion: an anonymous value and a class instance have different native representations. Copying is also not a general fix because the current typed-struct model promises internal reference identity and out-parameter aliasing. Each cross-schema pair must therefore choose one of:

- create the value as the destination class at its authoritative construction site;
- unify the canonical runtime identity when both TypeScript schemas describe the same object;
- introduce an explicit copying adapter only at a boundary where identity is documented as irrelevant;
- leave that destination schema as a typedef.

The same rule applies to the 160 anonymous transfers across 50 schemas. The hot numeric records are in this group: `Vector3` has four anonymous transfers and 1,140 direct sites, `Vector2` has nine and 322, `Quaternion` has one and 216, `Matrix3`/`Matrix4` have one each, and `ColorTransform` has five and 215. These are high-value follow-ups, but they are not safe first-wave classes until their exact report locations create canonical instances.

The 55 dynamic ingresses across eight schemas require the existing typed-struct boundary seam. A validator/copying constructor may be appropriate for external data, but it must run once at the boundary. Casting a dynamic anonymous object and then using native class-offset access is prohibited.

### Optional fields and observation

An optional constructor parameter can make `@:structInit` accept an omitted argument, but a native class field still exists after construction. That is not the same model as an absent JavaScript own property. The 86 actual omissions across 21 schemas are therefore an observability gate. The one required-undefined field, `ResourceLoadReport.group`, must remain a required nullable constructor argument; it must not silently become optional.

On cpp, Flight already collapses much of absent/`undefined` behavior to `null`, but serialization, enumeration, and spread can still reveal field presence. Optional class migration needs target-specific tests for omission, explicit `undefined`, `null`, JSON, and copy/spread behavior before it joins the allowlist.

On JavaScript, class instances add prototype/constructor identity and omitted constructor fields can become enumerable own properties with `null` or `undefined` values. That threatens the 1,563 current test literals, 2,206 exported signature references, nine strict-equality assertions, seven JSON oracles, and 40 object-spread oracles. Keeping the typedef branch on JavaScript removes that risk rather than asking the bridge to normalize every public input and output.

## Design comparison

| Design | Existing plain literals | Non-canonical flows | hxcpp layout | JavaScript behavior | Recommendation |
| --- | --- | --- | --- | --- | --- |
| `@:structInit` class with generated constructor | 490 plain production literals can retain structural syntax | Exact adapters or canonical construction still required | Native class fields can use fixed layout | Prototype and optional-own-property changes if enabled on JS | Use behind a cpp canonical-ID allowlist. |
| Plain class with generated constructor | Rewrite all 530 production literals to `new` or factories | Exact adapters still required | Same class-layout opportunity | Same prototype risk if enabled on JS | Use only for explicit boundary adapters, not general emission. |
| Class on every target | Same source mechanics as chosen class form | Same normalization work | Captures cpp opportunity | Changes the established JS plain-object bridge and its oracles | Reject. |
| `#if cpp` class, typedef elsewhere | Same Haxe type name on both branches | cpp compiler exposes every nominal mismatch | Captures the user-priority target | JS output and Vitest oracle remain byte-for-byte on the typedef path | Adopt first. |
| cpp-and-Neko conditional class | Same as cpp branch | Must compile and test both native representations | Captures cpp opportunity | JS remains unchanged | Consider only after separate Neko measurement. |

## Expected performance

The current 10,257 direct Haxe accesses are the maximum static opportunity, not a speedup prediction. Anonymous structures still use dynamic/hash-oriented field representation on hxcpp; a real class gives hxcpp a nominal layout and makes fixed-offset/native member access possible. The strongest expected gains are in frequently executed math, transform, particle, and render-state paths, while cold serialization documents may show no meaningful wall-clock change.

`Camera2D` is an ideal correctness/performance pilot: it has six required fields, one plain production literal, no normalization or observability finding, and 17 direct static sites. The existing camera projection executes 50 `Camera2D` field accesses in one representative update. Converting the clean camera record first can validate the layout hypothesis without entangling transform normalization. Converting all relevant camera/transform records could eventually address the full 205-access frame projection, but `HasTransform2D` and `HasTransform2DRuntime` first need their anonymous, dynamic, and cross-schema sites normalized.

`ParticleEmitterData` and `ParticleEmitterState` are clean required-field candidates with 641 direct static sites combined. They form a useful second benchmark lane after the single-schema camera pilot.

Neko has a hash-oriented object model too, so the same source hot paths could benefit from a more nominal representation, but it does not offer the same fixed native-layout argument as hxcpp. Treat the benefit as plausible and unquantified. More importantly, the known Neko GL cost includes a large FFI component that this change cannot remove. Neko acceptance should use a CPU-only camera/math/particle benchmark and must not infer class success or failure from GL frame time.

The Linux missing-shapes/text defect is outside this design. It was traced independently to `bufferSubData` behavior and fixed in the Lime CFFI workaround; no class-emission decision should use that correctness bug as evidence.

## Migration gates

1. Add a default-off cpp class allowlist keyed by the exact canonical IDs already used by typed-struct lowering. No checker-derived schema may enter automatically.
2. Emit `@:structInit` class plus deterministic constructor under `#if cpp`, with the current typedef under `#else`. Start with `Camera2D` only.
3. Require unchanged JS generation and upstream Vitest results, cpp compile/portable tests, and an interleaved parent/candidate cpp benchmark against the same renderer, build mode, frame count, and machine.
4. Add `ParticleEmitterData` and `ParticleEmitterState`; benchmark particles in at least six interleaved pairs and record allocation as well as frame time.
5. Expand to the 199 clean required-field schemas only through reviewed allowlist diffs. Compile success is necessary but not sufficient; preserve mutation and reference identity.
6. Apply the constructor/default, absence, and provenance policy in [`typed-struct-optional-policy.md`](typed-struct-optional-policy.md), then consider reviewed subsets of the remaining 92 clean schemas. The current direct-site filter is not sufficient for bulk enablement.
7. Resolve the itemized normalization and observability sites before enabling any of the remaining schemas. Never replace normalization with an unchecked native cast.
8. After hxcpp results are positive, try the identical reviewed allowlist on Neko behind a separate condition and CPU-only benchmark. Keep it target-disabled if it does not earn its complexity.

Every class tranche must keep `reports/typed-struct-classes.json` stable except for intentional classification changes, run the full generator and Haxe portability checks, and report generated `_Runtime` residuals plus the target benchmark. The census itself authorizes no emission change.
