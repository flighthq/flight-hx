# Static Lowering Next Levers

Status: the shared static-facts mechanism and primitive Boolean/numeric emission are enabled. Indexed access remains audit-only pending its separate review gate.

This proposal covers two independent generator optimizations after typed-struct tranche 5:

1. checker-proven indexed access for arrays and typed arrays;
2. checker-proven Boolean truthiness and numeric relational comparison.

The census uses the same non-test, non-barrel TypeScript source set as `lowerPackage`. Generated-call counts are from the current `generated/` tree.

## Indexed access census

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

1. Land the shared static-facts mechanism with adversarial lowering tests and no emission change.
2. Enable Boolean truthiness plus numeric relations. This is the smallest emission change and removes almost the entire 12.2k visible helper surface.
3. Enable typed indexed endpoints for the ten single-family receiver bindings.
4. Measure each change in review's update-and-prepare benchmark before considering Boolean conditional/logical helpers.
5. Consider emitter-known synthetic arrays and homogeneous mixed typed-array unions only as separately audited follow-ups.

Each enablement should retain exact generated coverage counters, analogous to typed-struct direct-emission coverage, so a checker or upstream drift cannot silently change the optimized surface.
