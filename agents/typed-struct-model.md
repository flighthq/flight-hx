# Typed Struct Lowering Proposal

Status: design approved and implemented across the complete checker-derived universe. There are 1,536 semantically eligible canonical schemas, 400 direct-emission schemas, and 11,816 generated direct accesses. `Rectangle` now emits 667 direct accesses; its two `HitArea` presence tests remain operation-local `_Runtime.hasField` checks. Cpp class layout remains a provenance-gated allowlist, currently containing `Camera2D` and `ParticleEmitterState` only.

## Goal

Use TypeScript's structural type graph to emit direct Haxe anonymous-structure field reads and writes for stable Flight data shapes. Today many interfaces already appear in declarations as Haxe `typedef` structures, but expression lowering does not retain the receiver's resolved interface. Consequently, even a parameter declared as `Vector2` becomes `_Runtime.field(vector, 'x')` and `_Runtime.setField(...)`.

The first implementation should change only receiver binding and field emission. It must not change the public Flight API, object layout, package facades, or JavaScript bridge behavior.

## Type model and placement

The TypeScript `Program` and `TypeChecker` are the source of truth. Syntactic name matching is insufficient for aliases, imported interfaces, generic substitution, intersections, and contextual object literals.

Each eligible interface or object-shaped type alias becomes a structural schema with:

- its defining declaration identity;
- fully substituted type parameters at each use;
- declared fields, optionality, readonly state, and inherited fields;
- any string/number index signature;
- an eligibility classification and the reason for any dynamic escape.

Public typedef placement is name-addressed: every exported declaration from `@flighthq/types` owns `flight.types.<TypeName>`, independent of the defining TypeScript file. Source provenance remains in the declaration and generated manifests, while non-public helper types may remain with their implementation source. Package and SDK facades reference the canonical type module; they do not receive duplicate typedefs.

Anonymous inline object types may remain inline Haxe structures. If the same resolved shape is reused enough to require a name, the generator should create a private, deterministic helper typedef in the owning implementation module, keyed by source identity rather than a hash that can churn when unrelated files change.

Inheritance is flattened before emission. Duplicate compatible fields merge, while incompatible inherited fields are a generation error with both TypeScript declaration locations. Declaration merging, callable interfaces, construct signatures, and class/interface merges are initially ineligible.

## Structural versus nominal choices

Flight data interfaces and object-shaped aliases are structural. Values are eligible when assignability is determined by fields and the runtime does not depend on prototype identity.

The following remain nominal or dynamic:

- TypeScript classes and values tested with `instanceof`;
- branded or unique-symbol types whose brand carries a real invariant;
- browser, Node, WebGL, WebGPU, Canvas, and host objects owned by a maintained backend;
- callable/constructable objects and interfaces whose methods depend on JavaScript `this`;
- shapes involved in declaration merging that cannot be represented by one closed typedef.

An interface may contain callback-valued fields and remain structural. Receiver-sensitive methods escape at member granularity: those members remain dynamic while independent data fields on the same schema may bind directly. Whole-schema fallback is reserved for cases where the emitter cannot split the accesses cleanly.

Direct access is based on the resolved receiver schema, not the spelling of the variable. Aliases, `Readonly<T>`, generic instantiations, unions whose non-null members resolve to the same schema, and contextual object literals therefore share the same binding. A union of unrelated shapes does not.

## Optional fields and `undefined`

The port has an intentional target split:

- JavaScript preserves JavaScript `undefined` through `_Runtime.UNDEFINED`.
- Non-JavaScript targets define `_Runtime.UNDEFINED` as `null`, so absent, explicit `undefined`, and `null` cannot always be distinguished.

Typed struct lowering must preserve that existing contract rather than imply a distinction the native representation cannot provide.

Both `field?: T` and `field: T | undefined` emit as `Null<T>` where `T` is not already nullable or dynamic. Only `field?: T` carries `@:optional`. A required `field: T | undefined` remains required in object literals and never gains `@:optional`; its value may be `_Runtime.UNDEFINED`, which is `null` on non-JavaScript targets. This preserves the distinction between declaration presence and value undefinedness wherever the target can represent it.

Object literals continue to omit fields that were omitted in TypeScript. Explicit `undefined` initializes the field with `_Runtime.UNDEFINED`; that remains distinguishable from omission on JavaScript and collapses to `null` on native targets. Reads become direct `owner.field`. Existing strict-undefined checks continue to compare the result with `_Runtime.UNDEFINED`.

Operations that observably distinguish ownership from value, including `'field' in value`, `Object.hasOwn`, and serialization policies based on property presence, do not infer presence from `owner.field != null`. They use the maintained presence seam. Presence sensitivity is an operation-level escape: the individual check remains dynamic without disabling direct reads and writes elsewhere on the same schema.

No native absent-value sentinel is planned for the near phases. A distinct sentinel is reconsidered only if the audit identifies a hot presence-sensitive operation that cannot be handled at the maintained boundary.

Optional receiver chains must evaluate the receiver once and skip argument or right-hand-side evaluation when nullish. The emitter can use a scoped Haxe block temporary, as typed collection lowering does; it must not duplicate an effectful receiver expression.

## Direct field emission

The IR should carry a typed-struct binding on property expressions, including the resolved schema and field record. Emission is then:

- read: `owner.safeField`;
- write: `owner.safeField = value`;
- compound write: use the typed field directly, provided its lowered Haxe type supports the operator;
- optional receiver read: a single-evaluation block returning `_Runtime.UNDEFINED` for a nullish receiver;
- declared function field call: direct field read followed by the normal callable-value path.

Unknown property names never silently become direct access. If TypeScript says a closed typed receiver has no such field, generation fails unless the expression is explicitly in a dynamic-key escape described below.

Readonly is enforced during lowering: a generated assignment to a readonly field is an error even if Haxe's anonymous structure would permit it.

Internal typed-structure flows preserve reference identity and never copy. Haxe anonymous structures retain Flight's out-parameter and aliasing behavior. Boundary normalization may copy or validate only external dynamic ingress at runtime seam 3; it must not be inserted between internal producers and consumers.

## Index signatures and dynamic-key escapes

Declared, statically named fields may use direct access even when a schema also has an index signature. Computed access remains dynamic:

- `value[key]` uses `_Runtime.getIndex` or `_Runtime.setIndex`;
- `key in value` uses the maintained presence seam;
- `Object.keys`, spreads, and reflective enumeration retain their current runtime helpers.

`Record`, mapped types, dictionary types, and objects that are mutated with arbitrary keys remain dynamic in the first migration tranche. This avoids claiming that a closed Haxe anonymous structure can store open-ended native fields.

The generator should record every escape with a stable reason in a struct-lowering audit report: index signature, computed key, incompatible union, platform object, nominal class, receiver-sensitive method, unsupported mapped type, or unresolved declaration. An explicit semantic patch may force a boundary dynamic, but it must carry the same source identity and drift checks as other patches.

## Migration order

Migration is leaf-first so compile failures remain local and each step reduces reflection measurably:

1. Numeric leaf values with closed fields: `Vector2`, `Vector3`, `Quaternion`, `Matrix3`, `Matrix4`, `Rectangle`, and the render-hot RGBA multiplier/offset record `ColorTransform`.
2. Small immutable options and result records composed only of primitives and migrated leaves.
3. Node transforms, bounds, camera data, and other hot geometry aggregates.
4. Renderer state records and material descriptors after their platform handles are marked as dynamic leaf fields.
5. Broad scene, asset, host, and serialization documents.
6. Open dictionaries and unresolved mapped types only after their runtime seams and audits are proven; presence-sensitive operations remain separately audited escapes.

Each tranche starts with an allowlist of canonical schema identities. Expanding the allowlist is reviewed from the audit diff; eligibility must not silently widen because an upstream alias changed.

Each allowlist entry also has an explicit `audit-only` or `direct` emission mode. Semantic eligibility is reported independently from that mode. An eligible `audit-only` schema contributes pending-access counts but cannot create an IR binding or change generated Haxe; review advances the entry to `direct` only after accepting the audit diff.

The initial canonical candidate allowlist is:

- `@flighthq/types:upstream/packages/types/src/Vector2.ts#Vector2`
- `@flighthq/types:upstream/packages/types/src/Vector3.ts#Vector3`
- `@flighthq/types:upstream/packages/types/src/Quaternion.ts#Quaternion`
- `@flighthq/types:upstream/packages/types/src/Matrix3.ts#Matrix3`
- `@flighthq/types:upstream/packages/types/src/Matrix4.ts#Matrix4`
- `@flighthq/types:upstream/packages/types/src/Rectangle.ts#Rectangle`
- `@flighthq/types:upstream/packages/types/src/ColorTransform.ts#ColorTransform`

The generated audit determines which candidates are eligible for an emission tranche. A candidate with a schema-level reason remains unbound until review resolves or accepts that reason.

The initial performance acceptance target is removal of `_Runtime.field/setField` for the migrated leaf schemas in camera2d and shape/render hot paths, with a generated before/after count. Correctness gates remain more important than the count.

## Runtime seams requested

Basic direct reads and writes need no new runtime API. The complete model needs these maintained seams:

1. `hasOwnField(value, name)` and `hasField(value, name)` with documented JavaScript prototype behavior and a native anonymous-structure implementation.
2. One single-evaluation optional-chain helper only if scoped Haxe block expressions prove unsuitable on a supported target.
3. Boundary normalization for external dynamic objects entering a typed schema, if native targets require copying or validation rather than a cast.
4. Audit hooks or counters used only by tests to prove that allowlisted field access no longer reaches reflective helpers.

`UNDEFINED` should not become a new native sentinel object as part of the first implementation. That would be a repository-wide semantic change and must be reviewed separately.

The class-layout follow-up is audited in [`typed-struct-class-design.md`](typed-struct-class-design.md) and the generated `reports/typed-struct-classes.{json,md}` census. Cpp-only `@:structInit` emission is enabled for the provenance-closed `Camera2D` and `ParticleEmitterState` identities. Anonymous-structure access remains hash-oriented on hxcpp; no additional schema becomes nominal without a closed provenance proof.

## Implementation and verification gates

Implementation should be split into reviewable phases:

1. Add schema analysis and a checked-in audit report without changing emitted expressions. Authorized.
2. Add IR bindings and negative tests for unknown, readonly, computed, union, and presence-sensitive access. Authorized.
3. Enable the six audit-eligible leaf schemas and regenerate. Authorized and implemented after review of the phase-1 audit.
4. Expand through the small-record and hot transform/bounds/camera tranches. Authorized and implemented after separate audit and mechanism reviews.
5. Continue through the migration order only after each prior tranche passes.

Every phase runs generator unit tests, `npm run generate:check`, `npm run test:haxe:all`, the portability matrix, and all 131 upstream Vitest suites. A tranche is incomplete if a migrated schema still reaches `_Runtime.field`, `_Runtime.setField`, or `_Runtime.hasField` at an allowlisted source site.

The lowering audit report is generated as `reports/typed-structs.json` with a compact review table in `reports/typed-structs.md`. It records canonical identities, field optionality/readonly/undefinedability, member-level escapes, bindable access counts, and source locations for every dynamic escape. The separate class-feasibility census is generated as `reports/typed-struct-classes.json` and `reports/typed-struct-classes.md`.
