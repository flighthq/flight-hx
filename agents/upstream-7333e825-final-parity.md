# Upstream `7333e825` Final Parity Tranche

Status: implementation and focused verification complete on upstream `7333e825d9df46d737c5a6557acbed4805e19e57`. Class D passed independent review; Class A was handed to review independently before Class P verification and Class T accounting. Upstream source remains read-only.

## Artifact identity

Two consecutive complete generation/build passes produced the same final candidate:

- generated-tree SHA-256: `e2d9e9cea8b9c97c40f2a48a270eb329e61804e6a66ad5e13e689cafa5a64b79`;
- `build/haxe-js/flight.cjs` SHA-256: `49f94013d8b6d2baa16d11335e45541b04356d2acb6293c6407cb1f6453527ce`.

## Focused parity matrix

| Class | Package | Baseline | Final evidence | Disposition |
| --- | --- | --: | --: | --- |
| D | `log` | 114/115 | 115/115 | Grouped host `Error` identity expression; independently reviewed PASS. |
| D | `scene3d-formats` | 553/554 | 554/554 | Switch-owned break remains inside the source switch; independently reviewed PASS. |
| D | `render-wgpu` | 204/205 | 205/205 | Raw DOMException rethrow retains object identity; independently reviewed PASS. |
| D census | `particleemitter` | 194/194 | 194/194 | Historical D candidate was already green and remains collateral evidence. |
| A | `clipboard` | 52/56 | 56/56 | Dynamic method receiver survives protected/async continuations. |
| A | `geolocation` | 23/25 | 25/25 | Permission fallback retains its backend receiver. |
| A | `loader` | 73/88 plus one unhandled rejection | 88/88 | Synchronous-prefix queue effects run before the first real await; no unhandled rejection remains. |
| P verification | `swf` | Historical constructor-parameter-property failure | 76/76 | Already repaired by general constructor-parameter-property lowering; no new Class P implementation was needed. |

The exact focused reports are `reports/upstream-parity-log.json`, `reports/upstream-parity-scene3d-formats.json`, `reports/upstream-parity-render-wgpu.json`, `reports/upstream-parity-particleemitter.json`, `reports/upstream-parity-clipboard.json`, `reports/upstream-parity-geolocation.json`, `reports/upstream-parity-loader.json`, and `reports/upstream-parity-swf.json`.

## Class T denominator

`reports/inventory.json` inventories 141 canonical upstream packages. Exactly 140 are translated and enter the translated-package parity denominator. The remaining package, `@flighthq/tool-capture`, is explicitly excluded rather than silently omitted; its 27 production files and 25 test files remain in inventory accounting.

The source-derived exclusion is `node-playwright-tooling`: the package exposes one tooling binary, has zero SDK-barrel exposures, and its production host surface is limited to seven Node built-ins plus Playwright (one host dependency and eight distinct host imports). It is a Node/Playwright capture CLI, not a portable Flight SDK runtime package. Consequently it is recorded outside the 140-package translated pass/fail denominator while remaining visible as one exclusion in the 141-package canonical inventory.

## Gate matrix

| Gate | Result |
| --- | --- |
| `npm run check` | Pass: deterministic generation, typecheck, lint, formatting, API and patch audits. |
| `npm run test:generator` | Pass: 117/117, including positive, negative, ownership, collision, scheduling, and real-await boundaries. |
| `npm run test:haxe:all` | Pass. |
| `npm run build:haxe:js` | Pass. |
| Portable Eval / JavaScript / Python | Pass. |
| Portable C++ | Complete corpus compiles and links; execution reaches the pre-existing indexed-read assertion `array out-of-bounds read was not nullish`. This is not a Class D/A/P/T remainder. |
| `npm run package` | Pass after the separate artifact-classpath repair: archive build, isolated Haxelib install, consumer compile, and consumer execution all succeed. |

## Delivered changes and residuals

- Class D policies and evidence are in [`upstream-7333e825-class-d-data-semantics.md`](upstream-7333e825-class-d-data-semantics.md); review reproduced the hashes, exact suite totals, and native smoke and issued PASS.
- Class A policies and evidence are in [`upstream-7333e825-class-a-async-semantics.md`](upstream-7333e825-class-a-async-semantics.md); it was delivered to review as an independent parcel before P/T work.
- The Haxelib archive now merges maintained and generated trees into its artifact-local `src` classpath and fails on collisions. This removes consumer-working-directory dependence from `extraParams.hxml`.
- The only target-gate residual is the previously established C++ out-of-bounds indexed-read behavior. No focused D, A, or P package remainder survives, and T is an evidence-backed scope exclusion rather than an implementation failure.
