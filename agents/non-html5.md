# Non-HTML5 Compatibility

Last audited: 2026-08-27

## Compile Status

The complete generated `flight` namespace type-checks and runs its smoke test on Eval and Python without `js` or `html5`. Web-only globals are isolated behind maintained target boundaries or represented as `Dynamic` on other targets. They are unavailable at runtime there, but they are not library compile blockers.

The complete generic portability smoke compiles, links, and runs on C++/hxcpp in this workspace. HostLime's sound integration also completes native Neko and Linux/hxcpp application builds against pinned Lime 8.3.2. This headless workspace provides compile/link coverage rather than interactive audio, window, dialog, clipboard, or input validation.

## WebGL2 Binding

Generated WebGL2 method and constant names remain literal inputs to `flight._internal.backend.WebGl2Backend`. Its target branches dispatch each used binding to:

- the caller-provided `lime.graphics.WebGL2RenderContext` when `lime` is defined on a native target;
- `js.html.webgl.WebGL2RenderingContext` methods and constants when both `js` and `html5` are defined;
- a non-rendering sentinel on headless targets so otherwise-portable packages can still type-check.

The Lime and browser branches contain no reflective method calls. The native branch also adapts browser-shaped booleans, typed arrays, byte offsets, and GLSL source to Lime's concrete API.

## Native Lime Renderer

The maintained `_Float32Array`, `_Int16Array`, `_UInt16Array`, and `_UInt8Array` abstractions keep their JavaScript implementations on JS, own Lime-native typed-array storage on non-JS Lime targets, and retain ordinary Haxe arrays as the generic portable fallback. The generator emits these maintained wrappers directly, and the native GL boundary unwraps them to Lime views before dispatch. Runtime index, fill, iteration, `set`, and `subarray` operations preserve the wrapper while it owns native storage.

`WebGl2Backend` supplies Lime's concrete `ArrayBufferView`, `Float32Array`, boolean, string, byte-offset, and buffer-size argument forms. Desktop Lime exposes OpenGL through its WebGL compatibility context, so the backend also converts final `#version 300 es` shader sources to equivalent `#version 330 core` sources and removes GLSL ES precision syntax. OpenGL ES and browser sources remain unchanged.

The typed-array and shader branches have an Eval regression test against an API-shaped Lime shim. The bitmap and platformer examples compile to Neko against the pinned Lime source. The packaged Lime 8.3.2 release also supplies the native library successfully; this headless workspace cannot complete a live render because SDL has no video device.

The remaining source-kind exception is the six-argument `texImage2D` overload for an HTML image, video, or canvas. Native Lime needs a decoded pixel buffer and explicit dimensions, while the portable examples use the supported nine-argument pixel-buffer form.

## Browser-Only Runtime Areas

These areas compile on non-HTML5 targets but do not currently provide equivalent native behavior:

- `CanvasRenderingContext2D` has the maintained native Cairo path, but DOM-created scratch canvases and image/media sources still need explicit native providers.
- HostLime supplies clipboard text, screen metadata, storage, filesystem, lifecycle, and related core services. WebGPU, geolocation, DOM media/image sources, and the remaining OS-service packages retain sentinels.

They are capability gaps, not present non-HTML5 Haxe type-check failures.

## Remaining Reflection Inventory

There is no `Reflect.*` use in generated source or the WebGL2 binding. The remaining calls are confined to maintained dynamic boundaries:

- `_Runtime` implements TypeScript's genuinely dynamic property, callback, iterator, and object semantics.
- `CanvasRenderingContext2D` still dispatches dynamic canvas methods and properties; this is the next browser API where typed extern macros could improve dead-code elimination.
- `DynamicObject` implements generic structural-object operations.

These compile on non-HTML5 targets. Replacing them should be evaluated by semantic family rather than by adding target-specific cases to generated code.
