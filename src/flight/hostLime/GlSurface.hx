// Maintained host adapter for the GL-backed presentable surface — the GL
// counterpart of flight._internal.scene2DCairo.CairoSurface, promoted from the
// examples' per-file adapters.
package flight.hostLime;

#if lime
import lime.ui.Window;

/**
 * A window-backed GL surface with the canvas shape `createGlRenderState`
 * expects. `width`/`height` are plain physical-pixel fields because Flight
 * reads them reflectively today (typed host access makes this a compile-time
 * contract when it lands); the class is `@:keep` so dead-code elimination
 * cannot strip reflectively-reached members.
 */
@:keep
class GlSurface {
  /** Allocation entry point, Flight-style: `createGlSurface(window)`.
   * The return is typed as the host canvas: on js the adapter never runs
   * (real browser canvases come from the DOM), and on native the host type
   * currently erases to `Dynamic`, so the adapter is accepted as-is. */
  public static function createGlSurface(window:Window):flight._internal.dom.HTMLCanvasElement {
    return cast new GlSurface(window);
  }

  public var width:Int = 0;
  public var height:Int = 0;

  final window:Window;
  final context:Dynamic;

  function new(window:Window) {
    this.window = window;
    context = resolveContext(window);
    if (context == null) throw 'Flight requires a hardware OpenGL/WebGL window.';
    syncSize();
    window.onResize.add((_, _) -> syncSize());
  }

  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  function syncSize():Void {
    width = Std.int(window.width * window.scale);
    height = Std.int(window.height * window.scale);
  }

  static function resolveContext(window:Window):Dynamic {
    final renderContext:Dynamic = window.context;
    if (renderContext == null) return null;
    final webgl2 = renderContext.webgl2;
    return webgl2 == null ? renderContext.webgl : webgl2;
  }
}
#end
