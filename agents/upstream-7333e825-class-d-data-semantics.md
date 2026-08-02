# Upstream `7333e825` Class D Data Semantics

Status: binding design for the authorized Class D implementation on review's landed Class R tree plus the native Lime guard. This document and the focused baseline reports are committed before implementation. Class D preserves TypeScript/JavaScript value, control-flow, and thrown-value semantics; it does not add Flight package allowlists, change upstream source, absorb Class A scheduling, or repair the separately recorded packaging layout.

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

Implementation and final evidence will be appended without weakening the policy above.
