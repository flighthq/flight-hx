// Maintained host adapter: Flight cursor backend for the Clay host.
// Clay counterpart of flight.hostLime.LimeCursor. SKELETON: Clay exposes raw
// input events (clay.Events.mouse*) but the mapping of Flight's CSS-style
// cursor names onto a Clay/SDL system cursor is the fill-in — SDL_SetCursor via
// Clay's runtime. Until wired, setCursor is a no-op so the seam is installable.
package flight.hostClay;

#if clay
import flight.types.CursorBackend;

class ClayCursor {
  /** Allocation entry point, Flight-style: `createClayCursorBackend()`. */
  public static function createClayCursorBackend():CursorBackend {
    return cast {
      setCursor: function(_cursor:Null<Dynamic>):Void {
        // TODO(hostClay): map CSS cursor names -> SDL system cursor via Clay's
        // runtime (parallels LimeCursor's MouseCursor mapping).
      },
    };
  }
}
#end
