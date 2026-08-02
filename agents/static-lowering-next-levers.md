# Static Lowering Next Levers

Status: the shared static-facts mechanism, primitive Boolean/numeric emission, the checker-proven indexed-access tranche, the emitter-known synthetic Array follow-up, the storage-compatible part of the mixed-union follow-up, and the proven Array destructuring tranche are enabled. Review's Step 3 script benchmark was positive overall: camera2d stayed flat while particles improved 21% by median.

## Typed method-call census at upstream 7333e825

A checker census over the 140 translated production packages (tests and the derived `tool-capture` exclusion omitted) found 1,888 calls on proven Array, typed-array, Map, Set, WeakMap, or WeakSet receivers:

| Emission path                    |     Calls |
| -------------------------------- | --------: |
| Direct collection calls          |     1,722 |
| Direct typed-array `subarray`    |        43 |
| Existing method-specific helpers |        55 |
| Dynamic `_Runtime.callProperty`  |        68 |
| **Total**                        | **1,888** |

All 68 dynamic survivors are typed-array `set` calls; there are no collection survivors and no optional-call or spread-argument cases.

| Proven receiver                   | Dynamic `set` calls |
| --------------------------------- | ------------------: |
| `Float32Array`                    |                  34 |
| `Uint8Array`                      |                  12 |
| `Uint8ClampedArray`               |                   9 |
| `Uint32Array`                     |                   7 |
| `Uint16Array`                     |                   4 |
| `Int16Array`                      |                   1 |
| `Uint16Array` or `Uint32Array`    |                   1 |
| **Total**                         |              **68** |

The next approved general lever is a method-specific checker-proven typed-array `set` lowering. It must preserve the source-array argument exactly, coerce only the optional numeric offset, and use a union-aware endpoint for the single `Uint16Array | Uint32Array` receiver. Merely adding `set` to the current generic typed-array binding is unsound: that emitter applies `Std.int` to every argument and would corrupt the source array. Focused mesh parity already passes with the dynamic route, so this is a portability/performance lever rather than an emergency correctness patch.

This proposal covers two independent generator optimizations after typed-struct tranche 5:

1. checker-proven indexed access for arrays and typed arrays;
2. checker-proven Boolean truthiness and numeric relational comparison.

The census uses the same non-test, non-barrel TypeScript source set as `lowerPackage`. Generated-call counts are from the current `generated/` tree.

## Indexed access census before enablement

The generated tree contains 8,371 dynamic indexed-access helper calls:

| Helper              |     Calls |
| ------------------- | --------: |
| `_Runtime.getIndex` |     5,314 |
| `_Runtime.setIndex` |     3,057 |
| **Total**           | **8,371** |

The checker sees 7,438 calls whose receiver is one non-null built-in array family and whose key is numeric. That is 88.9% of the generated helper surface: 4,523 reads and 2,915 writes.

| Proven receiver family                  | Source-backed calls |
| --------------------------------------- | ------------------: |
| `Float32Array`, including readonly      |               3,371 |
| `Array<T>`                              |               2,358 |
| Tuple / readonly tuple                  |                 606 |
| `Uint8ClampedArray`, including readonly |                 699 |
| `Uint8Array`, including readonly        |                 192 |
| `Float64Array`, including readonly      |                 110 |
| `Uint16Array`                           |                  63 |
| `Int32Array`                            |                  20 |
| `Int16Array`                            |                   9 |
| `Uint32Array`, including readonly       |                  10 |
| **Total**                               |           **7,438** |

This first tranche deliberately rejects mixed storage unions. Examples left dynamic include `Uint16Array | Uint32Array` (40 calls), `number[] | Float32Array` (19), and wider array/typed-array unions. It also rejects `ArrayLike`, strings, regexp match arrays, arbitrary index signatures, nullable/optional receivers, deletes, and nonnumeric keys.

There are 358 emitter-synthetic indexed reads: 241 destructuring reads, 79 iteration-pair reads, 27 high-arity flight-argument reads, and 11 destructured-parameter reads. The flight-argument and iteration reads have emitter-known `Array<Dynamic>` storage and can be a small follow-up. Destructuring should wait until its source receiver fact is retained in IR.

## Indexed receiver proof

Add an optional static-facts record to `IrExpression`, populated by a thin wrapper around `lowerExpression`. For an element expression, retain an indexed receiver only when all of these hold:

- every non-null union constituent resolves to the same storage family;
- arrays and tuples resolve through `checker.isArrayType` / `checker.isTupleType`;
- a typed-array symbol resolves by standard-library declaration identity, not by its spelling alone;
- `Readonly<T>` and a type parameter's base constraint recursively resolve to that same family;
- every key constituent is `NumberLike`;
- the access is not optional.

The binding is one of `Array`, `Float32Array`, `Float64Array`, `Int16Array`, `Int32Array`, `Int8Array`, `Uint16Array`, `Uint32Array`, `Uint8Array`, or `Uint8ClampedArray`. An unresolved, mixed, nullable, or shadowed identity carries no binding and follows the current dynamic path.

Tests should include a locally shadowed `Float32Array`, unconstrained and constrained generics, same-family and mixed-family unions, readonly wrappers, fractional keys, side-effecting receiver/key/value expressions, out-of-bounds reads, and coercing signed/unsigned writes.

## Indexed emission

Use typed inline endpoints rather than emitting `Std.int(key)` unconditionally:

- the JS branch uses raw `source[key]`, preserving JavaScript fractional and named-key behavior;
- the portable branch casts to the proven Haxe storage and uses `source[Std.int(key)]`, matching current portable behavior;
- setters store once and return the original right-hand value, rather than the coerced typed-array value;
- endpoint arguments preserve receiver, key, and value evaluation order.

A scratch endpoint proof passed Haxe Eval and JS execution for ordinary arrays, `Float32Array`, and coercing `Uint8Array` writes. The JS output inlined every endpoint call and retained raw fractional-key behavior. Haxe produced the Neko artifact, but this workspace has no `neko` executable to run it.

The first implementation should convert ordinary reads, simple writes, and the current get/set pair used for compound assignments. Increment, delete, optional access, mixed unions, and synthetic destructuring remain on their existing helpers.

## Enabled indexed result

Generation now emits `_StaticIndex` inline endpoints for the ten single-family and two mixed receiver bindings. Exact final-output counters, collected after speculative emission has been discarded, report 7,588 direct operations:

| Receiver                   | Direct reads | Direct writes |     Total |
| -------------------------- | -----------: | ------------: | --------: |
| `Array`                    |        2,615 |           453 |     3,068 |
| `ArrayOrFloat32Array`      |            4 |            15 |        19 |
| `Float32Array`             |        1,392 |         1,979 |     3,371 |
| `Float64Array`             |           59 |            51 |       110 |
| `Int16Array`               |            5 |             4 |         9 |
| `Int32Array`               |           13 |             7 |        20 |
| `Int8Array`                |            0 |             0 |         0 |
| `Uint16Array`              |           37 |            26 |        63 |
| `Uint16ArrayOrUint32Array` |           27 |             0 |        27 |
| `Uint32Array`              |            2 |             8 |        10 |
| `Uint8Array`               |          164 |            28 |       192 |
| `Uint8ClampedArray`        |          340 |           359 |       699 |
| **Total**                  |    **4,658** |     **2,930** | **7,588** |

The generated tree retains 406 `_Runtime.getIndex` and 126 `_Runtime.setIndex` calls. Checker-proven source facts account for 4,555 reads and 2,932 writes before final module/patch selection; exact final-output counters are authoritative and additionally include the 106 emitter-known reads and 240 direct destructuring reads below.

Adversarial coverage includes all ten families, locally shadowed types, unconstrained and constrained generics, same-family and mixed-family unions, readonly wrappers, fractional keys, side-effecting receiver/key/value expressions, out-of-bounds reads, setter result identity, and signed/unsigned/clamped coercion. The endpoint smoke passes Eval, JavaScript, and Python. It also replaces fixed-width-shift coercion in the portable `Int8Array`/`Int16Array` fallbacks, which was incorrect on Python's unbounded integers.

## Enabled synthetic Array result

The emitter now marks two Array sources it creates itself instead of routing their reads through `_Runtime.getIndex`:

| Synthetic source                     | Direct reads |
| ------------------------------------ | -----------: |
| For-of iteration bindings            |           79 |
| Packed high-arity function arguments |           27 |
| **Total**                            |      **106** |

Both classes use `_StaticIndex.readArray` and contribute to the exact Array/direct-index totals above. Dedicated report counters keep them separate from checker-proven source expressions. Dictionary and presence-sensitive schemas are unchanged.

## Enabled Array destructuring reads

Destructuring retains a checker-proven source receiver in IR and records final-output counts with emission markers that are stripped before generated Haxe is written. The exact 240 reads whose source is proven to use ordinary Array storage now call `_StaticIndex.readArray`; the generated-tree SHA-256 is `7fb39b6fb779838926fded9d2aa44ff31f2ca54f7778801660fa046c7ea9914f`.

| Source shape | Direct `Array` reads | Parked reads |   Total |
| ------------ | -------------------: | -----------: | ------: |
| Assignment   |                   20 |            0 |      20 |
| Declaration  |                  209 |           12 |     221 |
| Parameter    |                   11 |            0 |      11 |
| **Total**    |              **240** |       **12** | **252** |

The 12 parked reads are specialized regexp result arrays, kept outside the ordinary Array identity proof:

| Source identity                                                       | Type               | Reads |
| --------------------------------------------------------------------- | ------------------ | ----: |
| `upstream/packages/particles-formats/src/particleDesignerParse.ts:32` | `RegExpExecArray`  |     4 |
| `upstream/packages/particles-formats/src/starlingPexParse.ts:244`     | `RegExpExecArray`  |     4 |
| `upstream/packages/spritesheet-formats/src/libgdxAtlasParse.ts:201`   | `RegExpMatchArray` |     2 |
| `upstream/packages/spritesheet-formats/src/starlingParse.ts:101`      | `RegExpMatchArray` |     2 |

The schema-v8 lowering report records proven, direct, receiver/source-shape, and parked-reason counts. Adversarial coverage keeps non-Array proven storage families, nullable sources, structural `ArrayLike` and dictionary shapes, heterogeneous storage unions, wider unions, and regexp result arrays dynamic. This confines the approved endpoint to exact Array facts even if future upstream code adds other provable receiver families.

## Enabled storage-compatible mixed unions

The approved pool contains 59 exact two-member mixed-union sites. The generator now binds the 46 operations whose members can share a sound endpoint:

| Receiver binding                | Direct reads | Direct writes |  Total |
| ------------------------------- | -----------: | ------------: | -----: |
| `ArrayOrFloat32Array`           |            4 |            15 |     19 |
| `Uint16ArrayOrUint32Array`      |           27 |             0 |     27 |
| **Enabled**                     |       **31** |        **15** | **46** |
| Width-sensitive unsigned writes |            0 |            13 |     13 |

The 13 `Uint16Array | Uint32Array` writes remain dynamic and are counted explicitly as `widthSensitiveMixedWrites`. JavaScript can preserve the selected typed array's coercion through raw indexing, but the non-Lime portable fallback erases both wrappers to an underlying `Array`; a shared setter therefore cannot distinguish 16-bit from 32-bit coercion soundly. Eight wider tuple/Array/Float32Array-union writes were outside the approved pool and also remain dynamic. Optional/nullish receivers, heterogeneous Array/typed-array unions, dictionaries, presence-sensitive schemas, and destructuring remain parked.

## Truthiness and comparison census

The current generated tree contains 8,137 explicit `_Runtime.truthy` calls and 4,030 `_Runtime.compare` calls: 12,167 visible dynamic helper calls.

The source checker proves 7,877 explicit truthiness operands to be non-null Boolean values. The remaining source conditions are nullable, numeric, string, object, or dynamic; three additional generated truthiness calls inspect synthesized async-iterator `done` fields.

It also proves 4,021 relational expressions to have two numeric operands. Nine source expressions compare strings and one WebGPU limit access is checker-dynamic. These remain on `_Runtime.compare`.

Boolean-only expression helpers expose a second opportunity beyond the visible call count:

| Expression helper   | Checker-proven direct cases |
| ------------------- | --------------------------: |
| `_Runtime.select`   |                       1,690 |
| `_Runtime.andValue` |                       1,285 |
| `_Runtime.orValue`  |                       1,420 |
| **Total**           |                   **4,395** |

Direct conditional and logical emission removes both a helper dispatch and the generated closure while preserving laziness.

## Primitive proof and emission

Use the same expression static-facts record:

- `truthiness: boolean` only when every checker constituent is `BooleanLike` and none is nullish;
- `relationalOperands: number` only when every constituent on both sides is `NumberLike`.

Then:

- emit a Boolean condition or `!` directly, casting the operand to `Bool` only where Haxe needs it;
- emit numeric `<`, `<=`, `>`, and `>=` directly;
- emit `&&` / `||` directly only when both operands are proven Boolean;
- emit a direct ternary when its condition is proven Boolean, with `Dynamic` arm casts where needed;
- retain all current helpers for nullable Boolean, number truthiness, string/object truthiness, mixed unions, and dynamic values.

Direct numeric relation preserves `NaN`, infinities, signed zero, evaluation order, and short-circuit behavior because no JavaScript coercion is possible for checker-proven numeric operands. Number truthiness is not included: preserving `0`, `-0`, and `NaN` would need a separate single-evaluation endpoint.

## Recommended sequence

1. Land the shared static-facts mechanism with adversarial lowering tests and no emission change. Completed.
2. Enable Boolean truthiness plus numeric relations. Completed; review measured script frame cost at about 8.8 ms versus 15.2 ms before enablement.
3. Enable typed indexed endpoints for the ten single-family receiver bindings. Completed locally with exact generated counters and cross-target smoke coverage.
4. Measure Step 3 in review's update-and-prepare benchmark against the new 8.8 ms baseline. Completed: camera2d was flat; particles improved from 35.0 to 42.9 median fps across five runs per side, a 21% gain with non-overlapping samples.
5. Consider emitter-known synthetic arrays and homogeneous mixed typed-array unions only as separately audited follow-ups. The 106-read synthetic Array slice and 46 storage-compatible mixed-union operations are completed; 13 width-sensitive mixed writes remain explicitly parked.
6. Retain, audit, and directly emit exact Array destructuring sources. Completed: 240 `Array` reads use `_StaticIndex.readArray`, while 12 regexp-result reads remain explicitly parked and dynamic.

Each enablement should retain exact generated coverage counters, analogous to typed-struct direct-emission coverage, so a checker or upstream drift cannot silently change the optimized surface.
