# Typed WebGL2 Endpoint Contract

Goal: strictly typed GL translation so Lime's typed `WebGL2RenderContext` abstract and typed arrays engage on native targets (`lime test neko`). The runtime name-string switch in `WebGl2Backend.call/field` is replaced by one typed static endpoint per GL method or context field and one `static inline final` Int per GL constant. No `Array<Dynamic>` argument packing or string dispatch remains in generated GL access.

## Emit shape (generator side)

For expressions bound to `WebGl2Backend`:

- Method call: `WebGl2Backend.call(gl, 'name', cast [a, b] : Array<Dynamic>)` becomes `flight._internal.backend.WebGl2Backend.name(gl, a, b)`.
- Constant read: `gl.NAME` becomes `WebGl2Backend.contextConstant(gl, 'NAME', WebGl2Backend.NAME)`. JavaScript preserves a wrapper's live enum surface; native targets use the fixed specification value.
- Context field read: `gl.drawingBufferWidth` and `gl.drawingBufferHeight` become typed `WebGl2Backend.drawingBuffer*(gl)` calls. These are live values, not constants.
- The emitter stays type-blind: it never coerces arguments. Endpoints accept JS-semantics types (`Float` for TS numbers, `Bool`, typed handles, list abstracts) and own every `Std.int`/unwrap conversion internally.

Name mapping rules (the only exceptions to identity):

- `texImage2D` with 6 arguments (target, level, internalformat, format, type, source — the DOM-source overload) emits `texImage2DSource`. The 9-argument pixel form keeps the name `texImage2D`.
- `bufferData(target, sizeOrData, usage)`: when the TypeScript checker types the second argument as `number`, emit `bufferDataSize`; otherwise `bufferData`. If overload discrimination is impractical in the lowering, say so and the backend will keep a single runtime-tested endpoint instead.
- `bufferSubData` stays one endpoint for both the 3- and 5-argument forms (trailing `srcOffset`/`length` are optional parameters).
- WebGL2 source-range overloads retain their optional `srcOffset`/`srcLength` parameters. Lime-native `compressedTexSubImage3D` has no ranged entry point and rejects a non-empty range rather than uploading the wrong byte window.

Validation: the generator validates every routed GL method and constant name against the endpoint inventory at generation time and fails loudly on an unmapped name. A regen that introduces a new GL member must fail generation, not defer to a runtime throw.

Confirmed unused in current generated output (do not need endpoint forms): optional-chained GL calls, spread arguments, computed constant names, `setField`/`deleteField` on the GL context.

## Backend surface (src/ side)

`src/flight/_internal/backend/WebGl2Backend.hx` module provides:

- `GlContext` typedef: `lime.graphics.WebGL2RenderContext` under `#if lime`, `js.html.webgl.WebGL2RenderingContext` under `#elseif js`, `Dynamic` otherwise (eval/python portability compile only; GL never executes there).
- Handle typedefs on the same conditional plan: `GlBuffer`, `GlFramebuffer`, `GlProgram`, `GlRenderbuffer`, `GlShader`, `GlTexture`, `GlVertexArray`, `GlUniformLocation`, `GlActiveInfo`.
- List abstracts for buffer-shaped parameters (no raw `Dynamic` in signatures): implicit `@:from` the maintained `_Float32Array`/`_Int16Array`/`_UInt16Array`/ `_UInt8Array` wrappers and `Array<Float>`, unwrapped per target inside the endpoint body.
- ~93 typed `static inline` endpoints. Numeric parameters are `Float` (generated numeric expressions are Float-typed); bodies coerce with `Std.int` where the GL signature is integral. Boolean parameters are `Bool`.
- ~95 `public static inline final` Int constants with spec values.
- Genuinely polymorphic returns stay `Dynamic` (`getParameter`, `getExtension`, `getProgramParameter`, `getShaderParameter`); everything else is typed.
- Non-JavaScript GL contexts do not expose WebGL's drawing-buffer fields. `createGlContextFromCanvasElement` associates the context with its caller-owned surface; the two dimension endpoints read that surface's live `width`/`height`. A host injecting a context directly must call `WebGl2Backend.bindDrawingBufferSurface` first.

The transitional `call`/`field` string switch has been deleted: regenerated output references only the typed endpoints and constants.

## Upstream seam still worth tightening

At pin `2cf1c5cef`, `GlRenderSurfaceProvider.createRenderSurface` is typed to return `HTMLCanvasElement | null`, while `GlContext` requires WebGL-only `drawingBufferWidth`/`drawingBufferHeight`. A native host can supply an object-shaped surface and context, but a caller-owned raw GL context has no upstream contract for its backing-store dimensions. Flight should eventually make that relationship explicit—either return a surface/context bundle or let the context/render-state options provide live drawing-buffer dimensions. The Haxe association above is exact for the canvas-acquisition path and fails loudly for an unbound injected context; it does not infer a process-global window or substitute the mutable GL viewport.
