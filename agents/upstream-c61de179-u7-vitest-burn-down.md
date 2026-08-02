# Upstream `c61de179` U7 Vitest Burn-down

Status: analysis-only census of the 65 failed package suites in the U7 run. This artifact changes no generator, runtime, generated, example, or upstream source.

## Canonical universe

The source is `reports/upstream-parity.json` as committed at `e12e603d`. That report is tied to upstream `c61de179af8a12c2fa3b9b7d5389ee302f577a0d`; later parity reports are not mixed into this census.

| Evidence | Value |
| --- | --- |
| Report SHA-256 | `11c47a22534c8bce28f1cc90f7da7eb6a3cab36db13181d14a2bf32e5564ceee` |
| Run interval | `2026-08-01T03:52:28.792Z` through `2026-08-01T03:59:31.908Z` |
| Jobs | 12 |
| Package suites | 139 total: 74 passed, 65 failed |
| Parsed tests | 11,576 passed, 1,748 failed, 213 skipped |
| Exceptional summaries | `input` failed during import with `no tests`; `tool-capture` exited nonzero after 63 passing tests |
| Failed-name SHA-256 | `18599457cfdec1379e4ffd6cd38034c9d5be1728732f0bdae354775b51e29a5e` |

Every failed suite is assigned exactly one primary class. The primary class is the earliest actionable blocker in the committed failure output, checked against the named source behavior. Later failures in the same suite are secondary and do not increment another class. Consequently these counts describe the first burn-down frontier, not a promise that one class repair makes every assigned suite green.

## Root-cause classes

| Code | Primary root-cause class | Suites | Share | Deterministic signature |
| --- | --- | --: | --: | --- |
| `C` | Callable export, contract, or test-double bridge loss | 31 | 47.7% | An expected production/backend/helper callable is absent, a Vitest contract mock lacks the callable export, or the generated call path bypasses the mocked callable entirely. |
| `V` | Runtime value-object loss | 12 | 18.5% | Import succeeds, then the first actionable use reads a named enum/constant member from `undefined`. |
| `R` | Rest/callback/event argument ABI loss | 14 | 21.5% | The call occurs, but the oracle sees no callback, a missing payload, or an extra array/object wrapper around the payload. |
| `D` | JavaScript data/structural semantic loss | 3 | 4.6% | The first blocker is a wrong object/error shape, numeric state, or binary result rather than a missing public value. |
| `A` | Browser/backend or asynchronous state-machine seam | 3 | 4.6% | Optional browser capabilities are dereferenced as present, or Promise/cancellation/scheduling behavior diverges. |
| `P` | TypeScript constructor-parameter-property lowering | 1 | 1.5% | Constructor parameters used as instance fields are absent; the SWF parser subsequently indexes missing state. |
| `T` | Excluded tooling dependency | 1 | 1.5% | The translated bridge intentionally excludes the Node/Playwright tool package and Vitest cannot resolve `@playwright/test`. |
|  | **Total** | **65** | **100.0%** | Complete, mutually exclusive accounting. |

Individual shares are rounded to one decimal place; the total is derived from the exact integer counts.

The first three classes contain 57 of 65 suites (87.7%). `C` and `V` are separate because a callable bridge repair cannot synthesize a runtime enum object, while value-object emission cannot repair canonical callable ownership, mock interception, or backend setters. `R` is also independent: its functions exist and execute, but payload packing is wrong.

## Package-by-package accounting

The evidence column quotes or tightly transcribes the first actionable U7 signature. For mixed suites, a semicolon records important secondary blockers without changing the primary class.

| Package | U7 summary | Class | Failure anchor |
| --- | --- | --- | --- |
| `application-gl` | 3 failed (3) | `C` | GL create/resize/destroy mocks all record zero calls: generated calls do not reach the contract test doubles. |
| `assets` | 1 failed, 22 passed | `R` | Progress callback total is `0`, expected `6`. |
| `bitmap` | 12 failed, 351 passed | `V` | `BlendMode.Multiply`/`Add` and related members are read from `undefined`. |
| `bitmaptext` | 2 failed, 34 passed | `C` | `getNode2DRuntime is not a function`. |
| `clipboard` | 4 failed, 52 passed | `A` | Web backend is `undefined` before `readFormat`, `readImage`, and `writeFormat`. |
| `debug` | 1 failed, 26 passed | `C` | `createRenderState is not a function`. |
| `effects` | 52 failed, 310 passed | `C` | First blocker is `createRenderState is not a function`; blend value objects are secondary. |
| `effects-canvas` | 22 failed, 85 passed | `C` | `createCanvasRenderTarget is not a function`; dynamic registration and texture-target callables also disappear. |
| `effects-gl` | 81 failed, 180 passed | `C` | `writeGlRenderTextureTarget is not a function`; blend values and incomplete GL mocks are secondary. |
| `effects-wgpu` | 18 failed, 109 passed, 59 skipped | `C` | `installWgpuMock is not a function`; blend values and a later worker exit are secondary. |
| `filesystem` | 97 failed (97) | `C` | First blocker is `setDialogBackend is not a function`; all 97 tests fail behind the registration seam. |
| `geolocation` | 2 failed, 23 passed | `A` | Absent web geolocation still dereferences `getCurrentPosition`. |
| `host-capacitor` | 2 failed, 41 passed | `C` | `getAppBackend` and `setAppBackend` are not functions. |
| `host-electron` | 8 failed, 60 passed | `R` | Host responses/events arrive as empty or truncated payloads (for example `''` instead of `/tmp/file.txt`); a clipboard setter loss is secondary. |
| `host-tauri` | 3 failed, 39 passed | `R` | Expected host event count is `0` instead of `1`; `setPlatformBackend` loss is secondary. |
| `image` | 2 failed, 32 passed | `C` | `createEntity is not a function`; the other test times out. |
| `importdiagnostics` | 6 failed, 1 passed | `V` | `ImportDiagnosticsSeverity.Skip`/`Drop`/`Reject` is read from `undefined`. |
| `input` | no tests | `V` | Module import fails reading enum-like member `AGAIN` from `undefined`, so no test executes. |
| `interaction` | 1 failed, 152 passed | `C` | `getNode2DRuntime is not a function`. |
| `ipc` | 6 failed, 37 passed | `R` | Payloads gain an extra array layer, for example `[["x"]]` instead of `["x"]`. |
| `lighting` | 2 failed, 91 passed | `C` | `createEntity is not a function`. |
| `loader` | 15 failed, 73 passed | `A` | Queue, cancellation, and Promise settlement diverge: wrong dispatch counts, timeouts, and `release is not a function`. |
| `log` | 1 failed, 114 passed | `D` | Non-Error `"oops"` becomes `{name: undefined, message: undefined}` instead of `{value: "oops"}`. |
| `materials` | 3 failed, 158 passed | `C` | First blocker is `createEntity is not a function`; material enum/value failures are secondary. |
| `movieclip` | 2 failed, 50 passed | `R` | Callback observation is `[undefined]`, expected to include `2`; a runtime getter loss is secondary. |
| `net` | 1 failed, 17 passed | `R` | Progress payload becomes `{"0": payload}` instead of `payload`. |
| `node` | 102 failed, 221 passed | `C` | `getEntityRuntime`/`getNodeRuntime is not a function`; blend values are secondary. |
| `particleemitter` | 2 failed, 192 passed | `D` | Velocity inheritance receives `undefined` where a number is required; zero-delta state is then corrupted. |
| `particles-formats` | 36 failed, 219 passed | `V` | Diagnostics severity members `Reject`/`Recover`/`Skip`/`Drop` are read from `undefined`. |
| `path` | 51 failed, 160 passed | `V` | `PathCommand.MOVE_TO`, `LINE_TO`, `CLOSE`, and related values are read from `undefined`. |
| `picking` | 3 failed, 30 passed | `C` | `ensureMeshGeometryBounds is not a function`; runtime/entity callables also disappear. |
| `quadbatch` | 4 failed, 80 passed | `R` | Zero-argument signal emission tries to spread `undefined`; one- and two-argument emissions deliver `undefined` payloads. |
| `render` | 11 failed, 133 passed | `C` | `getNodeRuntime is not a function`; a later worker exit is secondary. |
| `render-gl` | 89 failed, 26 passed | `C` | `createRenderState is not a function`; state-runtime/entity callables and blend values also disappear. |
| `render-wgpu` | 11 failed, 133 passed | `V` | First blocker reads blend member `Add` from `undefined`; runtime/proxy callable losses are secondary. |
| `scene2d` | 6 failed, 73 passed | `C` | `getEntityRuntime is not a function`; a blend value failure is secondary. |
| `scene2d-canvas` | 58 failed, 201 passed | `C` | `setRenderStateBackgroundColor is not a function`; proxy callables and blend values are secondary. |
| `scene2d-dom` | 83 failed, 82 passed | `C` | `getOrCreateRenderProxy2D is not a function`; blend value failures are secondary. |
| `scene2d-gl` | 50 failed, 63 passed, 14 skipped | `C` | Contract mock lacks `createGlRenderStateRuntime`; other runtime callables, path values, and a worker exit are secondary. |
| `scene2d-resources` | 2 failed, 21 passed | `V` | Resource reference members `Asset` and `Slot` are read from `undefined`. |
| `scene2d-wgpu` | 1 failed, 7 passed, 140 skipped | `C` | `installWgpuMock`/`createWgpuRenderStateRuntime is not a function`. |
| `scene3d` | 8 failed, 131 passed | `C` | `initTransform3DTrait` and `invalidateNodeParentReference` are not functions. |
| `scene3d-formats` | 133 failed, 399 passed | `D` | Inflater returns `null` for byte arrays and compressed round-trips; missing resource/diagnostic values are secondary. |
| `scene3d-gl` | 275 failed, 121 passed | `C` | First blocker is `createRenderState is not a function`; shading/value objects are secondary. |
| `scene3d-resources` | 62 failed, 34 passed | `V` | Resource reference member `Embedded` is read from `undefined`; `External`, `Error`, and `Unresolved` follow. |
| `scene3d-wgpu` | 241 failed, 55 passed | `C` | `createRenderState is not a function`. |
| `screen` | 1 failed, 62 passed | `R` | Event payload is `undefined`, expected `"ScreenMetricsChanged"`. |
| `shading` | 21 failed, 54 passed | `V` | Image-channel/shading values such as `Normal`, `Effect`, `Emissive`, and `AwayFromLight` are read from `undefined`. |
| `shape` | 17 failed, 108 passed | `V` | Shape command members `MOVE_TO` and `NO_OP` are read from `undefined`. |
| `shape-formats` | 2 failed, 26 passed | `R` | Each command receives its entire argument array as argument zero plus defaults; texture resolution likewise returns an array-wrapped object. |
| `signals` | 10 failed, 29 passed | `R` | Listener observations remain empty, then argument destructuring receives non-iterable `undefined`. |
| `skeleton2d` | 10 failed, 35 passed | `V` | Skeleton channel members `Rotation`, `Translation`, and `Color` are read from `undefined`. |
| `skeleton2d-formats` | 7 failed, 111 passed | `C` | `getSkeleton2DSkin is not a function`; channel values are secondary. |
| `skeleton3d` | 10 failed, 32 passed | `C` | First blocker is `createEntity is not a function`; node and bounds callables also disappear. |
| `statusbar` | 1 failed, 42 passed | `R` | Backend callback result is `undefined`, expected `42`. |
| `storage` | 3 failed, 79 passed | `R` | Storage callback results are `undefined`, expected `"hello"`, `null`, and `"a"`. |
| `swf` | 19 failed (19) | `P` | All failures index missing parser state (`Cannot read properties of undefined (reading '0')`); later constructor-parameter-property lowering is the matching repair seam. |
| `text` | 14 failed, 181 passed | `C` | First blocker is `getEntityRuntime is not a function`; text metrics/runtime callables are also absent. |
| `textinput` | 26 failed, 103 passed | `V` | Key-code members `BACKSPACE`, `A`, `C`, arrows, `V`, and `RETURN` are read from `undefined`. |
| `textlayout` | 4 failed, 147 passed | `C` | `setTextShaperBackend is not a function`. |
| `textshaper-canvas` | 17 failed (17) | `C` | `setTextShaperBackend is not a function`. |
| `texture` | 7 failed, 87 passed | `C` | `createEntity is not a function`. |
| `tilemap` | 3 failed, 51 passed | `R` | Signal arguments are non-iterable `undefined` or `[undefined, undefined, undefined]` instead of `[1, 2, 4]`. |
| `timeline` | 1 failed, 60 passed | `R` | Timeline callback payload is `undefined`, expected `1`. |
| `tool-capture` | 63 passed, process failed | `T` | Vitest cannot resolve `@playwright/test` from `captureBrowser.ts`. |

## Burn-down order

1. Repair `C` as one canonical callable-ownership/bridge campaign, but retain focused sub-gates for production contract exports, backend registration functions, test-only helpers, and Vitest mock interception. It owns 31 first blockers and is also secondary in several other suites.
2. Emit and bridge runtime-bearing `V` declarations as values, not erased type aliases. Start with the shared diagnostic severity, blend, path/shape command, resource-reference, image-channel, skeleton-channel, and key-code families.
3. Repair `R` at the common callback/rest boundary. The empty, `undefined`, nested-array, and numeric-key-wrapper observations are one ABI family across signals, IPC, hosts, progress, storage, and timeline consumers.
4. Split `D` into focused semantic probes before implementation: Error identity (`log`), particle numeric state, and typed-array/inflate byte copying (`scene3d-formats`). These are not justified as one implementation patch.
5. Treat `A` as seam-specific work: guard absent web APIs for `clipboard` and `geolocation`, and separately model loader scheduling/cancellation/Promise settlement.
6. Keep `P` as an independently verified lowering repair and `T` as an explicit tooling/environment decision. Neither should be hidden inside SDK parity percentages.

This ordering maximizes first-blocker reach while preserving causal separation. Mixed suites must be rerun after their primary blocker clears; their recorded secondary signatures become the next frontier rather than being counted as a new suite now.

## Reproducible accounting check

From a repository containing commit `e12e603d`:

```sh
git show e12e603d:reports/upstream-parity.json > /tmp/u7-parity.json
sha256sum /tmp/u7-parity.json
node - <<'NODE'
const fs = require('node:fs');
const report = require('/tmp/u7-parity.json');
const document = fs.readFileSync(
  'agents/upstream-c61de179-u7-vitest-burn-down.md',
  'utf8',
);
const failed = report.packages
  .filter((entry) => entry.status === 'failed')
  .map((entry) => entry.package);
const rows = [...document.matchAll(/^\| `([^`]+)` \| [^|]+ \| `([CVRDAPT])` \|/gm)]
  .map((match) => ({ package: match[1], rootCause: match[2] }));
const counts = Object.fromEntries(
  ['C', 'V', 'R', 'D', 'A', 'P', 'T'].map((code) => [
    code,
    rows.filter((row) => row.rootCause === code).length,
  ]),
);
if (report.packages.length !== 139 || failed.length !== 65) throw new Error('U7 universe drift');
if (JSON.stringify(rows.map((row) => row.package)) !== JSON.stringify(failed)) {
  throw new Error('package accounting drift');
}
if (JSON.stringify(counts) !== JSON.stringify({ C: 31, V: 12, R: 14, D: 3, A: 3, P: 1, T: 1 })) {
  throw new Error(`class accounting drift: ${JSON.stringify(counts)}`);
}
console.log({ packages: report.packages.length, failed: failed.length, counts });
NODE
```

Expected final line:

```text
{ packages: 139, failed: 65, counts: { C: 31, V: 12, R: 14, D: 3, A: 3, P: 1, T: 1 } }
```
