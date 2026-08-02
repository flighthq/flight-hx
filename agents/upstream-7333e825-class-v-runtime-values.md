# Upstream `7333e825` Class V Runtime Values

Status: binding design and completed Class V implementation in one review parcel. The implementation follows this policy mechanically; if review rejects the policy, the implementation is rejected with it. This campaign does not change callback/rest ABI behavior, data semantics, browser/async seams, constructor properties, tooling exclusions, or upstream source.

## Policy

The TypeScript program is the authority for whether a public name exists at runtime. Every resolved public export record carries a `runtime` decision derived from the canonical upstream checker and compiler options:

1. Resolve the lane's exported symbol with the checker. Follow aliases to the target symbol.
2. An explicit `export type`, type-only export specifier, or type-only namespace export is always erased, even if its target symbol also has a value declaration.
3. Otherwise, emit a runtime binding only when the target symbol has a TypeScript value side and at least one declaration that upstream JavaScript emit preserves. Classes, functions with implementations, non-ambient variables, regular enums, non-ambient namespaces, and type/value declaration merges qualify. Interfaces, type aliases, ambient declarations, overload signatures without an implementation, and declarations from `.d.ts` files do not.
4. A `const enum` follows the upstream program's actual compiler semantics: it has a runtime binding only when `preserveConstEnums` or `isolatedModules` preserves it. Under the current upstream configuration both are disabled, so a hypothetical `const enum` is erased and its uses are inlined; enabling either option makes the same declaration eligible without a generator name change.

There is no allowlist of Flight names or value families. A new upstream enum or const object exported through a public lane becomes runtime-bearing without a generator edit. Conversely, a pure type never acquires a runtime object because another declaration elsewhere happens to share its text name.

## Representation

### Const objects and value/type pairs

Ordinary exported values retain their lowered initializer. When an upstream symbol deliberately has both a type side and a value side with the same public name, the public Haxe type keeps the upstream name and the value moves mechanically to the source's hidden values module as `<Name>Value`. All value references and JavaScript bridges resolve that owner by source identity and fingerprint, then restore the upstream public name at the bridge.

The alias destination is checked before rewriting. If `<Name>Value` already belongs to any generated declaration in the target Haxe package, generation fails with both source identities; it never merges, overwrites, or chooses another suffix.

### Enums and namespaces

The JavaScript bridge exposes a plain runtime object matching TypeScript emit rather than the Haxe enum abstract itself:

- member names appear in declaration order and hold the exact lowered values;
- every numeric enum member also installs TypeScript's reverse `value -> name` property;
- JavaScript integer-index enumeration rules therefore place numeric reverse keys first in ascending order, followed by member names in declaration order;
- string members have no reverse property;
- members of a merged runtime namespace are appended in namespace source order and remain enumerable callable/value properties.

The object is constructed from ordered key/value pairs. That avoids relying on Haxe anonymous-object syntax for numeric keys and gives the JavaScript target the same assignment sequence as TypeScript's enum and namespace emit.

## Required negative boundary

Generator tests must lock all of the following:

1. Pure interfaces, type aliases, ambient variables/functions/namespaces, and `.d.ts` declarations have `runtime: false` and produce no runtime bridge object.
2. `export type { X }` and `export { type X }` remain erased when `X` has a value side in the target module; an ordinary value re-export of the same symbol remains runtime-bearing.
3. A value/type alias target that collides with an existing generated Haxe name fails generation with a deterministic diagnostic.
4. Regular enums are runtime-bearing; current-config `const enum` declarations are erased; `isolatedModules` or `preserveConstEnums` makes the same fixture runtime-bearing. Runtime-shape coverage asserts numeric reverse mappings, string-member behavior, merged namespace members, exact values, and `Object.keys` order.

The production inventory additionally records representative positive and negative decisions for `BlendMode`, `PathCommand`, `ImportDiagnosticSeverity`, `ImageChannel`, `ImageResourceReferenceKind`, `Skeleton2DAnimationPath`, `KeyCode`, a regular enum, and pure type exports.

## Expected emission boundary

Class V is intentionally not emission-neutral. Inventory/API reports gain the checker-derived runtime decision. Enum runtime objects gain TypeScript-compatible reverse mappings and merged namespace values. The generated Haxe tree and `flight.cjs` are therefore expected to change; baseline and candidate hashes will be recorded after deterministic regeneration and build.

No family-specific Haxe module or public API name is introduced. The runtime object remains the upstream JavaScript value, while Haxe consumers retain the existing type representation.

## Acceptance gates

- Regenerate twice and require byte-identical generated output on the second run.
- Run `npm run generate:check`, `npm run check`, the complete generator suite, the complete Haxe JavaScript build, and focused runtime-shape coverage.
- Record baseline/candidate SHA-256 for the generated `.hx` tree and `build/haxe-js/flight.cjs`.
- Run all 12 primary V package suites: `bitmap`, `importdiagnostics`, `input`, `particles-formats`, `path`, `render-wgpu`, `scene2d-resources`, `scene3d-resources`, `shading`, `shape`, `skeleton2d`, and `textinput`.
- Rerun and reclassify the mixed suites where V was secondary: `effects`, `effects-gl`, and `scene3d-gl`.

Only failures whose first actionable signature is a missing or malformed runtime value object belong to this parcel. Later registry, callback, data, and async failures remain visible and are not repaired here.

## Implemented mechanism

Inventory and API schemas advance to 4 and 3 respectively. Every one of the 30,935 lane export records carries the checker decision. Of those records, 21,909 have a runtime binding and 9,026 erase; 167 runtime records need a separate binding identity because the public type declaration and emitted value declaration differ. The latter includes values such as `BlendMode`, `ImageChannel`, `PathCommand`, and `KeyCode` without naming any of those families in the rule.

The resolver consumes the runtime declaration's source, kind, and fingerprint throughout canonical value aliases, package and SDK facades, exact mock synchronization, and JavaScript bridges. Explicit type-only export syntax is checked before alias resolution. Runtime value aliases use the deterministic `<Name>Value` rule and fail before emission when that Haxe identity is occupied.

Enums lower a checker-derived reverse-mapping flag per member. Numeric and string-backed Haxe enum representations retain exact initializers, while the JavaScript facade is assembled from ordered pairs. Numeric members add the reverse pair; string members do not. Merged namespace functions follow the member pairs in source order. The current `AppearanceFlags` result has the exact TypeScript key sequence, including the signed `Any` reverse key and the five namespace methods.

## Emission evidence

The generated-tree digest is the SHA-256 of the sorted per-file SHA-256 list for every generated `.hx` file. The JavaScript digest is the direct SHA-256 of `build/haxe-js/flight.cjs`.

| Artifact | Baseline | Candidate |
| --- | --- | --- |
| Generated `.hx` tree | `f6a19f78036cb15b191127acd7736b82873fd9b2ce8f44baab9b5006ba0b4e27` | `ee6b12e73df6bb215e6d6cbf8bfd3fe95a5f9c522955a6ac6fa1163c6e8d4279` |
| `flight.cjs` | `8765ac801ff5a97414c07d3d25b2fe14961c9c916ea80ce766426f8448a30104` | `b1bca1b7344ae26a1f43ef83dcd3c98f4ba17cda2951a2613384d87f0caa3810` |

Two consecutive generation passes produced candidate tree digest `ee6b12e7...`; the final `generate:check` also passed. `npm run check`, all 115 generator tests, `build:haxe:js`, and `test:haxe:all` pass. Focused runtime inspection confirms the root bridge exposes `BlendMode`, `ImageChannel`, `PathCommand`, and `KeyCode`; `BatchFormat` is `{ 0: 'Quad', 1: 'VertexStream', Quad: 0, VertexStream: 1 }`; and `Object.keys(AppearanceFlags)` is exactly `0, 1, 2, 4, 8, 16, None, Visible, Alpha, BlendMode, Clip, Scale9Grid, Any, -2147483648, any, has, add, remove, clear`.

## Primary Class V packages

| Package | Result | Classification |
| --- | --: | --- |
| `bitmap` | 372/372 | Pass |
| `importdiagnostics` | 7/7 | Pass |
| `input` | 109/109 | Pass |
| `particles-formats` | 255/255 | Pass |
| `path` | 211/211 | Pass |
| `render-wgpu` | 204/205 | The remaining failure expects the original `DOMException`; Haxe wraps it in `haxe_ValueException`. Not V. |
| `scene2d-resources` | 23/23 | Pass |
| `scene3d-resources` | 94/99 | Three async timeouts and two `null`-versus-`undefined` promise results. Not V. |
| `shading` | 75/75 | Pass |
| `shape` | 125/125 | Pass |
| `skeleton2d` | 45/45 | Pass |
| `textinput` | 148/148 | Pass |

No primary failure has a missing or malformed runtime-value first signature.

## Mixed-family reclassification

| Package | Result | Classification |
| --- | --: | --- |
| `effects` | 364/364 | Pass |
| `effects-gl` | 250/266 | All 16 failures retain the existing registry/application callable signature, `undefined.apply`. Not V. |
| `scene3d-gl` | 407/407 | Pass; the focused worker completed in 2,121,347 ms after sustained CPU with no intermediate assertion output. |

This parcel ends with Class V. It does not begin Class R or any later class.
