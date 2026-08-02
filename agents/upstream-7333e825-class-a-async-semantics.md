# Upstream `7333e825` Class A Async Semantics

Status: baseline design on review's landed Class D tree. This tranche covers the three authorized Class A suites: `clipboard`, `geolocation`, and `loader`. It preserves JavaScript dynamic receiver and async scheduling semantics mechanically; it does not add Flight package allowlists, edit upstream source, absorb Class P or T, or repair the separately recorded C++ indexed-read and Haxelib packaging seams.

## Fresh Class D candidate baseline

The baseline was captured from the byte-identical Class D candidate recorded in [`upstream-7333e825-class-d-data-semantics.md`](upstream-7333e825-class-d-data-semantics.md): generated-tree SHA-256 `c6255d0a18800ab6ff6cc43536e837d5aca36a77b7c5ffe834242bb472513714`, `build/haxe-js/flight.cjs` SHA-256 `bd114c53cc8d8023f0d74aa32fbbee6c49f11a0bc0bb67b42b8e7ac0ba2fd4a1`.

| Package | Baseline result | First live divergence |
| --- | --: | --- |
| `clipboard` | 52 passed, 4 failed (56) | `readHtml`, `hasImage`, `readRTF`, and `writeRTF` lose the object-literal method receiver before calling sibling methods (`readFormat`, `readImage`, or `writeFormat`). |
| `geolocation` | 23 passed, 2 failed (25) | The web backend's `requestPermission` loses its receiver before the fallback `this.getCurrentPosition({})`, so an absent browser capability rejects instead of resolving `false`. |
| `loader` | 73 passed, 15 failed (88), 1 unhandled rejection | Generated flow branches yield to microtasks before the source's first real `await`. Immediate in-flight state remains empty, factory side effects have not run when `startResourceLoad` returns, and overlapping drains can select the same pending entry. Wrong keys, counts, weights, outcomes, timeouts, and the cancellation rejection all follow from that scheduling divergence. |

The exact reports are `reports/upstream-parity-clipboard.json`, `reports/upstream-parity-geolocation.json`, and `reports/upstream-parity-loader.json`.

## Mechanical policies

### Lexical capture of a dynamic receiver

JavaScript object methods and ordinary functions receive `this` dynamically at invocation, while arrow functions and async continuations retain that receiver lexically. Generated Haxe therefore captures the dynamic receiver once at entry to a non-class function that actually references its lexical `this`, before any protected or Promise continuation closure is entered. Every receiver reference owned by that function, including references in nested arrow functions, reads the capture. A nested ordinary function or object method owns a distinct dynamic receiver and must not inherit the outer capture. Class methods retain Haxe's nominal `this` path.

The rule derives from TypeScript function boundaries and `this` ownership. It does not depend on clipboard formats, geolocation, a backend name, or whether the function happens to contain an `await`.

### Synchronous execution before the first real await

Calling a JavaScript async function executes its body synchronously until its first actually awaited value; only that await schedules a continuation. Generator flow outcomes (`normal`, `continue`, `break`, and `return`) and protected synchronous actions are therefore immediate internal values, not already-resolved Promises. Flow composition continues synchronously while it receives immediate values and switches to Promise continuation only when an emitted `await` produces a Promise.

The externally returned value remains a Promise in every async function, including no-await functions and early synchronous returns. Rejections, catch/finally override rules, awaited loop control, and portable non-JavaScript Promise behavior remain part of the same helper contract.

This rule is general async lowering. It does not special-case loader queues, concurrency values, resource keys, or signal names.

## Required boundaries

Focused generator/runtime coverage must lock:

1. an async object method can call a sibling through `this` both before and after an await, and a nested arrow retains the same receiver;
2. a nested ordinary function or nested object method does not inherit the outer receiver capture, while an object method with no `this` reference emits no unused capture;
3. an async function mutates synchronous-prefix state before returning, but code after a real await remains deferred;
4. a synchronously controlled flow loop advances before returning without recursive stack growth, while an awaited iteration resumes through the Promise path;
5. no-await async functions still return resolved or rejected Promises;
6. rejection recovery, finally override, break/continue/return propagation, and Eval/JavaScript/Python/C++ compilation remain intact.

## Acceptance gates

- Commit this design and the three fresh baseline reports before implementation.
- Add positive, negative, and nested-boundary/ambiguity fixtures for receiver capture and synchronous-prefix flow.
- Regenerate twice and require byte-identical generated output.
- Run `npm run check`, the complete generator suite, Haxe compilation, the supported portable matrix, and the JavaScript bundle build.
- Run all three Class A suites, record exact results, and classify every remainder.
- Record baseline/candidate generated-tree and `flight.cjs` hashes and hand Class A to review independently before verifying Class P and recording Class T.
