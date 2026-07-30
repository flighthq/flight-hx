# Typed Struct Tranche 5: Camera2D Frame Projection

This projection models one warm, input-free `camera2d` example update followed by one render. It counts generated Flight property accesses that are currently reflective and would become direct when the tranche-5 schemas are enabled. Handwritten accesses in `examples/camera2d/Main.hx` are already direct Haxe and are not counted.

## Camera operations

The example calls `updateCamera2DFollow` once with `worldBounds`, `getCamera2DViewMatrix` once, `getCamera2DVisibleBounds` once, and `getCamera2DParallaxPoint` three times per update. `getCamera2DVisibleBounds` calls `getCamera2DViewMatrix`; the follow operation calls visible bounds when `worldBounds` is present. The resulting camera access projection is:

| Operation | Calls per update | Candidate accesses per call | Accesses per update |
| --- | --: | --: | --: |
| `updateCamera2DFollow` camera reads/writes | 1 | 4 | 4 |
| `getCamera2DViewMatrix` | 6 | 6 | 36 |
| `getCamera2DVisibleBounds` outside its view-matrix call | 2 | 2 | 4 |
| `getCamera2DParallaxPoint` outside its view-matrix call | 3 | 2 | 6 |
| `Camera2DFollowOptions` reads | 1 | 4 | 4 |
| **Camera subtotal** |  |  | **54** |

The 50 `Camera2D` accesses are 48 reads and two writes at runtime: the 17 audit sites are executed repeatedly through the composed camera functions. `Camera2DOptions` is construction-only and contributes no steady-frame access.

## Render-transform operations

The warm example graph contains 78 nodes. Each update invalidates the transforms of the stars, mountains, clouds, and world containers. The preparation walk updates 73 render proxies: the four changed containers, their 67 descendants, and two appearance-only HUD labels. The labels do not recalculate their transforms, so 71 proxy transforms are recomputed and five nodes remain completely clean.

Every one of those 71 transform recomputations reads the cached `localMatrix`. Only the four invalidated containers rebuild that matrix. With the example's zero rotation and skew, each rebuild executes 13 `HasTransform2D` field accesses and seven `HasTransform2DRuntime` cache accesses.

| Transform work                        | Calls per frame | Candidate accesses per call | Accesses per frame |
| ------------------------------------- | --------------: | --------------------------: | -----------------: |
| Read cached `localMatrix`             |              71 |                           1 |                 71 |
| Rebuild authored `HasTransform2D`     |               4 |                          13 |                 52 |
| Rebuild `HasTransform2DRuntime` cache |               4 |                           7 |                 28 |
| **Transform subtotal**                |                 |                             |            **151** |

The common warm path therefore projects **205 reflective accesses removed per frame**: 54 camera and follow accesses plus 151 node-transform accesses. Bounds-cache, 3D camera/geometry, initialization, and backend-specific fallback-raster bounds work are intentionally outside this portable steady-frame number.

## Audit and enablement gates

The tranche-5 audit adds 20 audit-only schemas with 92 fields and 987 bindable static access sites. It also records 152 per-schema dynamic-escape records:

- 138 records for other members of node/runtime intersections;
- 14 records from seven projection-union discriminant sites, attributed to both projection schemas.

Before direct enablement, intersection lowering must bind only the candidate that owns the accessed member and leave other intersection members on their existing dynamic path. Projection `kind` accesses remain explicit incompatible-union escapes. The audit-only commit must produce no generated Haxe expression changes.

For the fixed-frame comparison, `FLIGHT_PERF_FRAMES=601` reports 600 elapsed frame intervals through the example's existing `PERF frames=600 ... fps=...` line. Baseline and candidate runs use the same renderer, antialiasing mode, build target, and host display.
