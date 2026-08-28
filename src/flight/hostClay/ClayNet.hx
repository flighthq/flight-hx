// Maintained host adapter: Flight net backend for the Clay host.
// Clay counterpart of flight.hostLime.LimeNet. SKELETON: js delegates to
// Flight's web backend (verified); the native transport is the fill-in — Clay
// has no HTTP seam of its own, so this maps onto haxe.Http / a linc transport
// with the same sentinel-on-failure contract LimeNet documents.
package flight.hostClay;

#if clay
import flight.types.NetBackend;

class ClayNet {
  /** Allocation entry point, Flight-style: `createClayNetBackend()`.
   *
   * NOTE: Flight's web net-backend factory moved into an underscore impl module
   * during the public-surface refactor and hostLime's transport pattern is being
   * restabilized by `builder`. Kept a typed stub here to stay decoupled from that
   * churn; the native transport (haxe.Http, porting LimeNet's sentinel-on-failure
   * contract) is filled once hostLime's pattern lands. */
  public static function createClayNetBackend():NetBackend {
    // TODO(hostClay): native HTTP over haxe.Http; expected failures resolve to
    // the sentinel response (status 0, ok false) rather than rejecting.
    return cast {};
  }
}
#end
