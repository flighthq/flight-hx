# Typed Struct Lowering Proposal

Status: design for review; no struct-expression emission is authorized by this document.

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

Public typedef placement remains source-derived: `Foo` defined in `foo.ts` is emitted as `Foo` in that generated module. Haxe secondary-type imports remain the representation for additional declarations in the same source file. Package and SDK facades continue to point at that canonical declaration; they do not receive duplicate typedefs.

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

An interface may contain callback-valued fields and remain structural. A method signature is eligible only after it is proven to be used as a callback value without receiver-sensitive `this`; otherwise that schema remains dynamic for the first tranche.

Direct access is based on the resolved receiver schema, not the spelling of the variable. Aliases, `Readonly<T>`, generic instantiations, unions whose non-null members resolve to the same schema, and contextual object literals therefore share the same binding. A union of unrelated shapes does not.

## Optional fields and `undefined`

The port has an intentional target split:

- JavaScript preserves JavaScript `undefined` through `_Runtime.UNDEFINED`.
- Non-JavaScript targets define `_Runtime.UNDEFINED` as `null`, so absent, explicit `undefined`, and `null` cannot always be distinguished.

Typed struct lowering must preserve that existing contract rather than imply a distinction the native representation cannot provide.

Both `field?: T` and `field: T | undefined` are absent-capable in the Haxe type and emit as `Null<T>` where `T` is not already nullable or dynamic. An optional declaration also carries `@:optional`. This is required for primitive fields: an absent `number` or `boolean` must not become `0` or `false`.

Object literals continue to omit fields that were omitted in TypeScript. Explicit `undefined` initializes the field with `_Runtime.UNDEFINED`; that remains distinguishable from omission on JavaScript and collapses to `null` on native targets. Reads become direct `owner.field`. Existing strict-undefined checks continue to compare the result with `_Runtime.UNDEFINED`.

Operations that observably distinguish ownership from value, including `'field' in value`, `Object.hasOwn`, and serialization policies based on property presence, do not infer presence from `owner.field != null`. They use a dedicated presence seam. Until that seam exists on all targets, any schema used by such an operation remains on the dynamic access path for that operation.

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

## Index signatures and dynamic-key escapes

Declared, statically named fields may use direct access even when a schema also has an index signature. Computed access remains dynamic:

- `value[key]` uses `_Runtime.getIndex` or `_Runtime.setIndex`;
- `key in value` uses the maintained presence seam;
- `Object.keys`, spreads, and reflective enumeration retain their current runtime helpers.

`Record`, mapped types, dictionary types, and objects that are mutated with arbitrary keys remain dynamic in the first migration tranche. This avoids claiming that a closed Haxe anonymous structure can store open-ended native fields.

The generator should record every escape with a stable reason in a struct-lowering audit report: index signature, computed key, incompatible union, platform object, nominal class, receiver-sensitive method, unsupported mapped type, or unresolved declaration. An explicit semantic patch may force a boundary dynamic, but it must carry the same source identity and drift checks as other patches.

## Migration order

Migration is leaf-first so compile failures remain local and each step reduces reflection measurably:

1. Numeric leaf values with closed fields: `Vector2`, `Vector3`, colors, rectangles, quaternions, and matrix holders such as `Matrix3`/`Matrix4`.
2. Small immutable options and result records composed only of primitives and migrated leaves.
3. Node transforms, bounds, camera data, and other hot geometry aggregates.
4. Renderer state records and material descriptors after their platform handles are marked as dynamic leaf fields.
5. Broad scene, asset, host, and serialization documents.
6. Open dictionaries, mapped types, and presence-sensitive records only after their runtime seams and audits are proven.

Each tranche starts with an allowlist of canonical schema identities. Expanding the allowlist is reviewed from the audit diff; eligibility must not silently widen because an upstream alias changed.

The initial performance acceptance target is removal of `_Runtime.field/setField` for the migrated leaf schemas in camera2d and shape/render hot paths, with a generated before/after count. Correctness gates remain more important than the count.

## Runtime seams requested

Basic direct reads and writes need no new runtime API. The complete model needs these maintained seams:

1. `hasOwnField(value, name)` and `hasField(value, name)` with documented JavaScript prototype behavior and a native anonymous-structure implementation.
2. One single-evaluation optional-chain helper only if scoped Haxe block expressions prove unsuitable on a supported target.
3. Boundary normalization for external dynamic objects entering a typed schema, if native targets require copying or validation rather than a cast.
4. Audit hooks or counters used only by tests to prove that allowlisted field access no longer reaches reflective helpers.

`UNDEFINED` should not become a new native sentinel object as part of the first implementation. That would be a repository-wide semantic change and must be reviewed separately.

## Implementation and verification gates

Implementation should be split into reviewable phases:

1. Add schema analysis and a checked-in audit report without changing emitted expressions.
2. Add IR bindings and negative tests for unknown, readonly, computed, union, and presence-sensitive access.
3. Enable the leaf allowlist and regenerate.
4. Expand through the migration order only after each prior tranche passes.

Every phase runs generator unit tests, `npm run generate:check`, `npm run test:haxe:all`, the portability matrix, and all 131 upstream Vitest suites. A tranche is incomplete if a migrated schema still reaches `_Runtime.field`, `_Runtime.setField`, or `_Runtime.hasField` at an allowlisted source site.

Before implementation begins, review must settle:

- whether required `T | undefined` fields should carry `@:optional` or only `Null<T>`;
- whether native ownership checks justify a distinct absent sentinel in a later phase;
- the initial canonical leaf allowlist;
- whether receiver-sensitive method signatures make an entire schema dynamic or only escape those members.
