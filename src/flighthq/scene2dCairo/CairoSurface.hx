// Maintained host adapter for the Cairo-named 2D surface. Handwritten: the
// derived alias modules in this package forward to the canvas originals, but
// surface creation is genuinely native-specific — upstream's
// `createCanvasElement` produces a DOM (or offscreen scratch) canvas, while a
// presentable native surface wraps a Lime window's cairo context.
package flighthq.scene2dCairo;

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
  /** Allocation entry point, Flight-style: `createCairoSurface(window)`. */
  public static function createCairoSurface(window:Window):CairoSurface {
    return new CairoSurface(window);
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
    context = new flighthq._internal.backend.NativeCanvas2dContext(window.context.cairo,
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
    (cast context : flighthq._internal.backend.NativeCanvas2dContext).resize(width, height);
    #end
  }
}
#end
