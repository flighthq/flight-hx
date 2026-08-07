# Upstream `cad72aa3` Host Ambient Type Mapping

Status: implemented, regenerated, and verified with review's maintained Haxe declarations combined at the integration gate.

## Identity rule

Host types are now classified by TypeScript checker identity and declaration origin. A resolved type declared by a non-ECMAScript TypeScript host library, a global ambient declaration file, or a global augmentation maps mechanically to:

```text
flighthq._internal.dom.<SameTypeName>
```

There is no type-name allowlist and no HTML, GPU, WebGL, event, or canvas prefix heuristic. External modules do not become host types merely because they contain declarations, and a symbol merged with an ECMAScript library declaration stays on the portable ECMAScript path. This keeps names such as a source-defined `HTMLFlightLocal` and the standard `Date` type out of the host mapping while admitting new ambient host types without a generator edit.

The same identity rule applies to explicit type references, inferred member receivers, and heritage clauses. The mapping preserves type arguments and records every arity used by the current upstream tree. Nullable or same-identity unions retain the mapped type. A heterogeneous union such as `HTMLImageElement | HTMLVideoElement` has no single host identity and remains `Dynamic`; the generator does not select one member arbitrarily.

## Member emission and failure behavior

Reads, writes, and calls on an unbound checker-proven host receiver use a target-conditional expression. On JavaScript, an explicitly mapped parameter emits `image.width`, while a host value recovered through a structural `Dynamic` path emits `(cast value : flighthq._internal.dom.HTMLImageElement).width`. The cast makes the real JavaScript extern resolve both the declaration and its member instead of silently accepting another dynamic lookup. Optional access evaluates the receiver once and preserves the existing nullish result. Spread calls use `Reflect.callMethod` only for JavaScript argument-spread semantics; the method value itself is still read as a direct typed field.

On non-JavaScript targets, the current maintained host declarations are `Dynamic` compatibility stubs rather than concrete implementations. Bare member syntax on those stubs is not equivalent to the established runtime boundary: Neko throws for an absent field instead of returning the nullish sentinel, and bare calls bypass receiver binding and callable-arity adjustment. Every ordinary mapped host site therefore retains `_Runtime.field`/`optionalField`, `setField`, `incrementField`, `deleteField`, and `callProperty`/`callOptionalProperty` in its non-JavaScript branch. A native type may widen the direct condition only when its maintained declaration becomes concrete and owns equivalent semantics.

Existing target-semantic host endpoints retain priority over this ordinary conditional route. Canvas2D, canvas-element, DOM-root, WebGL, and selected WebGPU operations still cross their maintained typed backend because that seam owns native portability or observable host semantics. The new mapping replaces the former runtime fallback with validated direct members only where the declaration is real; it does not bypass an already required backend or weaken compatibility-stub semantics.

No maintained declaration is synthesized by the generator. If the mapped `flighthq._internal.dom.<SameTypeName>` declaration is absent, Haxe compilation fails with that missing type. Likewise, real JavaScript externs can validate their declared member surface. Review owns the maintained declarations: the small real browser extern set under `#if js`, portable `Dynamic` typedef fallbacks, and the mechanically shaped tail stubs.

Unresolved source type names no longer collapse silently to `Dynamic`. A compile fixture proves that an unresolved `MissingHostType` remains visible in generated Haxe and produces `Type not found : MissingHostType`.

## Deterministic census

Generation writes [`reports/host-types.json`](../reports/host-types.json) and [`reports/host-types.md`](../reports/host-types.md). The report is derived from actual lowered type/member uses and is descriptive rather than an eligibility table. It records declaration sources, type-reference locations and arities, member names, operations, and locations in stable order.

For upstream `cad72aa3ea4e6e76a050918a403dcb10efdfcb0d` with exact `@webgpu/types@0.1.71`, the census is:

| Metric                   | Count |
| ------------------------ | ----: |
| Resolved host identities |   194 |
| Type references          | 1,397 |
| Member accesses          | 5,118 |
| Reads                    | 1,772 |
| Writes                   |   466 |
| Calls                    | 2,880 |

The WebGPU declaration pin is part of the checker input and therefore part of this same mapping change. It contributes 49 used `GPU*` identities plus four merged DOM identities (`HTMLCanvasElement`, `HTMLVideoElement`, `Navigator`, and `OffscreenCanvas`). The final report, rather than a hand-maintained stub list, is the source of truth for review's declaration integration.

The report contains no timestamp. Its upstream commit, declaration provenance, source coordinates, and sorted usage are deterministic generator inputs/outputs, so consecutive complete generations can be compared byte-for-byte.

## Regression coverage

Focused lowering fixtures cover:

- literal same-name type mapping and nullable retention;
- heterogeneous mapped-union fallback to `Dynamic`;
- direct read, write, call, and optional access;
- a structurally recovered receiver that requires a validating host cast;
- a source-defined host-looking name that is not classified by prefix;
- checker-routed instance and constructor globals plus an unresolved `GPU*` value that remains visible;
- an imported local constant typed as `GPUTextureFormat` that remains a local value while ambient `GPUTextureUsage` still routes through its maintained backend;
- an executable Neko compatibility-stub fixture proving tolerant absent-member reads and receiver-bound, arity-adjusted calls;
- deterministic report output under reversed input order; and
- loud Haxe failure for an unresolved type instead of silent `Dynamic` lowering.

## Verification

The generated Haxe tree is `1d1d1c59198b78bdcf05fd5851862f83f3594af0a2627de95f53890ab2f94915`. The combined-tree JavaScript bundle is `e88887cfe1e6e26fcecbf5dd6106a27250ad053caaf7430bcee4fed753f25ad8`. The machine-readable host report is `1647eaa52e9cab123c9e13c752d5cb3eeac517719961f91ac90f69d569916fdd`.

`npm run check` and all 129 generator tests pass. With review's exact 194-file maintained declaration census temporarily combined, the full Haxe namespace passes on Eval and JavaScript, and `CoreSmoke` passes on Eval, JavaScript, Python, Neko, and C++/hxcpp. The focused upstream `wgpuShadowMap.test.ts` file passes 18/18; its two former failures came from treating an imported local `SHADOW_DEPTH_FORMAT` constant as an ambient global, not from the maintained GPU flag namespaces. The effects and sound Lime examples compile for Neko with both Cairo and GL paths where applicable. Live window execution is unavailable on this host because it has no Xvfb/video display, while the executable Neko generator fixture covers both native compatibility-stub crash mechanisms directly. The integration gate also made declaration arity and real-JavaScript extern member gaps fail visibly; their exact corrections remain owned by review and are not part of this generator commit.

Two complete generation checks are byte-stable. Generated Haxe and audit outputs contain no timestamps, so an upstream/dependency refresh that produces identical bytes does not require recommitting those files; only a changed pin or other source-of-truth metadata must be committed. This change does alter generated bytes because checker-proven host types and members now replace the former dynamic fallback.
