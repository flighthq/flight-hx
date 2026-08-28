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
private class ClayGlContext {
  public function new() {}

  // --- WebGL numeric constants Flight reads off the context object ---
  // linc_opengl exposes these as GL statics; expose the handful render-gl
  // reads through the context. (Full constant set: complete alongside the
  // method surface.)
  public var ARRAY_BUFFER(get, never):Int; inline function get_ARRAY_BUFFER() return GL.ARRAY_BUFFER;
  public var ELEMENT_ARRAY_BUFFER(get, never):Int; inline function get_ELEMENT_ARRAY_BUFFER() return GL.ELEMENT_ARRAY_BUFFER;
  public var TRIANGLES(get, never):Int; inline function get_TRIANGLES() return GL.TRIANGLES;
  public var FLOAT(get, never):Int; inline function get_FLOAT() return GL.FLOAT;
  public var COLOR_BUFFER_BIT(get, never):Int; inline function get_COLOR_BUFFER_BIT() return GL.COLOR_BUFFER_BIT;
  public var DEPTH_BUFFER_BIT(get, never):Int; inline function get_DEPTH_BUFFER_BIT() return GL.DEPTH_BUFFER_BIT;
  public var DEPTH_TEST(get, never):Int; inline function get_DEPTH_TEST() return GL.DEPTH_TEST;
  public var BLEND(get, never):Int; inline function get_BLEND() return GL.BLEND;

  // --- shaders / programs ---
  public inline function createShader(type:Int):Dynamic return GL.createShader(type);
  public inline function shaderSource(shader:Dynamic, source:String):Void GL.shaderSource(shader, source);
  public inline function compileShader(shader:Dynamic):Void GL.compileShader(shader);
  public inline function createProgram():Dynamic return GL.createProgram();
  public inline function attachShader(program:Dynamic, shader:Dynamic):Void GL.attachShader(program, shader);
  public inline function linkProgram(program:Dynamic):Void GL.linkProgram(program);
  public inline function useProgram(program:Dynamic):Void GL.useProgram(program);
  public inline function getAttribLocation(program:Dynamic, name:String):Int return GL.getAttribLocation(program, name);
  public inline function getUniformLocation(program:Dynamic, name:String):Dynamic return GL.getUniformLocation(program, name);

  // --- buffers / attributes ---
  public inline function createBuffer():Dynamic return GL.createBuffer();
  public inline function bindBuffer(target:Int, buffer:Dynamic):Void GL.bindBuffer(target, buffer);
  public inline function enableVertexAttribArray(index:Int):Void GL.enableVertexAttribArray(index);
  public inline function vertexAttribPointer(index:Int, size:Int, type:Int, normalized:Bool, stride:Int, offset:Int):Void
    GL.vertexAttribPointer(index, size, type, normalized, stride, offset);

  // --- draw / state ---
  public inline function viewport(x:Int, y:Int, w:Int, h:Int):Void GL.viewport(x, y, w, h);
  public inline function clearColor(r:Float, g:Float, b:Float, a:Float):Void GL.clearColor(r, g, b, a);
  public inline function clear(mask:Int):Void GL.clear(mask);
  public inline function enable(cap:Int):Void GL.enable(cap);
  public inline function disable(cap:Int):Void GL.disable(cap);
  public inline function drawArrays(mode:Int, first:Int, count:Int):Void GL.drawArrays(mode, first, count);
  public inline function drawElements(mode:Int, count:Int, type:Int, offset:Int):Void GL.drawElements(mode, count, type, offset);
}
#end
