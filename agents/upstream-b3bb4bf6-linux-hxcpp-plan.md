# Flight b3bb4bf6 Refresh and Linux hxcpp Plan

> **Current pin:** this filename and the measurements below deliberately retain the `b3bb4bf6`
> benchmark baseline. The repository has since advanced to `98a7a58a934f55555a561a308cc23c1363c45652`,
> which is 47 commits later on the same `develop` lineage. Full generation and the deterministic
> generation check pass at the newer pin; benchmark numbers remain attributed to the older pin until
> they are rerun.

## Decision

Advance the Flight pin from `2e86cd620a53121aa6c9230215f44c6c9a3bf816` to `b3bb4bf61833f7723e7033dd5c732e91a6601400`. The new revision is the locally available `origin/develop` tip and contains 95 commits, including the 0.5.0 release, entity-backed renderer data and GL render targets, node-trait inference fixes, glyph-atlas and text invalidation fixes, and the fullscreen-pass depth fix that makes the local `drawGlFullscreenPass` body patch redundant.

The refresh is correctness-heavy rather than a native-performance step. It adds useful static facts and reduces dynamic ingress, but the generated Haxe and hxcpp artifact contain slightly more dynamic field machinery overall. Linux hxcpp is already fast for a clean, cached scene. It misses a practical 60 fps budget when a camera update invalidates a deep scene, where CPU preparation and rendered work are both material. Work should therefore proceed as measured CPU-layout and GL-invalidation tranches, not as a blanket attempt to remove every `Dynamic` occurrence.

## Compatibility repair

Upstream commit `5d3df0b3b` changed `NodeOf<Traits>` to `Node<Traits> & NoInfer<Traits>`. TypeScript's standard `NoInfer` intrinsic is semantically transparent, but the generator originally lowered it as an empty structural toolkit boundary. The resulting `NodeOf` lost every trait member and the camera build failed in `_Skeleton3D.hx` because `Node3D` members such as `alpha` were absent.

The lowerer now unwraps standard-library `NoInfer` wherever it already treats transparent wrappers, including generic intersection-member discovery. The guard resolves the declaration back to the TypeScript standard library, so a source-defined type named `NoInfer` remains nominal. The regenerated form is again:

```haxe
typedef NodeOf<Traits> = flight._internal._Intersection2<Node<Traits>, Traits>;
```

Both camera2d and particles then compiled successfully for Linux hxcpp.

Upstream commit `bc784801a` also migrated 64 SDK tests from module-level `vi.mock` factories to `vi.spyOn` namespace calls. Source bridges originally synchronized only hoisted module mocks, so the new spies never reached the corresponding compiled Haxe statics. Bridge analysis now maps namespace imports in adjacent tests, records the exact spied exports, and refreshes those bindings immediately before each exported function call. Function-valued constants retain identity through a wrapper that is installed back onto the compiled static field, preserving effect-runner registry equality. Focused application-gl, glTF, drop-shadow, and glitch parity exercises direct package, local/transitive, and callable-constant cases.

The complete parity pass exposed two broader forms of the same problem. A test can spy on a shared module while exercising consumers from several other source files, so bridge analysis now aggregates spy targets across the package and refreshes every importing consumer. Wrappers capture the original compiled implementation before installing themselves, avoiding recursion, and update object-literal function fields when upstream observes function identity. The generator also preserves source-local export aliases, secondary class constructor paths, and structural properties whose JavaScript name is a Haxe keyword.

One runtime semantic gap was independent of test bridging: `render-gl/glDraw.ts` populates its standard blend table in a top-level `for...of`, while lowering previously retained only declarations. Top-level executable statements now lower into a deterministic static initializer ordered after their referenced fields. The regenerated table carries all six modes. A focused post-repair parity run passes all 107 tests across the WGPU logical-resolution suite, GL draw, and the scene2d GL pipeline.

## Parity assessment

The complete report-only upstream run finished successfully across all 159 packages. It classified 143 packages as matching and 16 as nonmatching: four previously reviewed differences, 12 awaiting review, and six packages fixed since their prior review. The high-count SWF failure was one constructor-path defect (78 assertions), while protocol and render-gl isolated reserved-property, local-alias, and module-initialization defects. Those generic generator faults are repaired above rather than recorded as expected drift.

The remaining report entries are not evidence for a native-performance change. They cluster around known-answer random/hash values, `null` versus `undefined`, host provider identity, source-format edge cases, a JSDOM surface assumption, an excluded Playwright tool package, and a Vitest worker teardown after all scene3d-gl assertions pass. They should be reviewed independently; none changes the hxcpp measurements or the implementation priorities below.

## Audit delta

The source inventory grows modestly while preserving all package and export-lane coverage:

| Metric               | 2e86cd62 | b3bb4bf6 | Delta |
| -------------------- | -------: | -------: | ----: |
| Packages             |      159 |      159 |     0 |
| Export lanes         |      331 |      331 |     0 |
| Exports              |   40,706 |   40,772 |   +66 |
| Root exports         |   15,921 |   15,945 |   +24 |
| Source files         |    2,930 |    2,935 |    +5 |
| Test files           |    1,704 |    1,708 |    +4 |
| Lowered declarations |   16,807 |   16,850 |   +43 |
| Lowering diagnostics |        0 |        0 |     0 |

The new source supplies 49 more statically emitted Boolean-truthiness uses, three more indexed reads, and seven more numeric relations. These are coverage gains from the added source, not a new lowering optimization. Typed-struct movement is mixed:

| Metric                             | 2e86cd62 | b3bb4bf6 | Delta |
| ---------------------------------- | -------: | -------: | ----: |
| Eligible typed structs             |    2,159 |    2,161 |    +2 |
| Direct schemas                     |      758 |      757 |    -1 |
| Direct accesses                    |   25,827 |   25,837 |   +10 |
| Pending accesses                   |   14,138 |   14,155 |   +17 |
| Reflective survivors               |      452 |      459 |    +7 |
| Dynamic ingresses                  |       69 |       61 |    -8 |
| Cross-schema transfers             |    1,912 |    1,927 |   +15 |
| Provenance-closed class candidates |      843 |      841 |    -2 |
| Type erasures                      |   29,168 |   29,392 |  +224 |

The most favorable movement is the eight-site dynamic-ingress reduction, led by `RendererData` (-5). It is offset by more cross-schema transfer and erasure. `Light` leaves the reviewed direct set (-11 direct, +11 pending); `WgpuRenderStateRuntime` removes 17 pending sites and `WgpuDeviceRuntime` removes 35, while `GlContext` adds 19. Generated-source lexical counts tell the same story:

| Generated Haxe token/helper | 2e86cd62 | b3bb4bf6 | Delta |
| --------------------------- | -------: | -------: | ----: |
| `Dynamic`                   |   62,075 |   62,233 |  +158 |
| `_Runtime.field`            |   13,445 |   13,472 |   +27 |
| `_Runtime.setField`         |      147 |      147 |     0 |
| `_Runtime.getIndex`         |      806 |      805 |    -1 |
| `_Runtime.setIndex`         |      176 |      177 |    +1 |
| `_Runtime.callProperty`     |    3,505 |    3,506 |    +1 |

The indexed-access work remains effective: 14,046 indexed reads/writes are emitted statically while only 982 runtime get/set helpers remain. The refresh does not justify a performance claim by itself.

## Native baseline

### Method

All measurements use the regenerated b3bb4bf6 tree, Haxe 4.3.7, hxcpp 4.3.0, release `-O2`, `-Dbench -Dnoaa`, Xvfb at 1024x768, Mesa software GL, `SDL_AUDIODRIVER=dummy`, and CPU affinity fixed to vCPU 3 on the 16-vCPU AMD-family-25 KVM host. Each result is the median of five interleaved script-only/rendered pairs in one X server. The control measures 6,000 frame intervals. Camera2d measures 600. Particles warms 120 frames, measures 600, and fixes simulation time to 1/60 second.

The host exhibited large frequency/scheduling drift across sequential blocks even with CPU affinity. Absolute numbers are useful for budgets, but implementation comparisons must be interleaved A/B pairs on the same host. Net `Gc.memInfo64` movement is a heap-usage proxy, not an allocation count.

| Workload                         |   Script-only median |      Rendered median | Median paired render cost |
| -------------------------------- | -------------------: | -------------------: | ------------------------: |
| 1,000 cached shapes              | 913.5 fps / 1.095 ms | 910.6 fps / 1.098 ms |                  0.003 ms |
| Camera2d, 78-node mutating scene | 92.4 fps / 10.823 ms | 52.1 fps / 19.195 ms |                  8.543 ms |
| Two particle emitters            | 344.6 fps / 2.902 ms | 288.0 fps / 3.472 ms |                  0.627 ms |

The cached-shape control shows that neither the Lime loop nor a clean GL scene is the broad problem. Camera2d exceeds the 16.67 ms 60-fps budget by 2.53 ms at the median, before reserving any tail-latency headroom. Its four transform invalidations force 71 proxy transform recomputations; the established projection attributes 151 anonymous-record accesses per frame to transform state, in addition to the already nominal `Camera2D` accesses. The rendered half then adds another 8.54 ms. Particles is practical at this scale, but remains a high-value allocation/layout stress test.

The compiled Flight portion of the camera artifact contains 12,802 lexical `__Field` calls, 2,215 `__SetField` calls, and 51,824 `::Dynamic` tokens. These are opportunity bounds rather than executed counts because the example build includes the full generated namespace. Camera-relevant sources still carry large bounds: `_Scene2DGl.cpp` has 896 `__Field` calls, `_RenderGl.cpp` 677, `_Shape.cpp` 430, and `_Render.cpp` 346. Runtime instrumentation must decide which of them matter before another general lowering rule is added.

## Practical target

Treat Linux hxcpp as practical for this tranche when all of the following hold on a pinned CI runner:

1. Camera2d rendered p95 is at most 16.67 ms and median is at most 13.3 ms, leaving 20% median headroom.
2. Camera2d script-only median is at most 8.0 ms; rendered incremental median is at most 4.0 ms.
3. The 1,000-shape control does not regress by more than 3%.
4. Particles rendered p95 remains below 8.33 ms (120 fps), with no increase in allocations per frame.
5. The typedef-oracle lane preserves JavaScript output and the verbatim upstream assertions; the class lane preserves portable Haxe behavior, render pixels, and nominal provenance closure.
6. Horse Stacker records paired HTML/Linux p50 and p95 on real GL for the default, no-backdrop, 1x `rgba8`, and combined variants; its CPU-only scene-preparation control must pass checksum equality and the 3% control stability gate.

The current aggregate harness cannot calculate p95. Adding per-frame samples is therefore the first implementation task, not an optional refinement. The same generated tree must support a default class build and a program-wide `-D flight_struct_typedef` build. Interleaved C++ runs isolate representation from generator and upstream drift; the typedef JavaScript build is also the verbatim upstream oracle lane.

## Constructor-layout A/B result

The shared-tree switch confirms that the representation hypothesis is real but narrowly distributed. Five interleaved 1,800-frame camera2d script-only pairs produced a median paired class gain of only 0.09% (0.85% by aggregate mean), with pair results from -1.46% to +6.17%. That is host noise, not an accepted scene improvement.

A CPU-only probe then repeated the example's composed camera operations 5,000,000 times: view matrix, visible bounds, parallax, and camera mutation. Across five interleaved pairs on the same pinned CPU, the class median was 2.485 seconds versus 3.477 seconds for the typedef, 28.5% less time, with identical checksums. The fixed-offset `Camera2D` layout is therefore materially faster inside its own hot span, but that span is too small to move the whole scene reliably.

The next camera-layout tranche should apply factory provenance to the larger allocation boundary: `createNode`/`createNode2D` create each node once, and the transform initializers then populate the `HasTransform2D` view on that same identity. The generator currently audits those views as cross-schema transfers rather than recognizing one factory-created native object. Normalize that identity before class emission; do not cast the existing anonymous node to a class. `BitmapRegion` remains the safest independent closed candidate, but it is no longer ahead of constructor-proven node/transform identity for the camera target.

## Target representation model

Flight's branded Entity contract determines one uniform representation rule; it is not a per-schema performance allowlist:

1. Every concrete Entity identity produced through Flight's factory vocabulary is a behavior-free nominal class by default on every Haxe target. The public address remains `flight.types.<Type>`, fields remain public and mutable, and free functions remain the behavioral API.
2. Construction is sealed. The generated constructor is private and `@:allow` grants only the implementation module or modules containing the authoritative factory sites. `create<Type>` remains the sole public allocator and still delegates through `createEntity`, preserving the runtime symbol stamp, pooling, sentinels, and grepable allocation vocabulary.
3. One program-wide `flight_struct_typedef` define selects structural typedefs. The full upstream Vitest oracle compiles with that define and reuses every assertion verbatim. The same define is the C++ representation bisect; default builds use classes.
4. `Has*` types remain composition contracts, not competing concrete identities. Host-capability traits are interface candidates. Node/render traits may use interfaces for composition only when per-frame reads narrow to the concrete node class, avoiding hxcpp virtual interface-field dispatch on the hot path.
5. `*Like` remains for genuine unbranded values, writable out/aliasing operations, and configuration such as `Scale9Shape.scale9Grid`. A matching shape never acquires Entity identity merely because its fields happen to align.

This keeps the API topology and allocation vocabulary identical while changing only representation. JavaScript class instances do have observable prototype identity, so the oracle guarantee belongs to the typedef lane rather than to byte-identical default-class output. The class lane is a separate behavioral, portability, pixel, provenance, and performance check; it does not weaken or replace the full typedef oracle.

The keystone is closing `createEntity` erasure by declared identity rather than by structural shape. Structural resolution is ambiguous for derived and intersection types: for example, `createRenderTexture` simultaneously matches `RenderTexture` and `RenderTarget`. The generator now resolves the declared return symbol first, recognizes only Flight's real `createEntity`, and requires the exact literal field order. That produces a concrete-ready typed construction while the typedef branch remains behaviorally unchanged. Generic `T extends Entity`, bare `Entity`, spread/computed literals, and unresolved factory results remain explicit closure blockers rather than unchecked casts.

Constructor sealing is implemented as a generator invariant. Each enabled `@:structInit` class has a private constructor; the generator derives exact `@:allow` grants from the IR modules that contain its typed construction sites and fails if an enabled class has no constructor owner. The compile test runs construction through the allowed factory module and separately requires ordinary consumer `new` to fail with `Cannot access private constructor`. The deterministic [`entity-factory-closure.json`](../reports/entity-factory-closure.json) audit finds 368 exact production `createEntity` calls. Of those, 191 resolve to 148 named Entity identities and 128 are already constructor-ready. The remaining 231 Entity calls have overlapping blockers: 141 structural compositions, 24 unresolved destinations, 24 field-order mismatches, 23 field-set mismatches, 17 spreads, 13 returned-variable identities whose translated field compatibility is not yet proven, eight non-object constructions, three generic destinations, three omitted objects, two parameterized destinations, and one computed construction.

Seventeen additional `createEntity` calls are declared as non-Entity types: the Electron/Tauri menu application, popup, and selection backends; Tauri platform; the two menu event records; and eight explicitly typed Electron power backends (`PowerBatteryHealthBackend`, `PowerChangeBackend`, `PowerIdleBackend`, `PowerKeepAwakeBackend`, `PowerSessionLockBackend`, `PowerStatusBackend`, `PowerSuspensionBackend`, and `PowerThermalBackend`). These are upstream contract mismatches, not nominal-constructor candidates. Each type must either extend Entity deliberately or stop using the Entity allocator; Haxe must not invent identity absent from the public type. The report resolves explicit type arguments, nested contextual destinations, and returned-variable destinations but only lowers routes whose actual generated field types compile, so a TypeScript assertion is never treated as proof of a class instance.

The external-ingress check found ten direct `JSON.parse` roots in the provenance audit, all interchange-document schemas and none Entity-derived. No direct JSON-to-Entity root is currently known. There are still 37 dynamic-transfer findings across 12 Entity-family schemas, concentrated in generic cloning, material/import flows, node/mesh trait erasure, and renderer composition. Each must be classified as an internal identity-preserving view or normalized at its boundary before the wholesale class switch; compile success alone cannot waive it.

## 3D acceptance workload: Horse Stacker

[Horse Stacker](https://github.com/jgranick/haxejam2026) is the representative end-to-end 3D workload. Revision `16e8e39` builds against this candidate Flight tree and exercises the public factory vocabulary heavily: `createNode3D`, `createMesh`, `createCamera3D`, material, geometry, light, and scene constructors. It also renders a directional shadow map, the main 3D scene, a UI scene, and a full-screen effect pipeline every frame. The default target is four-sample `rgba16f` with depth/stencil; title and result states add a backdrop blur up to sigma 13 plus a vignette.

An external benchmark-only probe measured ten title frames under Xvfb and llvmpipe. These numbers attribute phases on this software renderer; they are not production FPS claims and are not an HTML-versus-native comparison:

| Native probe variant             |   FPS | Main scene | Effects |
| -------------------------------- | ----: | ---------: | ------: |
| Default: backdrop + 4x `rgba16f` |  1.39 |     270 ms |  482 ms |
| No backdrop effects              |  5.08 |     182 ms |    4 ms |
| Backdrop + 1x `rgba8`            |  2.37 |      11 ms |  424 ms |
| No backdrop effects + 1x `rgba8` | 14.29 |      11 ms |   32 ms |

The gross slowdown in this environment is therefore not principally node typedef access. The separable blur alone reaches a 39-pixel radius at sigma 13, while the multisampled half-float target magnifies both the main pass and effect traffic. That renderer finding and the hxcpp layout hypothesis are separate optimization tracks:

1. Run Horse Stacker HTML and Linux C++ on the same real-GPU host, viewport, scene state, and quality settings. Retain the no-backdrop and 1x `rgba8` variants as controls so a target/allocation win is not misreported as a class-layout win.
2. Measure factory-created 3D records without GL. `npm run bench:scene3d:cpp` builds a normal candidate and the same-tree typedef baseline, then interleaves five pairs of a 128-mesh `prepareScene3DRender` workload with camera and node invalidation. This is the acceptance gate for `createNode3D`/`createMesh` identity closure.

The initial headless control has identical checksums and a 2.47% median paired normal-build gain, inside the 3% noise threshold. A `Camera3D` factory/class trial then produced only a 1.63% median paired gain across five pairs (range -0.39% to +5.39%). This is useful attribution: one camera object is not a meaningful share of the scene span. It is not a reason to exclude Camera3D from the uniform Entity representation.

`Matrix4` is the strongest factory-identity proof. Its single `m` field has 133 audited direct sites, and node local/world caches are initialized to null and populated only by `createMatrix4`. The class experiment declared the real non-JS symbol slot (`__symbol__EntityRuntime`); structural `Matrix4Like` literals remained typedef values and did not trigger class construction. Five 500-iteration pairs measured a +15.20% median paired gain, and a shorter repeat measured +9.92%; both had identical checksums and four of five pairs favored the class. The host was volatile (including one reversal in each run), so these are paired-layout results rather than an end-to-end FPS projection. Matrix4 demonstrates that factory identity can recover fixed-offset performance, but it will ship as part of the uniform Entity switch rather than as a permanent one-off allowlist entry.

Flight's public API remains constructor-shaped free functions. An internal class is an implementation of `create<Type>`, not a replacement public `new()` API. The generator must prove that the factory creates the identity and all trait initializers enrich that same identity before it emits a class; a cast from an already-created anonymous object is not sufficient.

## Implementation plan

### P0: make the performance gates reproducible

- Extend the three harnesses with warmup, fixed timestep, and per-frame timing consistently. Emit p50/p95/p99 for script preparation, backend rendering, and total frame time.
- Add counters around draw calls, texture/program/framebuffer binds, uniform uploads, fallback shape rasterizations, mesh rebuilds, proxy recomputations, and cache hits. Count allocated bytes or GC allocation events rather than relying only on net heap movement.
- Check in one runner that performs five interleaved parent/candidate pairs under one X server and fixed CPU affinity. A control-versus-control run must stay within 3% before a candidate result is accepted.
- Keep `npm run bench:scene3d:cpp` headless and GL-free. It must construct its scene exclusively through Flight's public factories, verify candidate/baseline checksums, and report the paired median before any 3D record class is admitted.
- Add equivalent phase JSON to Horse Stacker without making benchmark instrumentation part of the game. On a real-GPU runner, capture the default render, empty-effect, simple-target, and combined controls in both HTML and Linux C++.

This phase is complete when it reproduces the broad current split: nearly zero rendered overhead for the cached-shape control, a large CPU and GL split for camera2d, and a much smaller GL split for particles.

### P1: establish the representation switch and two CI lanes

- Replace the cpp-only baseline with one all-target `flight_struct_typedef` define. Default compilation selects the class representation; the typedef define selects the existing structural declarations program-wide.
- Route the full upstream Vitest command through the typedef build without editing any upstream test or expected value. Keep this as the correctness spine for strict equality, serialization, enumeration, spread, and prototype-sensitive behavior.
- Add a default-class lane that compiles and smoke-runs every portable target, exercises `-dce full`, pixels, runtime Entity guards, and the paired benchmarks. Derive its shape-tolerant upstream subset mechanically and keep it additive to the full oracle.
- Compile-test sealed construction: every generated Entity constructor is private, each authoritative factory module is granted with `@:allow`, factory construction succeeds, and an ordinary consumer's `new` fails.

This phase is complete when one generated tree can run both representations deterministically and the class build is the normal no-define path on JavaScript, Eval, Python, and C++.

### P2: close factory identity wholesale before enabling Entity classes

1. Resolve `createEntity` by the declared destination symbol, not the complete structural match set. Require the exact upstream helper symbol, a named factory result, and an exact constructor field set/order. Emit a concrete-ready typed construction even while `flight_struct_typedef` selects the structural declaration.
2. Generate a factory-closure report for every production `createEntity` call. Classify each as exact concrete identity, generic/bare Entity, structural intersection, spread/computed construction, or unresolved. Generation must fail before class activation if any concrete Entity factory can still return an anonymous object cast as a class.
3. Replace generic producers such as `cloneEntity<T>` and generic subscription helpers with a representation-safe route: call the concrete public clone/create factory where one exists, or retain a typed allocator token that constructs the concrete class. Do not use runtime type guessing or an hxcpp cast.
4. Normalize the remaining internal dynamic/trait views once at their proven identity boundary. Keep direct JSON/interchange schemas structural; if a future host/JSON path produces an Entity, validate and construct it before any class-typed read.
5. Emit all concrete factory-created Entity identities together, with private constructors and exact factory-module grants. This is one uniform rule. The audit may order closure work for review, but it may not become a shipping per-schema allowlist.
6. Evaluate `Has*` interfaces after the concrete Entity set is closed. Host capabilities may use interfaces directly; node/render traits require concrete-class reads on the per-frame path. Preserve `*Like` aliases at unbranded/out/config boundaries.

Acceptance requires zero residual generic `createEntity` erasure for concrete Entity results, a clean class-vs-typedef behavioral differential, full typedef-oracle parity, portable class compilation, native runtime guards, pixels, and the Scene3D/Horse Stacker performance gates.

Activation is gated separately from closure work. Closure and normalization may land in reviewable
tranches while only the two pilots remain enabled, but any tranche that enables additional classes
must earn its own paired native benchmark and native `-dce full` smoke. The default-class behavioral
lane must exercise the newly enabled identities rather than only `Camera2D` and
`ParticleEmitterState`. The final uniform Entity activation remains blocked until provenance is
closed for the complete enabled set; no green subset makes an unproven sibling safe.

### P3: remove camera invalidation/render cost

Use the P0 counters to choose among these changes in order:

1. Ensure transform-only invalidation reuses shape raster textures and mesh/VBO content. Rebuild only the proxy matrix and bounds; a stable `localContentId` must prevent fallback rasterization.
2. Cache the prepared GL command stream for unchanged descendants of a moved container, patching only per-container/per-instance transforms. Preserve painter order and blend/clip boundaries.
3. Coalesce adjacent compatible shape draws and diff GL state so repeated program, texture, uniform, and framebuffer operations are skipped. Batch only where diagnostics prove identical ordering and blending semantics.

Land the smallest change that halves the paired camera render cost from 8.54 ms to at most 4.0 ms. The cached-shape control must remain flat, proving the improvement belongs to mutation handling rather than a changed benchmark.

### P4: specialize only measured residual helpers

After P1-P3, map sampled native stacks back to the typed-struct and erasure reports. Specialize a remaining `_Runtime.field`, `callProperty`, or optional-presence path only when it is hot and the checker can prove the same receiver identity on every branch. `GlRenderStateRuntime` illustrates why global counts are insufficient: it has 430 direct sites, but 45 fields (15 optional) and three cross-schema transfers. Prefer small required nominal subrecords over turning the whole state into a class. Each rule must reduce executed counters and win a paired benchmark; a lower source-token count alone is not acceptance.

## Recommended order

The constructor-layout hypothesis and sealed-constructor mechanism are proven, but the former per-schema shipping plan is superseded. Continue with P1's global define/two-lane infrastructure, P2's identity-first factory report and generic-producer closure, then activate the uniform concrete Entity class set. Run P0 instrumentation alongside that work so the wholesale switch has trustworthy CPU and render acceptance data. Follow with P3 measured GL invalidation/caching/effect work and P4 residual specialization. Horse Stacker remains the real-GL 3D workload; its headless preparation control prevents the dominant target/effect cost from hiding a successful or failed layout change.
