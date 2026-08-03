# Upstream `7333e825` Native Dynamic Arithmetic

Status: implemented and locally verified; independent native pixel validation remains with review.

## Root cause and policy

Native review isolated the fractional-alpha failure to hxcpp expression specialization. In generated `RenderAppearance.recalculateAppearance`, multiplying two inline `_Runtime.field` reads and passing the result directly to `_Runtime.setField` stored `0` for the true product `0.8`. The same binary with the arithmetic separated from the store retained `0.8`; downstream blending and drawing were healthy.

The repair is generator-wide rather than render-specific:

- arithmetic with a runtime-Dynamic emitted operand routes through non-inline `_Runtime` numeric helpers;
- subtraction, multiplication, and division are intrinsically numeric, while addition routes only when the TypeScript checker proves both operands NumberLike, preserving string and ambiguous `any` concatenation;
- typed local/literal arithmetic stays inline;
- typed-struct fields stay inline only when their emitted owner is typed too; a typed field reached through a Dynamic owner uses the helper;
- each helper accepts `Float`, computes into an explicitly typed `Float` local, and returns the boxed result as `Dynamic`. The boxed boundary prevents hxcpp store-site specialization while retaining compatibility with generated call sites that accept an integer-shaped Dynamic value.

Positive, negative, and ambiguity fixtures cover plain and compound property/index arithmetic, typed local arithmetic, and unproven `+`. `CoreSmoke` stores the product of two Dynamic field reads through `multiplyNumbers` and requires the fractional result `0.8` before later portability checks run.

## Generated census

Regeneration changes 458 generated Haxe modules. The final tree contains:

| Helper                     | Generated sites |
| -------------------------- | --------------: |
| `_Runtime.addNumbers`      |           1,013 |
| `_Runtime.subtractNumbers` |             787 |
| `_Runtime.multiplyNumbers` |           1,708 |
| `_Runtime.divideNumbers`   |             425 |

No direct `field(...) <arithmetic> field(...)` expression remains for the four covered operators. Both `RenderAppearance` alpha paths use `multiplyNumbers`, including parent alpha and root render alpha.

| Artifact                   | SHA-256                                                            |
| -------------------------- | ------------------------------------------------------------------ |
| Generated `.hx` tree       | `60aee396833ef0875ff684ce4e2d23afc6d609f28886cb7585cd0c179dac2a3f` |
| `build/haxe-js/flight.cjs` | `92b23961a050e242265d361741f9c1627f5bdebade10c078a2aa3960aaf43c59` |

`npm run generate:check` verifies the second generation against the committed tree.

## Verification

- `npm run check` passes generation drift, typecheck, lint, formatting, and API accounting.
- The complete maintained unit suite passes 118/118, including all 62 lowering cases.
- Full Haxe Eval compilation and CoreSmoke pass. Portable JavaScript, Python, and an explicit Neko CoreSmoke pass the fractional Dynamic product.
- Portable C++ compiles and links the complete regenerated corpus. CoreSmoke advances beyond the new fractional-product assertion and reaches the independently known later assertion `array out-of-bounds read was not nullish` with status 255.
- Focused upstream parity passes `render` 221/221, `geometry` 997/997, `materials` 161/161, `physics2d` 155/155, and `tilemap` 54/54. Exact results are in their package-specific `reports/upstream-parity-*.json` files.

Review owns the remaining native GL/Cairo pixel confirmation and the requested skeleton/spritesheet reruns on its landed native branch.
