# Upstream `7333e825` Class R Callback/Rest ABI

Status: binding design for the authorized Class R implementation. This document is committed before implementation so the generated changes and acceptance evidence can be judged against one mechanical policy. Class R does not change callable ownership, runtime value objects, JavaScript data semantics, browser/async behavior, constructor properties, tooling exclusions, or upstream source.

## Root cause

TypeScript rest parameters expose a positional callable: callers pass zero or more individual arguments and the callee collects them into one array. The generator instead gave anonymous rest functions a packed Haxe signature such as `function(args:Array<Dynamic>)`, then inferred that function-typed rest calls must pass one array argument. That private convention is not the TypeScript ABI. A JavaScript event emitter calling `(event, payload)` therefore left the generated callback with only `event`, while generated forwarding calls introduced extra arrays. The U7 observations are different projections of that same mismatch:

- zero-argument signals observed a fabricated `undefined` or failed while spreading it;
- one-argument callbacks observed `undefined` or an array-like numeric-key wrapper;
- many-argument host events lost every argument after the first;
- rest-forwarding IPC and shape calls added an array layer instead of expanding once.

The landed baseline proves the issue is downstream of Class C and V. Its generated-tree digest is `ee6b12e73df6bb215e6d6cbf8bfd3fe95a5f9c522955a6ac6fa1163c6e8d4279`, and its `build/haxe-js/flight.cjs` digest is `fb17854b068ae75bc4d0ad02e28084ba9293f49ad1eeabd04433688857ab6a97`.

## Mechanical ABI policy

1. Every TypeScript call boundary is positional. A source call `fn(a, ...tail)` supplies `a` followed by each element of `tail`; it never supplies `tail` as a private final array merely because the static type has a rest parameter.
2. A TypeScript rest declaration collects its positional suffix exactly once. Generated named functions and anonymous functions both use Haxe rest syntax, so `(...args)` has the same zero/one/many shape whether invoked by generated code, a JavaScript host, or a Haxe consumer.
3. Haxe's target reflection ABI is an implementation detail, not an observable source convention. When the checker proves that a source-declared callee has a rest parameter, emitted runtime dispatch records its fixed/rest split. JavaScript and Python receive positional arguments; targets whose `haxe.Rest` reflection ABI requires an array pack the suffix only at the final `Reflect.callMethod` operation.
4. Property calls preserve their receiver. The target-level Haxe-rest adapter resolves the member and invokes it with its original owner; the JavaScript path uses ordinary `owner[name](...args)` semantics.
5. Generic, declaration-file, untyped, and otherwise unproven callees are not guessed into a Haxe-rest convention. Their explicit spread operands still expand exactly once through the ordinary dynamic call path.
6. Ordinary fixed-arity callbacks retain their fixed parameters. Class R does not add rest capture, fabricate missing arguments, or change JavaScript's fixed-arity tolerance for a callback that has no source rest declaration.

The old `packedVariadicRestIndex` distinction is therefore invalid and will be removed. There is one source ABI and one target-only Haxe-rest adapter.

## Maintained implementation boundary

- Lowering attaches a single `haxeRestIndex` only for a checker-proven, non-declaration-file source signature with a rest parameter. Conflicting or unresolved signature evidence remains unannotated rather than selecting an arbitrary packing rule.
- Function-expression emission uses the normal rest parameter form instead of erasing `...` into an `Array` parameter.
- Value and property Haxe-rest calls share the same positional input array. The maintained runtime performs target-specific final packing where required and preserves a property receiver.
- Generic spread emission remains the fallback and stays independent of rest-signature inference.

No Flight package name, event name, callback arity, or payload type participates in the rule.

## Required generator boundaries

Positive coverage must lock:

1. zero-, one-, and many-argument anonymous rest callbacks emit Haxe rest syntax;
2. a fixed prefix plus rest suffix preserves both parts;
3. function-value and receiver-preserving property calls expand explicit spreads once;
4. generated named rest calls retain the portable Haxe-rest adapter;
5. a host-style callback invoked as `(event, payload)` reads the second positional value, and a signal-style callback observes the exact argument vector.

Negative and ambiguity coverage must lock:

1. a fixed-arity arrow remains fixed and receives no rest annotation;
2. an untyped, type-parameter, or declaration-file callee is not assigned a private packed convention;
3. a non-rest spread call continues through ordinary receiver-preserving spread dispatch;
4. overloads or unions that do not prove one rest index do not guess one;
5. no emitted IR or Haxe output retains `packedVariadicRestIndex` or packages a statically variadic call as `[fixed..., restArray]`.

Portable Haxe coverage must exercise direct and reflective zero/one/many calls. Haxe 4.3.7 accepts anonymous `function(...args:Dynamic)` on Eval, Python, and JavaScript, but a flattened `Reflect.callMethod` against that function fails on Eval. That probe is why the target-only adapter is required instead of treating JavaScript success as portable evidence.

## Authorized primary suites

All 14 Class R suites are mandatory:

| Package         | Required anchor                                                                            |
| --------------- | ------------------------------------------------------------------------------------------ |
| `assets`        | Aggregate progress reaches `6`, not `0`.                                                   |
| `host-electron` | Open-file receives `/tmp/file.txt`; IPC and updater events retain their complete payloads. |
| `host-tauri`    | Host event listeners fire exactly once.                                                    |
| `ipc`           | Payload `['x']` does not become `[['x']]`.                                                 |
| `movieclip`     | Callback observations retain value `2`.                                                    |
| `net`           | The progress callback receives the progress object itself, not a numeric-key wrapper.      |
| `quadbatch`     | Zero/one/two-argument signal emissions preserve their exact arity and values.              |
| `screen`        | The event payload remains `ScreenMetricsChanged`.                                          |
| `shape-formats` | Command/rest and texture callbacks expand once without an array wrapper.                   |
| `signals`       | Listener dispatch, cancellation, debounce, and throttle retain exact argument vectors.     |
| `statusbar`     | The backend callback result remains `42`.                                                  |
| `storage`       | Callback results remain `hello`, `null`, and `a`.                                          |
| `tilemap`       | Signal payload remains `[1, 2, 4]`.                                                        |
| `timeline`      | The callback payload remains `1`.                                                          |

The mandatory mixed reruns are `loader`, `effects-gl`, and `scene3d-resources`. `loader`'s post-C/V symptoms include callback-produced progress, item keys, completion results, and deferred release values; `effects-gl` exercises the adjacent callable-registry seam; `scene3d-resources` exercises adjacent async and return-value seams. A result is attributed to Class R only when the first changed observation is callback/rest arity or payload shape; unrelated async, data, registry, or host seams remain classified separately.

## Acceptance gates

- Commit this design before implementation.
- Run focused generator lowering tests with positive, negative, and ambiguity fixtures.
- Regenerate twice and require a byte-identical generated tree on the second pass.
- Run `npm run generate:check`, `npm run check`, the complete generator suite, `npm run test:haxe:all`, and portable target tests.
- Build the Haxe JavaScript bundle and record candidate SHA-256 values for the generated `.hx` tree and `build/haxe-js/flight.cjs` against the landed baseline above.
- Run all 14 primary Class R package suites and the mixed reruns. Record exact pass/fail counts and classify every remainder without pulling a later class into this parcel.

Implementation and final evidence will be appended to this document without changing the policy above.

## Implemented mechanism

- Lowering removes the private `packedVariadicRestIndex` path and records only a checker-proven `haxeRestIndex`. It rejects type parameters, declaration-file signatures, fixed/rest ambiguity, and conflicting rest indices rather than guessing.
- Anonymous and named source rest declarations both emit normal Haxe `...args` parameters. All generated call arguments are flattened positionally exactly once before runtime dispatch.
- Required and optional value/property endpoints share the same positional argument vector. Property endpoints resolve and call the member with its original receiver.
- JavaScript uses direct positional spread. Python uses flattened reflection because its generated Haxe-rest callable accepts positional arguments; Eval and other non-JavaScript targets use the recorded split to pack the final suffix at their Haxe reflection boundary.
- Python's native tuple representation for `haxe.Rest` is recognized by `_Runtime.iterable`, after a proven type check, so callback bodies consume the same array-shaped suffix as the other targets.

The maintained rule remains package- and arity-independent. The generated diff is confined to the 11 modules whose source callables prove the rest convention: six `host-electron` modules plus `ipc/Ipc.hx`, `shape-formats/ShapeJson.hx`, and three `signals` modules.

## Emission evidence

| Artifact | Landed baseline | Class R candidate |
| --- | --- | --- |
| Generated `.hx` tree | `ee6b12e73df6bb215e6d6cbf8bfd3fe95a5f9c522955a6ac6fa1163c6e8d4279` | `58145a0930b271acc04763468a9ff281159f0644b1667bdc380a6e910199cf47` |
| `build/haxe-js/flight.cjs` | `fb17854b068ae75bc4d0ad02e28084ba9293f49ad1eeabd04433688857ab6a97` | `cb6c564dad6a9e5f207336d2294164d265242e8fbce36a9c81f37c1772b4b80a` |

Two consecutive generator passes produced the same candidate generated-tree digest. The JavaScript bundle change is expected because the repaired callback/rest adapters and generated call sites are runtime-observable.

## Primary Class R results

| Package | Result | Classification |
| --- | --: | --- |
| `assets` | 31 passed, 1 failed (32) | The remaining immediate `mock.peak` observation is `0` rather than `6`; the generated async flow defers pre-await queue/start work through promise settlement, so this is Class A scheduling, not callback shape. |
| `host-electron` | 68 passed (68) | Green; open-file, IPC, notification, protocol, screen, and updater callbacks retain their full positional payloads. |
| `host-tauri` | 40 passed, 2 failed (42) | The original event-count failure is cleared. The two remaining menu/tray registration counts are `0` rather than `1` after the test flush and belong to Class A promise settlement. |
| `ipc` | 43 passed (43) | Green; rest payloads expand once. |
| `movieclip` | 52 passed (52) | Green; callback value `2` is retained. |
| `net` | 18 passed (18) | Green; progress callbacks receive the progress object. |
| `quadbatch` | 84 passed (84) | Green; zero/one/two-argument signal emissions preserve shape. |
| `screen` | 63 passed (63) | Green; the event payload remains `ScreenMetricsChanged`. |
| `shape-formats` | 28 passed (28) | Green; command and texture callbacks expand once. |
| `signals` | 39 passed (39) | Green; dispatch, cancellation, debounce, and throttle preserve argument vectors. |
| `statusbar` | 43 passed (43) | Green; callback result `42` is retained. |
| `storage` | 82 passed (82) | Green; callback results `hello`, `null`, and `a` are retained. |
| `tilemap` | 54 passed (54) | Green; the signal payload remains `[1, 2, 4]`. |
| `timeline` | 61 passed (61) | Green; callback payload `1` is retained. |

Twelve suites are completely green. Class R clears the host-electron payload family and the original host-tauri event-count failure; the three remaining primary assertions are independently classified as async scheduling/settlement.

## Mixed rerun classification

| Package | Result | Classification |
| --- | --: | --- |
| `loader` | 73 passed, 15 failed (88) | Unchanged. Six accounting/order observations (bandwidth, item key, failure result, byte total, and weighted progress) belong to Class D data/lexical-state semantics. Nine missing/deferred observations (bytes/status, fail-fast and pool timeouts, in-flight count, release callbacks, and priority completion) belong to Class A scheduling/settlement. None first fail on callback/rest arity or payload shape. |
| `effects-gl` | 250 passed, 16 failed (266) | Unchanged. Both registry/application groups still fail at `undefined.apply`; this is the Class D callable-registry/data-shape seam, not Class R forwarding. |
| `scene3d-resources` | 94 passed, 5 failed (99) | Unchanged. Three async timeouts belong to Class A; two promise results returning `null` instead of `undefined` belong to Class D return semantics. |

## Verification

- Focused positive, negative, and ambiguity generator fixtures pass, including fixed-prefix rest declarations, receiver-preserving property calls, declaration-file/generic exclusions, and conflicting signatures.
- The complete generator suite passes 116/116 tests.
- `npm run test:haxe:all`, `npm run build:haxe:js`, and the portable Eval, JavaScript, and Python smokes pass. The portable smoke now locks the exact three-argument signal vector `1,2,4`.
- C++ portability could not start because this workspace has neither `g++` nor `clang++`; this is an unavailable host prerequisite rather than a test failure.
- `npm run check` is the final post-commit repository gate; its attested result accompanies the handoff.

## Native regression follow-up

Final review found that upstream `signals/emitter.ts` calls `(signal.emit as (...a: any[]) => void)(...args)`. The asserted function type is not a declaration-backed rest convention: it changes only the checker view of a fixed-arity property. Assertions, `satisfies`, non-null, and parenthesized wrappers are now removed before the generator asks the checker for a rest signature. Consequently, only the underlying declaration can prove Haxe-rest dispatch, and `Emitter` once again emits an ordinary dynamic spread call.

The lowering suite includes the exact negative shape above and requires ordinary `_Runtime.apply`; its positive fixture still requires declaration-backed rest and `_Runtime.callHaxeRestValue`. Because generated anonymous rest declarations remain real Haxe-rest closures, emission now marks those closures with `_Runtime.haxeRest`. Native runtime adjustment uses that provenance only when ordinary/untyped reflection later reaches the closure. The registry uses `Reflect.compareMethods` identity arrays because Neko function values cannot be `ObjectMap` keys.

| Artifact                   | Corrected candidate                                                |
| -------------------------- | ------------------------------------------------------------------ |
| Generated `.hx` tree       | `64b8d1db8946c75d5d58c9c761288d93ffad3afcca8086a7606e9817fc7bfa44` |
| `build/haxe-js/flight.cjs` | `7c0f4773708686aee9cc1ee148d3cf5609c592b79242e3a820d9a167f41a49bb` |

Two consecutive generator passes produced the corrected generated-tree digest. The complete generator suite passes 117/117, all Haxe checks pass, and portable Eval, JavaScript, and Python pass. An explicit Neko `CoreSmoke` run passes the zero-, one-, and three-argument signal cases. C++ compiles and links the corrected runtime and then reaches the independently known `array out-of-bounds read was not nullish` assertion with status 255.

The focused upstream `signals` suite passes 39/39. The packaged Lime 8.3.2 sound example builds for Neko and advances beyond the former `Emitter` `Invalid call`; without a display server it stops at Lime's unrelated first-render Cairo-context guard. Exact pixel smoke remains unavailable in this workspace because Xvfb, X11 utilities, and ImageMagick are absent, and system package installation is not permitted by the host.

Packaging also removes an installed same-name artifact before archive installation and forces `HAXELIB_PATH` to its isolated repository, preventing a stale same-version Haxelib from shadowing the candidate. Two consecutive package runs and the final isolated consumer pass.
