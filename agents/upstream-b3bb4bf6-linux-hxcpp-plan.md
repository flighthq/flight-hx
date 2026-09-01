# Flight b3bb4bf6 Refresh and Linux hxcpp Plan

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
5. Every native-layout tranche preserves JS output, portable Haxe behavior, render pixels, and nominal provenance closure.

The current aggregate harness cannot calculate p95. Adding per-frame samples is therefore the first implementation task, not an optional refinement.

## Implementation plan

### P0: make the performance gates reproducible

- Extend the three harnesses with warmup, fixed timestep, and per-frame timing consistently. Emit p50/p95/p99 for script preparation, backend rendering, and total frame time.
- Add counters around draw calls, texture/program/framebuffer binds, uniform uploads, fallback shape rasterizations, mesh rebuilds, proxy recomputations, and cache hits. Count allocated bytes or GC allocation events rather than relying only on net heap movement.
- Check in one runner that performs five interleaved parent/candidate pairs under one X server and fixed CPU affinity. A control-versus-control run must stay within 3% before a candidate result is accepted.

This phase is complete when it reproduces the broad current split: nearly zero rendered overhead for the cached-shape control, a large CPU and GL split for camera2d, and a much smaller GL split for particles.

### P1: take the safest high-value native layout

Add `@flighthq/types:interface#BitmapRegion` to the cpp-only `@:structInit` allowlist as a standalone tranche. It is the strongest current closed candidate: 674 direct sites, five required fields, one plain production literal, no normalization/observability findings, and closed nominal provenance. Its 83 input bridge signatures require bridge smoke coverage but are not a closure blocker.

Acceptance requires fixed-offset member access in emitted C++, unchanged non-cpp Haxe/JS output, clean portable tests and pixels, and a statistically credible improvement in the particle script span. Keep the class only if its paired median improves by at least 5% or instrumentation proves a smaller result removes at least 10% of executed dynamic field operations in the workload.

### P2: close the two hot CPU identity gaps

1. Normalize the two `HasTransform2D` and two `HasTransform2DRuntime` cross-schema transfers in `displayObject.ts` and `guiTestHelper.ts`. Preserve the canonical identity through the `Node`/`Node2DTraits` and `NodeRuntime` intersections instead of casting an anonymous composite. Re-run provenance, then trial the required-field transform record before the optional runtime record. The camera projection is 151 accesses per frame; require at least a 10% script-span gain and the 8.0 ms script target before expanding the class set.
2. Preserve or normalize `ParticleEmitterData` identity in the `ParticleEmitter2D` and `ParticleEmitter3D` outer `data` slots. It has 461 direct sites and previously reduced the measured heap window, but it remains correctly blocked by normalization provenance. Enable it only after the report proves closure and the outer ingress test passes. Require a 10% particle script improvement or a 20% allocation reduction.

Do not bulk-enable the remaining 841 closed candidates. `BitmapRegion`, transform state, and particle data each get their own generated delta, C++ inspection, correctness gate, and paired benchmark.

### P3: remove camera invalidation/render cost

Use the P0 counters to choose among these changes in order:

1. Ensure transform-only invalidation reuses shape raster textures and mesh/VBO content. Rebuild only the proxy matrix and bounds; a stable `localContentId` must prevent fallback rasterization.
2. Cache the prepared GL command stream for unchanged descendants of a moved container, patching only per-container/per-instance transforms. Preserve painter order and blend/clip boundaries.
3. Coalesce adjacent compatible shape draws and diff GL state so repeated program, texture, uniform, and framebuffer operations are skipped. Batch only where diagnostics prove identical ordering and blending semantics.

Land the smallest change that halves the paired camera render cost from 8.54 ms to at most 4.0 ms. The cached-shape control must remain flat, proving the improvement belongs to mutation handling rather than a changed benchmark.

### P4: specialize only measured residual helpers

After P1-P3, map sampled native stacks back to the typed-struct and erasure reports. Specialize a remaining `_Runtime.field`, `callProperty`, or optional-presence path only when it is hot and the checker can prove the same receiver identity on every branch. `GlRenderStateRuntime` illustrates why global counts are insufficient: it has 430 direct sites, but 45 fields (15 optional) and three cross-schema transfers. Prefer small required nominal subrecords over turning the whole state into a class. Each rule must reduce executed counters and win a paired benchmark; a lower source-token count alone is not acceptance.

## Recommended order

P0 instrumentation, P1 `BitmapRegion`, P2 transform closure, P3 measured GL invalidation/caching, then P2 particle-data closure and P4 residual specialization. This order can reach the camera budget without depending on speculative whole-program lowering, while retaining particles as an allocation guard and the cached-shape example as a regression control.
