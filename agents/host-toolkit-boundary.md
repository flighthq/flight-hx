# Host Toolkit Boundary

The port has three distinct responsibilities:

1. The transpiler preserves identities and operations proven by the TypeScript checker. It emits generated Haxe types and members directly and emits stable lookup keys for external identities it does not own.
2. `_Runtime` implements TypeScript/JavaScript language semantics in Haxe: coercion, reflection required by source semantics, promises, collections, typed-array operations, and related mechanics.
3. The maintained standard toolkit supplies declarations, values, and target adapters for external keys. This includes `_internal/dom/`, `WebExterns.hx`, `_HostValueLut.hx`, `_HostModuleLut.hx`, named backend adapters, and public packages such as `hostLime`.

Compiling green is not permission to move work between those layers. In particular, a missing native declaration or value must not make the transpiler replace a checker-known member with a Dynamic `_Runtime.field` or `_Runtime.callProperty` expression.

## Key spaces

| Key | Generated reference | Maintained provider |
| --- | --- | --- |
| `host:<TypeName>` | `flight._internal.dom.<TypeName>` | `src/flight/_internal/dom/<TypeName>.hx` |
| `external:<TypeName>` | `import flight._internal.WebExterns.<TypeName>` | `src/flight/_internal/WebExterns.hx` |
| `global:<ValueName>` | `flight._internal._HostValueLut.get/typeofValue('<ValueName>')` | `src/flight/_internal/_HostValueLut.hx` |
| `module:<specifier>#<binding>` | `flight._internal._HostModuleLut.get('<specifier>', '<binding>')` | `src/flight/_internal/_HostModuleLut.hx` and target module integration |

The generated references are fully qualified, so modules without a host dependency do not gain unused toolkit imports. Global keys are explicitly declared, and the toolkit separately lists which ones have a portable implementation; the remaining keys are explicit JavaScript-only capabilities. An unknown global key throws, non-JavaScript module lookup throws with its complete key, and a missing type declaration or manifest provider fails generation.

Constructor-shaped globals whose Haxe representation is not itself a class object use `_HostConstructor`. The token keeps construction, `instanceof`, and the small set of static members consumed by Flight behind one maintained value. `_Runtime.construct` and `_Runtime.isInstanceOf` dispatch through that token; generated code still refers only to the stable global key and does not know the target representation.

## Audit and Dynamic debt

Generation writes `reports/host-toolkit.json` and `reports/host-toolkit.md` after emitting Haxe. The report scans the final generated tree, not an intended allowlist, and records stable sorted keys, use counts and locations, providers, and coverage. Generation aborts when any referenced key is missing.

For types, `typed` means a maintained declaration is concrete; `dynamic-stub` means the toolkit still contains a `typedef ... = Dynamic` compatibility branch. For values, `portable` means the toolkit supplies a non-JavaScript implementation and `js-only` names a deliberate host-only capability. Those statuses are deliberately visible and do not count as transpiler coverage. Replacing a Dynamic or JavaScript-only toolkit entry is standard-toolkit work: add the declaration/value or adapter, then regenerate so the same generated key is audited against the improved provider.

The reports contain no timestamp. If a new upstream pin produces byte-identical generated Haxe and reports, those files do not need a churn-only recommit; the pin or other changed source-of-truth metadata still does.
