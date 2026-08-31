// Maintained host adapter for the Cairo-named 2D surface. Handwritten: the
// derived alias modules in this package forward to the canvas originals, but
// surface creation is genuinely native-specific — upstream's
// `createCanvasElement` produces a DOM (or offscreen scratch) canvas, while a
// presentable native surface wraps a Lime window's cairo context.
package flight._internal.scene2DCairo;

#if lime
import lime.ui.Window;

/**
 * A window-backed presentable Cairo surface with the shape
 * `createCairoRenderState` expects from a canvas.
 *
 * `width`/`height` are plain physical-pixel fields (window size times scale)
 * because Flight reads them reflectively to build the viewport and the
 * pixel-to-clip projection; a Haxe property would reflect as absent and turn
 * every draw into a NaN-projection discard. The class is `@:keep` for the
 * same reason: it is reached reflectively (`getContext`/`width`/`height`), so
 * dead-code elimination must not strip its members.
 */
@:keep
class CairoSurface {
  /** Allocation entry point, Flight-style: `createCairoSurface(window)`.
   * The return is typed as the host canvas: on js the adapter never runs, and
   * on native the host type currently erases to `Dynamic`, so the adapter is
   * accepted as-is. */
  public static function createCairoSurface(window:Window):flight._internal.dom.HTMLCanvasElement {
    return cast new CairoSurface(window);
  }

  /**
   * The native canvas render-surface creator for Cairo rendering.
   *
   * The upstream render-pipeline seam makes surface allocation host-provided
   * (web supplies `createWebCanvasRenderSurfaceCreator`). This is the native
   * counterpart: child surfaces are allocated as `NativeScratchCanvas` (which
   * lazily owns a Cairo image surface) and destroyed by zeroing their backing
   * dimensions — the same ownership contract the web creator uses. It is
   * Cairo/runtime-specific rather than application-host-specific, so both Lime
   * and Clay reuse it.
   */
  public static function createCairoRenderSurfaceCreator():flight.types.CanvasRenderSurfaceCreator {
    return cast {
      __EntityRuntimeKey: {binding: null},
      createRenderSurface: function(width:Float, height:Float, pixelRatio:Float) {
        final canvas = new flight._internal.backend.NativeScratchCanvas();
        canvas.width = Std.int(width * pixelRatio);
        canvas.height = Std.int(height * pixelRatio);
        return cast canvas;
      },
      destroyRenderSurface: function(canvas:flight._internal.dom.HTMLCanvasElement):Void {
        flight._internal.backend.CanvasElementBackend.setField(canvas, 'width', 0);
        flight._internal.backend.CanvasElementBackend.setField(canvas, 'height', 0);
      },
    };
  }

  public var width:Int = 0;
  public var height:Int = 0;

  final window:Window;
  final context:Dynamic;

  function new(window:Window) {
    this.window = window;
    #if (!js && lime_cairo)
    // Lime creates (and can recreate) the window Cairo at render-surface lock,
    // so hand the context a live provider instead of one cached instance.
    final windowRef = window;
    context = new flight._internal.backend.NativeCanvas2dContext(window.context.cairo,
      () -> windowRef.context.cairo);
    #else
    context = null;
    #end
    syncSize();
    window.onResize.add((_, _) -> syncSize());
  }

  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  function syncSize():Void {
    width = Std.int(window.width * window.scale);
    height = Std.int(window.height * window.scale);
    #if (!js && lime_cairo)
    (cast context : flight._internal.backend.NativeCanvas2dContext).resize(width, height);
    #end
  }
}
#end
