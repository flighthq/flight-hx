// Maintained host adapter: Flight net backend for the Clay host.
// Clay counterpart of flight.hostLime.LimeNet. SKELETON: js delegates to
// Flight's web backend (verified); the native transport is the fill-in — Clay
// has no HTTP seam of its own, so this maps onto haxe.Http / a linc transport
// with the same sentinel-on-failure contract LimeNet documents.
package flight.hostClay;

#if clay
import flight.types.NetBackend;

class ClayNet {
  /** Allocation entry point, Flight-style: `createClayNetBackend()`. */
  public static function createClayNetBackend():NetBackend {
    #if js
    return flight.Net.createWebNetBackend();
    #else
    // TODO(hostClay): native HTTP over haxe.Http (or a linc transport),
    // porting LimeNet's contract — expected failures resolve to the sentinel
    // response (status 0, ok false) rather than rejecting; non-2xx is a normal
    // response with ok false. Until wired, delegate to the web backend so the
    // seam is installable and Flight-side type-correct.
    return flight.Net.createWebNetBackend();
    #end
  }
}
#end
