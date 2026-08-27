// Maintained host adapter: Flight cursor backend over the Lime window cursor.
// Upstream's createWebCursorBackend writes element.style.cursor, which has no
// native meaning; this backend maps Flight's CSS-style cursor names onto
// lime.ui.MouseCursor so pointer feedback actually works on native windows.
package flight.hostLime;

#if lime
import lime.ui.MouseCursor;
import lime.ui.Window;

class LimeCursor {
  /** Allocation entry point, Flight-style: `createLimeCursorBackend(window)`. */
  public static function createLimeCursorBackend(window:Window):flight.types.CursorBackend {
    return cast {
      setCursor: function(cursor:Null<Dynamic>):Void {
        window.cursor = mapCursor(cursor == null ? '' : Std.string(cursor));
      },
    };
  }

  static function mapCursor(name:String):MouseCursor {
    return switch (name) {
      case 'pointer': POINTER;
      case 'text': TEXT;
      case 'crosshair': CROSSHAIR;
      case 'move': MOVE;
      case 'ew-resize', 'col-resize': RESIZE_WE;
      case 'ns-resize', 'row-resize': RESIZE_NS;
      case 'nesw-resize': RESIZE_NESW;
      case 'nwse-resize': RESIZE_NWSE;
      default: ARROW;
    };
  }
}
#end
