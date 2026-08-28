// Maintained host adapter: GL-backed presentable surface for the Clay host.
// The Clay counterpart of flight.hostLime.GlSurface. Divergence from Lime:
// Lime hands Flight a WebGL *context object* (`window.context.webgl`) whose
// methods Flight's render-gl calls directly. Clay instead exposes GL as the
// *static* class `clay.opengl.GL`, so this adapter synthesizes the object shape
// `createGlRenderState` expects by forwarding each WebGL-style method to the
// corresponding Clay static. See agents/host-strategy.md and this package's
// README for the seam map and the completion plan for the forwarding surface.
package flight.hostClay;

#if clay
import clay.Clay;
import clay.opengl.GL;

/**
 * A Clay-window-backed GL surface with the canvas shape
 * `createGlRenderState` expects. `width`/`height` are plain physical-pixel
 * fields because Flight reads them reflectively today (typed host access makes
 * this a compile-time contract when it lands). `@:keep` so DCE cannot strip
 * reflectively-reached members.
 */
@:keep
class GlSurface {
  /** Allocation entry point, Flight-style. Clay is single-window, so the
   * surface reads the global `Clay.app` rather than taking a window handle
   * the way the Lime adapter does. */
  public static function createClayGlSurface():flight._internal.dom.HTMLCanvasElement {
    return cast new GlSurface();
  }

  public var width:Int = 0;
  public var height:Int = 0;

  final context:ClayGlContext;

  function new() {
    context = new ClayGlContext();
    syncSize();
    // Clay drives resize through its Events pipeline; hostClay's app/loop
    // adapter re-syncs size on the frame tick. Kept explicit here so the
    // surface is correct even before the loop backend is installed.
  }

  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  public function syncSize():Void {
    final app = Clay.app;
    width = app.screenWidth;
    height = app.screenHeight;
  }
}

/**
 * Object-shaped WebGL context over Clay's static `clay.opengl.GL`.
 *
 * Flight's render-gl was written against the browser WebGL object, so it calls
 * `context.createShader(...)`, `context.getUniformLocation(...)`, etc. This
 * class gives those methods an instance home and forwards to the Clay statics.
 *
 * Handle impedance: browser WebGL returns opaque objects (WebGLShader,
 * WebGLProgram, WebGLUniformLocation); Clay/linc_opengl returns typed handles
 * (abstracts over GL ids). Flight treats these opaquely, so returns are widened
 * to `Dynamic` at this boundary and Clay's handle identity is preserved.
 *
 * SKELETON STATUS: the methods below are the core Flight render-gl uses in the
 * scene3d/render-gl paths that were validated by hand. The complete surface is
 * finished mechanically by enumerating render-gl's context call sites (grep the
 * generated `flighthq.renderGl.*` bridges for `.gl`/context member access) and
 * adding one forward per call. Every forward is a direct `GL.<name>` mapping;
 * none require behavior. Marked `@:keep` for the same reflective reasons.
 */
@:keep
/**
 * Object-shaped WebGL context over Clay's static `clay.opengl.GL`, forwarding
 * every method `flight._internal.backend.WebGl2Backend` dispatches on the GL
 * context (`GlContext = Dynamic` on the Clay target, so these calls are checked
 * only at runtime — the adapter must be COMPLETE). The 102-method required
 * surface is enumerated from WebGl2Backend and guarded by
 * tests/generator/hostclay-gl-coverage.test.ts. Methods forward through the
 * `clay.opengl.GL` typedef (linc_opengl `opengl.WebGL` natively). Args are
 * `Dynamic` to match WebGl2Backend's dynamic dispatch and absorb the web/native
 * signature differences. Six GLES3 methods absent from linc_opengl throw a
 * clear unsupported error rather than corrupting GL state silently.
 */
@:keep
private class ClayGlContext {
  public function new() {}
  // --- 90 methods present on both Clay web and native GL: direct forwards ---
  public inline function activeTexture(a0:Dynamic):Void GL.activeTexture(cast a0);
  public inline function attachShader(a0:Dynamic, a1:Dynamic):Void GL.attachShader(cast a0, cast a1);
  public inline function bindBuffer(a0:Dynamic, a1:Dynamic):Void GL.bindBuffer(cast a0, cast a1);
  public inline function bindFramebuffer(a0:Dynamic, a1:Dynamic):Void GL.bindFramebuffer(cast a0, cast a1);
  public inline function bindRenderbuffer(a0:Dynamic, a1:Dynamic):Void GL.bindRenderbuffer(cast a0, cast a1);
  public inline function bindTexture(a0:Dynamic, a1:Dynamic):Void GL.bindTexture(cast a0, cast a1);
  public inline function blendEquation(a0:Dynamic):Void GL.blendEquation(cast a0);
  public inline function blendEquationSeparate(a0:Dynamic, a1:Dynamic):Void GL.blendEquationSeparate(cast a0, cast a1);
  public inline function blendFunc(a0:Dynamic, a1:Dynamic):Void GL.blendFunc(cast a0, cast a1);
  public inline function blendFuncSeparate(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.blendFuncSeparate(cast a0, cast a1, cast a2, cast a3);
  public inline function blitFramebuffer(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic, a5:Dynamic, a6:Dynamic, a7:Dynamic, a8:Dynamic, a9:Dynamic):Void GL.blitFramebuffer(cast a0, cast a1, cast a2, cast a3, cast a4, cast a5, cast a6, cast a7, cast a8, cast a9);
  public inline function bufferData(a0:Dynamic, a1:Dynamic, a2:Dynamic):Void GL.bufferData(cast a0, cast a1, cast a2);
  public inline function bufferSubData(a0:Dynamic, a1:Dynamic, a2:Dynamic):Void GL.bufferSubData(cast a0, cast a1, cast a2);
  public inline function checkFramebufferStatus(a0:Dynamic):Dynamic return cast GL.checkFramebufferStatus(cast a0);
  public inline function clear(a0:Dynamic):Void GL.clear(cast a0);
  public inline function clearBufferfv(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.clearBufferfv(cast a0, cast a1, cast a2, cast a3);
  public inline function clearColor(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.clearColor(cast a0, cast a1, cast a2, cast a3);
  public inline function clearDepth(a0:Dynamic):Void GL.clearDepth(cast a0);
  public inline function colorMask(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.colorMask(cast a0, cast a1, cast a2, cast a3);
  public inline function compileShader(a0:Dynamic):Void GL.compileShader(cast a0);
  public inline function compressedTexImage2D(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic, a5:Dynamic, a6:Dynamic):Void GL.compressedTexImage2D(cast a0, cast a1, cast a2, cast a3, cast a4, cast a5, cast a6);
  public inline function createBuffer():Dynamic return cast GL.createBuffer();
  public inline function createFramebuffer():Dynamic return cast GL.createFramebuffer();
  public inline function createProgram():Dynamic return cast GL.createProgram();
  public inline function createRenderbuffer():Dynamic return cast GL.createRenderbuffer();
  public inline function createShader(a0:Dynamic):Dynamic return cast GL.createShader(cast a0);
  public inline function createTexture():Dynamic return cast GL.createTexture();
  public inline function cullFace(a0:Dynamic):Void GL.cullFace(cast a0);
  public inline function deleteBuffer(a0:Dynamic):Void GL.deleteBuffer(cast a0);
  public inline function deleteFramebuffer(a0:Dynamic):Void GL.deleteFramebuffer(cast a0);
  public inline function deleteProgram(a0:Dynamic):Void GL.deleteProgram(cast a0);
  public inline function deleteRenderbuffer(a0:Dynamic):Void GL.deleteRenderbuffer(cast a0);
  public inline function deleteShader(a0:Dynamic):Void GL.deleteShader(cast a0);
  public inline function deleteTexture(a0:Dynamic):Void GL.deleteTexture(cast a0);
  public inline function depthFunc(a0:Dynamic):Void GL.depthFunc(cast a0);
  public inline function depthMask(a0:Dynamic):Void GL.depthMask(cast a0);
  public inline function disable(a0:Dynamic):Void GL.disable(cast a0);
  public inline function disableVertexAttribArray(a0:Dynamic):Void GL.disableVertexAttribArray(cast a0);
  public inline function drawArrays(a0:Dynamic, a1:Dynamic, a2:Dynamic):Void GL.drawArrays(cast a0, cast a1, cast a2);
  public inline function drawElements(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.drawElements(cast a0, cast a1, cast a2, cast a3);
  public inline function enable(a0:Dynamic):Void GL.enable(cast a0);
  public inline function enableVertexAttribArray(a0:Dynamic):Void GL.enableVertexAttribArray(cast a0);
  public inline function flush():Void GL.flush();
  public inline function framebufferRenderbuffer(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.framebufferRenderbuffer(cast a0, cast a1, cast a2, cast a3);
  public inline function framebufferTexture2D(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic):Void GL.framebufferTexture2D(cast a0, cast a1, cast a2, cast a3, cast a4);
  public inline function frontFace(a0:Dynamic):Void GL.frontFace(cast a0);
  public inline function generateMipmap(a0:Dynamic):Void GL.generateMipmap(cast a0);
  public inline function getActiveUniform(a0:Dynamic, a1:Dynamic):Dynamic return cast GL.getActiveUniform(cast a0, cast a1);
  public inline function getAttribLocation(a0:Dynamic, a1:Dynamic):Dynamic return cast GL.getAttribLocation(cast a0, cast a1);
  public inline function getError():Dynamic return cast GL.getError();
  public inline function getExtension(a0:Dynamic):Dynamic return cast GL.getExtension(cast a0);
  public inline function getParameter(a0:Dynamic):Dynamic return cast GL.getParameter(cast a0);
  public inline function getProgramInfoLog(a0:Dynamic):Dynamic return cast GL.getProgramInfoLog(cast a0);
  public inline function getProgramParameter(a0:Dynamic, a1:Dynamic):Dynamic return cast GL.getProgramParameter(cast a0, cast a1);
  public inline function getShaderInfoLog(a0:Dynamic):Dynamic return cast GL.getShaderInfoLog(cast a0);
  public inline function getShaderParameter(a0:Dynamic, a1:Dynamic):Dynamic return cast GL.getShaderParameter(cast a0, cast a1);
  public inline function getUniformLocation(a0:Dynamic, a1:Dynamic):Dynamic return cast GL.getUniformLocation(cast a0, cast a1);
  public inline function isEnabled(a0:Dynamic):Dynamic return cast GL.isEnabled(cast a0);
  public inline function linkProgram(a0:Dynamic):Void GL.linkProgram(cast a0);
  public inline function pixelStorei(a0:Dynamic, a1:Dynamic):Void GL.pixelStorei(cast a0, cast a1);
  public inline function readPixels(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic, a5:Dynamic, a6:Dynamic):Void GL.readPixels(cast a0, cast a1, cast a2, cast a3, cast a4, cast a5, cast a6);
  public inline function renderbufferStorage(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.renderbufferStorage(cast a0, cast a1, cast a2, cast a3);
  public inline function renderbufferStorageMultisample(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic):Void GL.renderbufferStorageMultisample(cast a0, cast a1, cast a2, cast a3, cast a4);
  public inline function scissor(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.scissor(cast a0, cast a1, cast a2, cast a3);
  public inline function shaderSource(a0:Dynamic, a1:Dynamic):Void GL.shaderSource(cast a0, cast a1);
  public inline function stencilFunc(a0:Dynamic, a1:Dynamic, a2:Dynamic):Void GL.stencilFunc(cast a0, cast a1, cast a2);
  public inline function stencilFuncSeparate(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.stencilFuncSeparate(cast a0, cast a1, cast a2, cast a3);
  public inline function stencilMask(a0:Dynamic):Void GL.stencilMask(cast a0);
  public inline function stencilMaskSeparate(a0:Dynamic, a1:Dynamic):Void GL.stencilMaskSeparate(cast a0, cast a1);
  public inline function stencilOp(a0:Dynamic, a1:Dynamic, a2:Dynamic):Void GL.stencilOp(cast a0, cast a1, cast a2);
  public inline function stencilOpSeparate(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.stencilOpSeparate(cast a0, cast a1, cast a2, cast a3);
  public inline function texImage2D(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic, a5:Dynamic, a6:Dynamic, a7:Dynamic, a8:Dynamic):Void GL.texImage2D(cast a0, cast a1, cast a2, cast a3, cast a4, cast a5, cast a6, cast a7, cast a8);
  public inline function texParameterf(a0:Dynamic, a1:Dynamic, a2:Dynamic):Void GL.texParameterf(cast a0, cast a1, cast a2);
  public inline function texParameteri(a0:Dynamic, a1:Dynamic, a2:Dynamic):Void GL.texParameteri(cast a0, cast a1, cast a2);
  public inline function texSubImage2D(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic, a5:Dynamic, a6:Dynamic, a7:Dynamic, a8:Dynamic):Void GL.texSubImage2D(cast a0, cast a1, cast a2, cast a3, cast a4, cast a5, cast a6, cast a7, cast a8);
  public inline function uniform1f(a0:Dynamic, a1:Dynamic):Void GL.uniform1f(cast a0, cast a1);
  public inline function uniform1fv(a0:Dynamic, a1:Dynamic):Void GL.uniform1fv(cast a0, cast a1);
  public inline function uniform1i(a0:Dynamic, a1:Dynamic):Void GL.uniform1i(cast a0, cast a1);
  public inline function uniform2f(a0:Dynamic, a1:Dynamic, a2:Dynamic):Void GL.uniform2f(cast a0, cast a1, cast a2);
  public inline function uniform2fv(a0:Dynamic, a1:Dynamic):Void GL.uniform2fv(cast a0, cast a1);
  public inline function uniform3f(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.uniform3f(cast a0, cast a1, cast a2, cast a3);
  public inline function uniform3fv(a0:Dynamic, a1:Dynamic):Void GL.uniform3fv(cast a0, cast a1);
  public inline function uniform4f(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic):Void GL.uniform4f(cast a0, cast a1, cast a2, cast a3, cast a4);
  public inline function uniform4fv(a0:Dynamic, a1:Dynamic):Void GL.uniform4fv(cast a0, cast a1);
  public inline function uniformMatrix3fv(a0:Dynamic, a1:Dynamic, a2:Dynamic):Void GL.uniformMatrix3fv(cast a0, cast a1, cast a2);
  public inline function uniformMatrix4fv(a0:Dynamic, a1:Dynamic, a2:Dynamic):Void GL.uniformMatrix4fv(cast a0, cast a1, cast a2);
  public inline function useProgram(a0:Dynamic):Void GL.useProgram(cast a0);
  public inline function vertexAttrib4f(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic):Void GL.vertexAttrib4f(cast a0, cast a1, cast a2, cast a3, cast a4);
  public inline function vertexAttribPointer(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic, a5:Dynamic):Void GL.vertexAttribPointer(cast a0, cast a1, cast a2, cast a3, cast a4, cast a5);
  public inline function viewport(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic):Void GL.viewport(cast a0, cast a1, cast a2, cast a3);
  // --- 6 WebGL2 methods present on native (linc_opengl) only ---
#if clay_web
  public inline function bindVertexArray(a0:Dynamic):Dynamic throw "hostClay: GL.bindVertexArray requires the native (linc_opengl) GL backend; not available on clay_web.";
  public inline function createVertexArray():Dynamic throw "hostClay: GL.createVertexArray requires the native (linc_opengl) GL backend; not available on clay_web.";
  public inline function deleteVertexArray(a0:Dynamic):Dynamic throw "hostClay: GL.deleteVertexArray requires the native (linc_opengl) GL backend; not available on clay_web.";
  public inline function drawBuffers(a0:Dynamic):Dynamic throw "hostClay: GL.drawBuffers requires the native (linc_opengl) GL backend; not available on clay_web.";
  public inline function drawElementsInstanced(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic):Dynamic throw "hostClay: GL.drawElementsInstanced requires the native (linc_opengl) GL backend; not available on clay_web.";
  public inline function vertexAttribDivisor(a0:Dynamic, a1:Dynamic):Dynamic throw "hostClay: GL.vertexAttribDivisor requires the native (linc_opengl) GL backend; not available on clay_web.";
#else
  public inline function bindVertexArray(a0:Dynamic):Void GL.bindVertexArray(cast a0);
  public inline function createVertexArray():Dynamic return cast GL.createVertexArray();
  public inline function deleteVertexArray(a0:Dynamic):Void GL.deleteVertexArray(cast a0);
  public inline function drawBuffers(a0:Dynamic):Void GL.drawBuffers(cast a0);
  public inline function drawElementsInstanced(a0:Dynamic, a1:Dynamic, a2:Dynamic, a3:Dynamic, a4:Dynamic):Void GL.drawElementsInstanced(cast a0, cast a1, cast a2, cast a3, cast a4);
  public inline function vertexAttribDivisor(a0:Dynamic, a1:Dynamic):Void GL.vertexAttribDivisor(cast a0, cast a1);
#end
  // --- 6 GLES3 methods render-gl uses that linc_opengl does not expose (real gaps) ---
  public inline function clearBufferfi(a0:Dynamic,a1:Dynamic,a2:Dynamic,a3:Dynamic,a4:Dynamic,a5:Dynamic,a6:Dynamic,a7:Dynamic,a8:Dynamic):Dynamic throw "hostClay: GL.clearBufferfi (GLES3) is absent from linc_opengl; unsupported on Clay native.";
  public inline function compressedTexSubImage3D(a0:Dynamic,a1:Dynamic,a2:Dynamic,a3:Dynamic,a4:Dynamic,a5:Dynamic,a6:Dynamic,a7:Dynamic,a8:Dynamic):Dynamic throw "hostClay: GL.compressedTexSubImage3D (GLES3) is absent from linc_opengl; unsupported on Clay native.";
  public inline function readBuffer(a0:Dynamic,a1:Dynamic,a2:Dynamic,a3:Dynamic,a4:Dynamic,a5:Dynamic,a6:Dynamic,a7:Dynamic,a8:Dynamic):Dynamic throw "hostClay: GL.readBuffer (GLES3) is absent from linc_opengl; unsupported on Clay native.";
  public inline function texImage3D(a0:Dynamic,a1:Dynamic,a2:Dynamic,a3:Dynamic,a4:Dynamic,a5:Dynamic,a6:Dynamic,a7:Dynamic,a8:Dynamic):Dynamic throw "hostClay: GL.texImage3D (GLES3) is absent from linc_opengl; unsupported on Clay native.";
  public inline function texStorage3D(a0:Dynamic,a1:Dynamic,a2:Dynamic,a3:Dynamic,a4:Dynamic,a5:Dynamic,a6:Dynamic,a7:Dynamic,a8:Dynamic):Dynamic throw "hostClay: GL.texStorage3D (GLES3) is absent from linc_opengl; unsupported on Clay native.";
  public inline function vertexAttribIPointer(a0:Dynamic,a1:Dynamic,a2:Dynamic,a3:Dynamic,a4:Dynamic,a5:Dynamic,a6:Dynamic,a7:Dynamic,a8:Dynamic):Dynamic throw "hostClay: GL.vertexAttribIPointer (GLES3) is absent from linc_opengl; unsupported on Clay native.";
}
#end
