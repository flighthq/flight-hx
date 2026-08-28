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
 * NOTE: Flight's host-adapter factory surface is mid-refactor on this base
 * (the former `createWebAppBackend` seed was removed); `builder` is stabilizing
 * it via hostLime. To stay decoupled from that churn, this backend is built
 * inline rather than seeded from a web default. Once hostLime's migration lands,
 * re-align this to whatever seed/override pattern it settles on. */
class ClayApp {
  /** Creates a Flight application backend backed by `Clay.app`. */
  public static function createClayAppBackend():AppBackend {
    return cast {
      getName: function():String {
        final id = Clay.app.appId;
        return id == null ? '' : id;
      },
      getVersion: function():String return '',
      quit: function():Void Clay.app.shutdown(),
      // TODO(hostClay): focus/showApp map onto Clay's window once the per-window
      // handle is wired; sentinels until then.
      focus: function():Void {},
      showApp: function():Bool return false,
    };
  }
}
#end
