# U1 Item 4: Checker-Derived Host Endpoint Contract

Status: implemented for upstream `c61de179af8a12c2fa3b9b7d5389ee302f577a0d` without beginning the statement, exclusion, report-regeneration, or package-validation work assigned to items 5–7.

## Discovery and contract

The generator now discovers Canvas2D, canvas-element, DOM, WebGL2, and WebGPU receiver use from TypeScript checker identities. It records calls, reads, writes, source sites, overload-specific runtime endpoints, and closed computed WebGL constant unions across production sources in every translated package. Package exclusions, test files, and declarations remain outside this audit by the same maintained source boundary used by the port.

[`tools/generator/src/host-endpoints.ts`](../tools/generator/src/host-endpoints.ts) is the single host endpoint contract used by both lowering and emission. It records the operations implemented by each maintained Canvas, DOM, WebGL, and WebGPU backend. Canvas2D and WebGL2 are typed-only surfaces, so uncovered use fails generation. Canvas-element, DOM, and WebGPU receivers retain their deliberate dynamic fallback for members outside an explicit backend: the checker still inventories the host use, but lowering preserves the existing `_Runtime` route instead of pretending a backend switch implements it. The duplicate lowering and Haxe-emitter name sets are gone.

Computed WebGL access no longer recognizes field names such as `src` or `equation`. Lowering derives the complete string-literal union and its alias name from the checker, stores that domain in IR, and emits an exhaustive runtime switch whose cases must also exist in the shared WebGL contract.

## Current census

The deterministic audit currently records:

| Metric                                  | Count |
| --------------------------------------- | ----: |
| Checker-proven receiver bindings in use |     9 |
| Canonical endpoints                     |   373 |
| Property accesses                       | 3,474 |
| Calls                                   | 2,201 |
| Reads                                   | 1,026 |
| Writes                                  |   247 |
| Backend contract operations             |   378 |
| Dynamic-fallback endpoints in use       |    11 |
| Coverage issues                         |     0 |

The audit discovers all 26 WebGL additions supplied by the maintained runtime prerequisite: `blendEquationSeparate`, `blendFuncSeparate`, `isEnabled`, and 23 state-query constants. It also discovers both operations in the Canvas2D `isContextLost` probe: the `typeof` read and the subsequent call. The same operation-sensitive audit exposed the existing `roundRect` feature read; the maintained JavaScript backend now returns the bound method only when supported, while the Cairo backend returns its native method.

Growth outside the backend contract remains visible without being misrouted, including `HTMLCanvasElement.style`, `Document.activeElement`, `Navigator.onLine`, and `GPUDevice.features`; the audit records each against the maintained dynamic runtime. Conversely, the excluded `tool-capture` endpoints (`createImageData`, WebGL `finish`/`isContextLost`, and private `__ft*` helpers) do not enter the translated usage inventory.

## Generation-time closure

Core generation validates the audit before emitting modules. It fails deterministically for three independent gaps:

| Gap | Meaning |
| --- | --- |
| `usage-contract-gap` | Checker-proven Canvas2D or WebGL2 use has no explicit target-semantic endpoint. |
| `contract-runtime-gap` | A backend contract operation is absent from its maintained implementation. Canvas2D coverage is checked in both the JavaScript and Cairo branches. |
| `dynamic-runtime-gap` | An explicitly permitted dynamic fallback needs `callProperty`, `field`, or `setField`, but `_Runtime` does not expose that operation. |

`texImage2D` remains overload-specific: the nine-argument byte upload maps to `texImage2D`, while the six-argument host-source upload maps to `texImage2DSource`. Other arities fail as uncovered runtime endpoints.

## TextureSource boundary audit

The current `TextureSource` vocabulary split does not cross the maintained Haxe GL upload boundary. Upstream `glTextureUpload.ts` dispatches the discriminated vocabulary before the host call: bitmap data takes the nine-argument typed-byte upload, image data passes `image.source as TexImageSource` to the six-argument source upload, and compressed images take the decoder path. `WebGl2Backend.texImage2DSource` therefore continues to accept a host `Dynamic` source and never accepts or names `TextureSource`.

Focused regression coverage checks the exact census, the 26+1 additions, dynamic-fallback growth, excluded endpoints, deliberately uncovered contract/runtime methods, computed-union emission, and the unchanged TextureSource boundary.
