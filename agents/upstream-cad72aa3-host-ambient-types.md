# Upstream `cad72aa3` Host Ambient Type Mapping

Status: implemented, regenerated, and verified with review's maintained Haxe declarations combined at the integration gate.

## Identity rule

Host types are now classified by TypeScript checker identity and declaration origin. A resolved type declared by a non-ECMAScript TypeScript host library, a global ambient declaration file, or a global augmentation maps mechanically to:

```text
flight._internal.dom.<SameTypeName>
```

There is no type-name allowlist and no HTML, GPU, WebGL, event, or canvas prefix heuristic. External modules do not become host types merely because they contain declarations, and a symbol merged with an ECMAScript library declaration stays on the portable ECMAScript path. This keeps names such as a source-defined `HTMLFlightLocal` and the standard `Date` type out of the host mapping while admitting new ambient host types without a generator edit.

The same identity rule applies to explicit type references, inferred member receivers, and heritage clauses. The mapping preserves type arguments and records every arity used by the current upstream tree. Nullable or same-identity unions retain the mapped type. A heterogeneous union such as `HTMLImageElement | HTMLVideoElement` has no single host identity and remains `Dynamic`; the generator does not select one member arbitrarily.

## Member emission and failure behavior

Reads, writes, and calls on an unbound checker-proven host receiver use one target-independent typed expression. An explicitly mapped parameter emits `image.width`, while a host value recovered through a structural `Dynamic` path emits `(cast value : flight._internal.dom.HTMLImageElement).width`. The cast makes the maintained declaration resolve both the identity and its member instead of silently accepting another dynamic lookup. Optional access evaluates the receiver once and preserves the existing nullish result. Spread calls use `Reflect.callMethod` only for argument-spread semantics; the method value itself is still read as a direct typed field.

On non-JavaScript targets, many maintained host declarations are still `Dynamic` compatibility stubs rather than concrete toolkit implementations. That is deliberately not repaired in generated expressions: tolerant absent-field behavior, call arity adjustment, or a native replacement value belongs in the declaration, value LUT, or named adapter. The transpiler does not route checker-known members through `_Runtime` merely to make an incomplete toolkit compile or execute.

Existing target-semantic host endpoints retain priority over ordinary direct emission. Canvas2D, canvas-element, DOM-root, WebGL, and selected WebGPU operations still cross their maintained typed backend because that seam owns native portability or observable host semantics.

No maintained declaration is synthesized by the generator. If the mapped `flight._internal.dom.<SameTypeName>` declaration is absent, generation fails with the missing `host:<SameTypeName>` key. Review owns the maintained declarations and adapters: real browser externs, remaining portable `Dynamic` compatibility branches, concrete native types, value LUT entries, and target backends.

Unresolved source type names no longer collapse silently to `Dynamic`. A compile fixture proves that an unresolved `MissingHostType` remains visible in generated Haxe and produces `Type not found : MissingHostType`.

## Deterministic census

Generation writes [`reports/host-types.json`](../reports/host-types.json) and [`reports/host-types.md`](../reports/host-types.md). The report is derived from actual lowered type/member uses and is descriptive rather than an eligibility table. It records declaration sources, type-reference locations and arities, member names, operations, and locations in stable order.

Generation also writes [`reports/host-toolkit.json`](../reports/host-toolkit.json) and [`reports/host-toolkit.md`](../reports/host-toolkit.md) from the final generated Haxe tree. That manifest joins every emitted host/external type and ambient/module value key to its maintained provider, fails closed on missing entries, and reports `Dynamic` compatibility declarations without crediting them as typed transpiler coverage.

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
- target-independent host member emission with no native `_Runtime` compensation branch;
- fail-closed generation for an emitted value key missing from the toolkit;
- deterministic final-tree toolkit dependency output, including explicit `Dynamic` compatibility debt;
- deterministic report output under reversed input order; and
- loud Haxe failure for an unresolved type instead of silent `Dynamic` lowering.

## Verification

Current hashes and verification results are recorded in [`status.md`](status.md). The boundary-specific checks cover target-independent typed emission, deterministic manifest equality, missing-key failure, and the absence of ambient/module value lookup methods from `_Runtime`.

Two complete generation checks are byte-stable. Generated Haxe and audit outputs contain no timestamps, so an upstream/dependency refresh that produces identical bytes does not require recommitting those files; only a changed pin or other source-of-truth metadata must be committed. This change does alter generated bytes because checker-proven host types and members now replace the former dynamic fallback.
