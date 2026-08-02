# Upstream `7333e825` Class D Data Semantics

Status: implemented and verified on review's landed Class R tree plus the native Lime guard, then rebased onto `origin/main` at `77722651`. The binding design and focused baseline reports were committed before implementation. Class D preserves TypeScript/JavaScript value, control-flow, and thrown-value semantics; it does not add Flight package allowlists, change upstream source, absorb Class A scheduling, or repair the separately recorded packaging layout.

## Fresh landed-tree census

The historical U7 census named `log`, `particleemitter`, and `scene3d-formats`. A fresh run against upstream `7333e825` resolves that stale frontier mechanically:

| Package | Landed result | First live divergence |
| --- | --: | --- |
| `log` | 114 passed, 1 failed (115) | Generated JavaScript emits `if (!value instanceof Error)`, so unary precedence turns the non-Error branch into an always-false test. |
| `particleemitter` | 194 passed (194) | Green on the current upstream revision; it is evidence that the historical numeric-state seam no longer belongs to the live Class D set. |
| `scene3d-formats` | 553 passed, 1 failed (554) | A `break` nested in a TypeScript switch case exits the generated surrounding parse loop after the first malformed OBJ line, leaving the aggregate count at `1` rather than `3`. |
| `render-wgpu` | 204 passed, 1 failed (205) | Haxe catches and unwraps a native DOMException, but `throw error` rewraps that non-`Error` host value as `haxe_ValueException` instead of rethrowing the identical object. |

The three live Class D suites are therefore `log`, `scene3d-formats`, and `render-wgpu`, matching review's authorization. The baseline generated-tree SHA-256 is `58145a0930b271acc04763468a9ff281159f0644b1667bdc380a6e910199cf47`; the baseline `build/haxe-js/flight.cjs` SHA-256 is `cb6c564dad6a9e5f207336d2294164d265242e8fbce36a9c81f37c1772b4b80a`.

## Mechanical policies

### Composable host identity tests

Runtime JavaScript syntax injected into a larger Haxe expression must be a grouped expression. `_Runtime.isError(value)` therefore emits `(value instanceof Error)`, not an ungrouped token sequence whose meaning changes under source unary `!`. Positive and negative tests must cover both Error and non-Error values, including the negated form used by `serializeLogError`.

### TypeScript switch break ownership

A TypeScript `break` exits its nearest switch or loop. Haxe has no implicit break for switch cases, and the emitter represents a TypeScript switch as an if/else chain. When a case retains a non-trailing break after the ordinary trailing-switch-break removal, the emitted case dispatch runs inside a one-iteration loop. A case-level break exits that wrapper; a break inside a nested source loop still exits that nearer loop. Switches with no residual break keep the existing compact emission.

This rule is derived from IR control flow. It does not depend on OBJ parsing, diagnostic fields, package names, or a particular nesting depth.

### Raw thrown-value identity

JavaScript permits throwing any value, and TypeScript rethrow preserves object identity. Synchronous generated `throw value` statements and generator-synthesized finally rethrows therefore call one maintained `_Runtime.throwValue(value)` endpoint. JavaScript uses a raw host throw so DOMException and other non-`Error` objects are not wrapped; portable targets use their normal Haxe throw operation. Async-flow throws remain Promise rejections and keep their existing path.

## Required boundaries

Focused generator/runtime coverage must lock:

1. negated `instanceof Error` retains grouping and returns the correct branch for strings and Errors on JavaScript;
2. a nested conditional break exits a switch but allows its surrounding loop to continue, while a break inside a nested loop retains loop ownership;
3. ordinary trailing case breaks and no-match switches retain existing behavior;
4. caught DOMException-like and primitive values are rethrown by identity on JavaScript, while Error rethrows remain unchanged;
5. Eval, JavaScript, Python, and C++ continue to compile the maintained throw endpoint.

## Adjacent, excluded seams

- Review's A/B native probe found the C++ `CoreSmoke` out-of-bounds typed-array read divergence on the pre-Class-R tree as well. It belongs to the indexed-read Class D backlog, not callback/rest forwarding or these three Vitest suites; the final matrix must report it truthfully unless separately authorized and repaired.
- The installed Haxelib archive currently exposes `src` as its class path while `extraParams.hxml` adds relative `generated`/`src` paths that resolve from the consumer directory. That packaging configuration is not a data-semantics repair and remains separately owned.

## Acceptance gates

- Commit this design and the fresh baseline reports before implementation.
- Add positive, negative, and nesting/ambiguity fixtures for every mechanical rule.
- Regenerate twice and require byte-identical generated output.
- Run `npm run check`, the complete generator suite, Haxe compilation, the supported portable matrix, and the JavaScript bundle build.
- Run all three live Class D suites plus green `particleemitter` as stale-census evidence; record exact results and classify every remainder.
- Record baseline/candidate generated-tree and `flight.cjs` hashes and hand off Class D independently before Class A begins.

## Implementation

Class D is implemented mechanically in the generator and maintained runtime:

- `_Runtime.isError` now injects a grouped JavaScript `instanceof` expression, so source negation composes with it correctly.
- A switch whose cases retain a switch-owned break runs its generated if/else dispatch inside a one-iteration wrapper. The emitter derives break and continue ownership from IR: nested loops retain their own controls, while a source continue escapes one or more switch wrappers and reaches its source loop exactly once.
- Synchronous source throws and generator-synthesized finally rethrows use `_Runtime.throwValue`. JavaScript throws the raw supplied value; portable targets use the native Haxe throw. Async-flow rejection remains unchanged.

The lowering fixture covers residual conditional breaks, a continue that crosses the wrapper, a nested-loop break, ordinary trailing case breaks, and synthetic finally rethrow output. `CoreSmoke` covers Error/non-Error classification plus raw object, primitive, and Error throw identity on JavaScript. The complete generator suite originally exposed only resource-sensitive checker-census timeouts: legitimate concurrent checks measured 129–131 seconds against 30-, 90-, and 120-second bounds. The maintained bound and two explicit census bounds are now 180 seconds; the unchanged default command passes all 116 tests.

## Candidate evidence

Two consecutive complete generator passes produced the byte-identical generated-tree digest `c6255d0a18800ab6ff6cc43536e837d5aca36a77b7c5ffe834242bb472513714`. The candidate `build/haxe-js/flight.cjs` digest is `bd114c53cc8d8023f0d74aa32fbbee6c49f11a0bc0bb67b42b8e7ac0ba2fd4a1`. After rebasing onto `origin/main` at `77722651`, both digests remained identical, so the focused package results below cover the rebased artifacts byte-for-byte.

| Package           | Candidate result | Disposition                                                          |
| ----------------- | ---------------: | -------------------------------------------------------------------- |
| `log`             | 115 passed (115) | Grouped host identity expression resolves the only baseline failure. |
| `scene3d-formats` | 554 passed (554) | Switch-owned conditional break no longer exits the OBJ line loop.    |
| `render-wgpu`     | 205 passed (205) | DOMException is rethrown as the identical host object.               |
| `particleemitter` | 194 passed (194) | Remains green as stale-census/collateral evidence.                   |

Post-rebase gates pass for `npm run check`, all 116 generator tests, the complete Haxe interpreter smoke, portable Eval, portable JavaScript, portable Python, and the Haxe JavaScript bundle build. The cold C++ gate compiles and links the complete generated corpus, including `_Runtime.throwValue`, then reaches the separately classified pre-Class-D runtime assertion `array out-of-bounds read was not nullish`. No Class D package remainder survives.
