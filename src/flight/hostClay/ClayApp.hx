// Maintained host adapter: Flight AppBackend over a Clay application.
// Clay counterpart of flight.hostLime.LimeApp. Clay is single-window and
// subclass-driven (clay.Clay + a clay.Events), so identity comes off the
// global Clay.app rather than a passed application handle.
package flight.hostClay;

#if clay
import clay.Clay;
import flight.types.AppBackend;

/** Maps Flight's AppBackend onto the Clay application singleton.
 *
 * Follows hostLime's matured idiom: copy Flight's capability-owned sentinel
 * backend (so unsupported desktop-shell operations retain their sentinel
 * behavior) and override the integrations Clay can honestly supply. */
class ClayApp {
  /** Creates a backend without installing it (install via HostClay). */
  public static function createClayAppBackend():AppBackend {
    final backend:Dynamic = Reflect.copy((flight._App._sentinel__app : Dynamic));
    backend.getName = function():String {
      final id = Clay.app.appId;
      return id == null ? '' : id;
    };
    backend.quit = function():Void Clay.app.shutdown();
    // TODO(hostClay): focus/getAppPath/getCommandLine map onto Clay's runtime
    // and sys APIs (parallel to LimeApp); sentinels retained until then.
    return cast backend;
  }
}
#end
