# Typed Struct Optional-Field Policy

Status: design only. This document does not authorize class emission or add any schema to an allowlist. It defines the constructor, absence, provenance, and acceptance policy required before migration Gate 6 can begin.

## Decision

Do not bulk-enable the current 92 clean optional/undefined schemas. The existing class-feasibility report is sufficient to identify direct normalization and observability findings, but it is not yet a proof that every nested runtime value has the candidate's nominal cpp class identity.

For an individually reviewed cpp class, use these value semantics:

- an optional TypeScript field becomes a `Null<T>` class field and an optional `?field:T` constructor parameter;
- omission, explicit `undefined`, and explicit `null` all store `null` on cpp, matching the port's existing non-JavaScript collapse of `_Runtime.UNDEFINED` to `null`;
- a required `T | undefined` field becomes a `Null<T>` class field with a required, non-`?` constructor parameter;
- domain defaults remain at their existing use sites; constructors provide no `0`, `false`, empty-string, array, object, or callback default;
- JavaScript keeps the existing anonymous typedef and emitted JavaScript must remain byte-identical.

A cpp class always has physical storage for every field. It therefore cannot preserve own-property absence, enumeration, spread, or reflection semantics. Any schema that requires physical absence remains a typedef. The value-level `null` policy is acceptable only for schemas that pass the closed observability and provenance gates below.

## Audited surface

The candidate set is the deterministic intersection of:

1. no normalization reason;
2. no observability reason;
3. at least one optional field or required field whose type includes `undefined`.

At the pinned upstream commit that filter produces:

| Measure                                        |                 Count |
| ---------------------------------------------- | --------------------: |
| Candidate schemas                              |                    92 |
| Schemas with optional fields                   |                    91 |
| Schemas with a required `T \| undefined` field |                     1 |
| Optional fields                                |                   236 |
| Required `T \| undefined` fields               |                     1 |
| Direct accesses                                |                   470 |
| Production object literals                     |    9 across 5 schemas |
| Production literals omitting an optional field |                     0 |
| Schemas with no recorded production literal    |                    87 |
| Test object literals                           | 537 across 77 schemas |
| Exported input-signature references            | 131 across 59 schemas |
| Exported output-signature references           |    2 across 2 schemas |
| Schemas with no bridge reference               |                    33 |
| Schemas with zero direct access                |                    12 |

The 236 optional fields span 52 exact TypeScript types. The dominant shapes are 108 `number | undefined`, 40 `string | undefined`, and 18 `boolean | undefined` fields. Eighteen fields are array-valued, four are callbacks, and two explicitly admit `null` as a top-level value in addition to `undefined`. No optional field is readonly or receiver-sensitive.

| Package                          | Schemas | Optional fields | Required-undefined fields |
| -------------------------------- | ------: | --------------: | ------------------------: |
| `@flighthq/types`                |      46 |             140 |                         1 |
| `@flighthq/scene-formats`        |      19 |              61 |                         0 |
| `@flighthq/spritesheet-formats`  |       7 |               7 |                         0 |
| `@flighthq/textureatlas-formats` |       7 |               8 |                         0 |
| `@flighthq/particles-formats`    |       5 |               6 |                         0 |
| `@flighthq/scene-resources`      |       4 |               9 |                         0 |
| `@flighthq/shape-formats`        |       2 |               2 |                         0 |
| `@flighthq/signals`              |       1 |               2 |                         0 |
| `@flighthq/tilemap-formats`      |       1 |               1 |                         0 |

The optional-field count per schema is also bounded: 37 schemas have one optional field, 19 have two, 11 each have three or four, three have five, five have six, two each have seven or eight, and one has nine. `ResourceLoadReport` is the remaining schema and has the sole required-undefined field.

The five schemas with recorded production literals are:

| Canonical schema | Literals | Omitted optional fields | Special exposure |
| --- | --: | --: | --- |
| `ResourceLoadReport` | 5 | 0 | required `group: string \| undefined`; no bridge reference |
| `ShellShortcutLink` | 1 | 0 | one input and one output signature reference |
| `LibgdxAtlasParseOptions` | 1 | 0 | one input signature reference |
| `StarlingParseOptions` | 1 | 0 | two input signature references |
| `TexturePackerMeta` | 1 | 0 | nested wire-format record |

`VideoResourceUrl` is the other output-exposed schema. It has no recorded production literal, six test literals, two input references, and one output reference.

These counts describe the current report, not an enablement list. A future report drift changes the design input and must be reviewed before any Gate-6 tranche.

## Constructor and field shape

Optional fields retain declaration order even when a required field follows them:

```haxe
#if cpp
@:structInit
class ExampleOptions {
  public var scale:Null<Float>;
  public var name:String;

  public function new(?scale:Float, name:String):Void {
    this.scale = scale;
    this.name = name;
  }
}
#else
typedef ExampleOptions = {
  @:optional var scale:Float;
  var name:String;
}
#end
```

Haxe accepts this interleaved optional/required constructor shape for `@:structInit` object construction. The generator must preserve exact source declaration order for fields, parameters, and assignments; it must not reorder required fields ahead of optional fields.

Field lowering removes the TypeScript `undefined` constituent and then applies `Null` once:

- `value?: number` -> field `value:Null<Float>`, parameter `?value:Float`;
- `name?: string` -> field `name:Null<String>`, parameter `?name:String`;
- `callback?: (x: number) => void` -> nullable function field and optional function parameter;
- `width?: number | null` -> field `width:Null<Float>`, parameter `?width:Null<Float>`;
- `value?: Dynamic` -> `Dynamic` remains the storage type, because `Null<Dynamic>` adds no representation;
- nested arrays, objects, and functions retain identity; the constructor must not clone or allocate a fallback.

The sole required-undefined form is different:

```haxe
@:structInit
class ResourceLoadReport {
  public var group:Null<String>;

  public function new(group:Null<String> /* other required fields */):Void {
    this.group = group;
  }
}
```

The missing `?` is semantically required. `{group: null, ...}` is valid on cpp, while omitting `group` must remain a compile error. This preserves the TypeScript distinction between `field?: T` and `field: T | undefined`.

## Absence semantics

| Source state | JavaScript typedef branch | cpp class branch |
| --- | --- | --- |
| Optional field omitted | no own property | optional constructor argument omitted; stored field is `null` |
| Optional field explicitly `undefined` | own property with value `undefined` | `_Runtime.UNDEFINED` is `null`; stored field is `null` |
| Optional field explicitly `null` | `null` when admitted by the TypeScript type | stored field is `null` |
| Optional field has a value | exact value and identity | exact value and identity |
| Required `T \| undefined` field | property must be present; value may be `undefined` | constructor argument must be present; value may be `null` |
| Domain fallback | evaluated by existing generated logic | evaluated by the same generated logic, not by the constructor |

On cpp, omitted, undefined, and null were already value-equivalent at the maintained runtime boundary. The class representation makes every field physically present, however. That difference is forbidden wherever `Reflect.hasField`, enumeration, object spread/rest, serialization, strict structural oracles, or an external output contract observes presence.

Adding one hidden presence bit per field would preserve more observability but would enlarge every record, require custom spread/JSON/reflection adapters, and undermine the fixed-layout goal. Gate 6 therefore does not use presence bits. A schema that needs them remains a typedef.

## Provenance closure is a prerequisite

The current 92-schema filter is not a complete nominal-identity proof. In particular, zero recorded production literals is not evidence that a value cannot exist at runtime.

Three concrete gaps require an audit revision before any optional schema is enabled:

1. `GltfDocument` has three dynamic JSON ingress sites and contains arrays of nominal child schemas. Eighteen otherwise-clean optional glTF child schemas inherit anonymous JSON element identity even though the current report records no direct dynamic ingress on those children. `GltfImportOptions`, the nineteenth `scene-formats` candidate, is an independent caller option and does not inherit this specific taint.
2. At least three clean spritesheet wire records and six clean texture-atlas wire records are nested under JSON-parsed document roots. Enabling a child class without deep normalization would make statically typed field access target a class layout on an anonymous parsed object.
3. `BitmapFontGlyphData` has no recorded production literal, but `bitmapFontRecord.ts` constructs it inside an array `map` callback. This construction is canonicalizable, yet it proves the direct object-literal census misses some container/callback contexts that class emission must rewrite and validate.

The audit must therefore build a canonical-instance provenance graph, not just a direct assignment census. For every candidate schema it must record:

- direct contextual object literals, including callback returns and generic/container inference;
- values read from `Array<T>`, readonly arrays, records, maps, promises, and nested schema fields;
- dynamic, JSON, bridge, cast, and anonymous roots;
- same-schema flows that preserve identity;
- explicit normalizers that allocate a real class;
- containment edges from a tainted parent or container to every reachable child schema.

Taint propagates through containment until a reviewed deep normalizer constructs the child class. Generation must fail if an allowlisted class has any value origin outside this closed set:

1. an emitter-marked contextual `@:structInit` literal;
2. an already-canonical value of the same exact schema ID;
3. a reviewed explicit normalizer that constructs the exact class;
4. `null`/undefined where the field admits absence.

Unchecked casts, parent typedef annotations, and container element types do not establish nominal identity.

## Eligibility policy

An optional/undefined schema may enter a cpp class allowlist only when all of these are true:

1. its exact canonical ID is separately reviewed;
2. it remains direct-eligible and has no normalization or observability reason;
3. the revised provenance graph has complete origin coverage and no propagated taint;
4. every construction is emitter-marked or passes through an explicit normalizer;
5. all optional fields support the `Null<T>` representation without a semantic adapter;
6. no use depends on physical absence or constructor-time domain defaults;
7. no bridge output exposes the class until native public absence semantics are explicitly accepted;
8. JavaScript generation is byte-identical to the typedef baseline;
9. cpp compile and portable behavior tests pass with real nominal-instance assertions.

Input-signature references are not automatic exclusions. A native caller can retain object-literal syntax through `@:structInit`, but consumer-style compile fixtures must cover omission, values, and interleaved required fields. The two output-exposed schemas, `ShellShortcutLink` and `VideoResourceUrl`, remain parked behind an additional public-observability decision.

Cold configuration and wire records should not be migrated merely because they compile. The whole 92-schema set offers only 470 direct accesses, and 12 schemas have none. A tranche must identify a measured layout or correctness benefit that justifies the nominal conversion and its maintenance cost.

## Required tests

### Generator

- classify optional and required-undefined fields separately from their canonical TypeScript declarations;
- lower optional primitive, reference, array, callback, union, explicitly nullable, and `Dynamic` fields deterministically;
- retain exact field/parameter order when optional and required fields interleave;
- reject any constructor that embeds a domain default or allocates a fallback;
- require every production construction origin to carry the exact class schema ID;
- fail on unmarked callback/container literals, spread/computed literals, cross-schema values, dynamic ingress, and propagated containment taint;
- report bridge input/output exposure and physical-presence observations separately;
- keep the cpp allowlist default-off and reject missing or stale canonical IDs.

### Haxe and cpp

- omitted optional numeric and boolean fields are `null`, never `0` or `false`;
- explicit `_Runtime.UNDEFINED` and explicit `null` store `null`;
- present primitive, string, array, object, and callback values retain value and reference identity;
- mutation and aliasing observe the same instance with no constructor copy;
- an optional parameter before a required parameter compiles and constructs correctly;
- omitting a required `T | undefined` field is a compile failure, while passing null/undefined is valid;
- the constructed value passes `Std.isOfType` for the exact cpp class;
- cpp portable tests exercise defaulting at the original use site.

### JavaScript

- compare the complete emitted JavaScript tree or bundle against the parent byte for byte;
- retain own-property distinction between omission and explicit `undefined`;
- retain current `Object.keys`, spread, JSON, and strict-equality behavior in focused fixtures;
- run affected upstream Vitest packages without modifying their assertions.

## Gate-6 staging

Gate 6 should be split into reviewable parcels rather than one 92-schema allowlist change:

1. **6.0 — provenance audit:** add origin/containment closure reporting only; enable no classes.
2. **6.1 — compiler fixture:** implement and test optional/required-undefined declaration mechanics with a synthetic schema; enable no production schema.
3. **6.2 — required-undefined pilot:** consider `ResourceLoadReport` alone. Its five production literals already supply `group`, it has no bridge reference, and omission can be compile-negative-tested.
4. **6.3 — input-only options:** select a small exact-ID tranche with closed provenance, no output exposure, real access benefit, and consumer compile fixtures.
5. **6.4 — output-exposed records:** consider `ShellShortcutLink` and `VideoResourceUrl` only after explicit native public-presence review.
6. **6.5 — parsed wire records:** keep nested glTF/spritesheet/texture-atlas schemas as typedefs unless a deep boundary normalizer is designed, measured, and independently approved.

Each parcel must report the full generated-source SHA and the generated-JavaScript-tree SHA separately, list every canonical ID added, prove provenance-report stability, run cpp portability, and leave Neko disabled. No Gate-6 result authorizes Gate 4 particles or any Gate-5 bulk expansion.
