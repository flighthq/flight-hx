// Maintained host adapter: Flight cursor backend for the Clay host.
// HONEST CAPABILITY: Clay's SDL binding (clay.sdl.SDL) exposes NO cursor surface
// — no SDL_CreateSystemCursor / SDL_SetCursor. With nothing to call, setCursor is
// a no-op (the pointer keeps the system default) rather than pretending to change
// it. Wiring real cursors would require binding SDL's cursor functions in Clay's
// linc layer — out of scope here. See host-develop-adaptation.md.
package flight.hostClay;

#if clay
import flight.types.CursorBackend;

class ClayCursor {
  /** Allocation entry point, Flight-style: `createClayCursorBackend()`. */
  public static function createClayCursorBackend():CursorBackend {
    return cast {
      // No-op: Clay exposes no cursor API to honor the requested shape.
      setCursor: function(_cursor:Null<Dynamic>):Void {},
    };
  }
}
#end
