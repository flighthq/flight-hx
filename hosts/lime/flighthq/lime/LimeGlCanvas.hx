package flighthq.lime;

import lime.ui.Window;

/**
 * A minimal, duck-typed "canvas" that adapts a Lime window's GL context to the
 * shape Flight's WebGL renderer expects.
 *
 * `flighthq.RenderGl.createGlRenderState(canvas, options)` never assumes a real
 * DOM canvas — it only calls `canvas.getContext('webgl2', attrs)` and then reads
 * `canvas.width` / `canvas.height`. Lime's own render context is WebGL-compatible
 * on every target, so returning it from `getContext` lets Flight drive Lime's GL
 * without any change to the generated SDK.
 *
 * NOTE: written against Lime's API without a Lime toolchain to compile against.
 * The one accessor to double-check against your Lime version is how the WebGL2
 * context is reached from `window.context` (see `resolveContext`).
 */
class LimeGlCanvas {
  public var width(get, never):Int;
  public var height(get, never):Int;

  final window:Window;
  final context:Dynamic;

  public function new(window:Window) {
    this.window = window;
    this.context = resolveContext(window);
    if (this.context == null) {
      throw "flighthq.lime: the Lime window has no WebGL/OpenGL render context; "
        + "request an OpenGL context in your project.xml (<window hardware=\"true\" />).";
    }
  }

  /** Flight only asks for a 'webgl2' context; hand back Lime's GL context. */
  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  function get_width():Int {
    return window.width;
  }

  function get_height():Int {
    return window.height;
  }

  /**
   * Lime exposes the GL context through `window.context`. `WebGLRenderContext`
   * implements the WebGL 1/2 API surface Flight uses. Prefer the WebGL2 view and
   * fall back to WebGL. If your Lime version names these accessors differently,
   * this is the single line to adjust.
   */
  static function resolveContext(window:Window):Dynamic {
    final renderContext:Dynamic = window.context;
    if (renderContext == null) return null;
    final webgl2 = renderContext.webgl2;
    if (webgl2 != null) return webgl2;
    return renderContext.webgl;
  }
}
