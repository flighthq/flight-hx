# Horse Stacker Linux hxcpp Reference

## Role

[jgranick/haxejam2026](https://github.com/jgranick/haxejam2026) is the representative 3D acceptance workload for Flight's Linux C++ work. It complements the small Flight examples rather than replacing them:

- Horse Stacker answers whether a real 3D scene improved end to end on actual GL hardware.
- `npm run bench:scene3d:cpp` answers whether hxcpp record layout improved scene preparation without GL noise.
- camera2d, particles, and the cached-shape control retain their existing regression and phase gates.

The inspected revision is `16e8e39`. It uses typed projection and transform reads, builds against the candidate Flight package, and allocates its scene through Flight's constructor-shaped factories.

## Frame shape

Each frame can include:

1. directional shadow-map rendering;
2. main 3D scene preparation and rendering;
3. a four-sample `rgba16f` effect target with depth/stencil;
4. backdrop blur and vignette in title/result states;
5. UI offscreen rendering and composition.

At blur sigma 13, Flight's separable Gaussian implementation uses radius `ceil(3 * sigma) = 39`, or 79 samples per output pixel per axis pass. That makes the title screen a deliberately demanding full-screen bandwidth and shader workload, especially on llvmpipe and a multisampled half-float target.

## Software-GL attribution probe

The candidate package was built into Horse Stacker and run in release mode under Xvfb with llvmpipe, dummy SDL audio, and CPU affinity fixed to one vCPU. A benchmark-only patch warmed one frame and measured ten. Two independent controls disabled backdrop effects and changed the effect target from 4x `rgba16f` to 1x `rgba8`.

| Variant                        | Wall time |   FPS | Main scene | Effects | UI render |
| ------------------------------ | --------: | ----: | ---------: | ------: | --------: |
| Default                        |   7212 ms |  1.39 |     270 ms |  482 ms |     44 ms |
| No backdrop                    |   1968 ms |  5.08 |     182 ms |    4 ms |     26 ms |
| Simple target                  |   4222 ms |  2.37 |      11 ms |  424 ms |     28 ms |
| No backdrop plus simple target |    700 ms | 14.29 |      11 ms |   32 ms |     27 ms |

These figures are attribution evidence only. Xvfb/llvmpipe is not a production GPU, ten frames do not establish tails, and no browser was available for a paired HTML result. They do establish that this observed native slowdown cannot be assigned mainly to typedef field access: the render-target and full-screen effect choices dominate this environment.

## Required real-hardware matrix

Measure both HTML and Linux C++ on the same host, GPU, power mode, viewport, content revision, initial game state, warmup, and sample window. Capture p50/p95/p99 total and phase times for:

| Backdrop | Effect target | Purpose                                    |
| -------- | ------------- | ------------------------------------------ |
| On       | 4x `rgba16f`  | Current end-to-end behavior                |
| Off      | 4x `rgba16f`  | Target/main-scene cost without blur        |
| On       | 1x `rgba8`    | Blur/effect cost on a simpler target       |
| Off      | 1x `rgba8`    | Lower-bound render path and CPU visibility |

Also capture draw calls, render-target allocations, framebuffer and program binds, uploaded bytes, effect-pass count/radius, mesh count, transform invalidations, and allocated bytes or GC events. Do not silently change Horse Stacker's production quality settings to improve a benchmark; the controls are diagnostic variants.

## Layout decision

Flight's `create<Type>` functions remain its public constructors. On hxcpp, a proven factory may allocate a private fixed-layout class internally while preserving that API. Admission requires all of the following:

1. one factory owns creation of the identity;
2. trait initializers mutate that same identity rather than replace or cast it;
3. every external construction, spread, reflective, and dynamic-ingress path is closed or normalized;
4. JavaScript and non-cpp generated output are unchanged;
5. the headless scene-preparation A/B has identical checksums and a stable paired win;
6. Horse Stacker pixels and real-GL phase metrics do not regress.

The first 3D candidate is the flattened identity created by `createNode3D`/`createMesh` and enriched by node, appearance, transform, and mesh initializers. A global conversion of anonymous records or a cast to a class is explicitly out of scope.

The initial five-pair headless control produced identical checksums, 17.389-second normal and 17.669-second typedef medians, and a 2.47% median paired normal-build gain. This is below the 3% stability threshold and is correctly neutral: neither currently enabled cpp-only class is part of the measured Node3D/mesh identity.
