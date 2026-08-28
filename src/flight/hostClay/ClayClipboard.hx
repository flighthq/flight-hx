// Maintained host adapter: Flight clipboard backend for the Clay host.
// Clay counterpart of flight.hostLime.LimeClipboard. SKELETON: text clipboard
// maps onto SDL's clipboard via Clay's runtime (the fill-in); readFiles/
// writeFiles have no cross-platform SDL equivalent and keep the empty-sentinel
// shape LimeClipboard uses. Typed stub so the seam is installable.
package flight.hostClay;

#if clay
import flight.types.ClipboardBackend;

class ClayClipboard {
  /** Allocation entry point, Flight-style: `createClayClipboardBackend()`. */
  public static function createClayClipboardBackend():ClipboardBackend {
    final backend:Dynamic = Reflect.copy((flight._Clipboard._sentinel__clipboard : Dynamic));
    // TODO(hostClay): override readText/writeText over SDL_GetClipboardText/
    // SDL_SetClipboardText via Clay's runtime; file clipboard stays sentinel.
    return cast backend;
  }
}
#end
