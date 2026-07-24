# Non-HTML5 Compatibility

Last audited: 2026-07-24

## Compile Status

The complete generated `flighthq` namespace type-checks and runs its smoke test on Eval and Python without `js` or `html5`. Web-only globals are isolated behind maintained target boundaries or represented as `Dynamic` on other targets. They are unavailable at runtime there, but they are not library compile blockers.

C++/hxcpp remains unverified in the current workspace because neither `g++` nor `clang++` is installed. The committed portability command still covers it on a properly provisioned host.

## WebGL2 Binding

Generated WebGL2 method and constant names remain literal inputs to `flighthq._internal.WebGl2RenderingContext`. Compile-time macros expand each used binding to:

- the caller-provided `lime.graphics.WebGL2RenderContext` when `lime` is defined on a native target;
- `js.html.webgl.WebGL2RenderingContext` methods and constants when both `js` and `html5` are defined;
- a non-rendering sentinel on headless targets so otherwise-portable packages can still type-check.

This expansion contains no `Reflect.field` or `Reflect.callMethod`. Because it emits only the literal operation used at each call site, it also does not retain a runtime switch containing every WebGL API during dead-code elimination.

## Remaining Native Lime Renderer Blockers

The typed Lime context route is wired, but desktop OpenGL/OpenGL ES rendering is not complete. Flight currently supplies WebGL-shaped arguments, while Lime's native context API uses explicit byte counts and `DataPointer` values. A native adapter is still required for:

- buffer uploads and partial uploads (`bufferData`, `bufferSubData`);
- typed-array upload/readback operations, including `clearBufferfv`, `readPixels`, `texImage2D`, `texImage3D`, `texSubImage2D`, compressed texture uploads, vector uniforms, and matrix uniforms;
- six-argument `texImage2D` calls whose source is an HTML image, video, or canvas, because native Lime needs a decoded pixel buffer and explicit dimensions.

The maintained `_Float32Array`, `_Int16Array`, and `_UInt16Array` abstractions currently use ordinary Haxe arrays outside JavaScript. Those arrays are sufficient for portable computation but are not native Lime `DataPointer` storage. Passing the current WebGL argument forms through an untyped native context call may get past Haxe typing, but it is not a supported native renderer and may fail during hxcpp compilation or at the graphics boundary.

The next native-rendering step is therefore target-specific buffer ownership and method adapters in maintained `_internal` code, not changes to generated source.

## Browser-Only Runtime Areas

These areas compile on non-HTML5 targets but do not currently provide equivalent native behavior:

- `CanvasRenderingContext2D` remains a dynamic/reflective host boundary and has no Lime canvas implementation.
- WebGPU, DOM media/image sources, clipboard, geolocation, screen, storage, and similar browser integrations degrade to dynamic values or maintained sentinels.

They are capability gaps, not present non-HTML5 Haxe type-check failures.

## Remaining Reflection Inventory

There is no `Reflect.*` use in generated source or the WebGL2 binding. The remaining calls are confined to four maintained boundaries:

- `_Runtime` implements TypeScript's genuinely dynamic property, callback, iterator, and object semantics.
- `CanvasRenderingContext2D` still dispatches dynamic canvas methods and properties; this is the next browser API where typed extern macros could improve dead-code elimination.
- `DynamicObject` implements generic structural-object operations.
- `hostLime.LimeApp` reads application metadata whose concrete Lime config shape is not exposed through this adapter's public contract.

All four compile on non-HTML5 targets. Replacing them should be evaluated by semantic family rather than by adding target-specific cases to generated code.
