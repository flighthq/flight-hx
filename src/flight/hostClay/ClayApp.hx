// Maintained host adapter: Flight `app` capability namespace over a Clay
// application. Clay counterpart of flight.hostLime.LimeApp. Clay is single-window
// and subclass-driven (clay.Clay + a clay.Events), so identity comes off the
// global Clay.app rather than a passed application handle. The upstream host seam
// decomposed AppBackend into per-field backends; Clay honestly supplies identity
// and quit, and the remaining fields are omitted so Flight's sentinels stand.
package flight.hostClay;

#if clay
import clay.Clay;
import flight.types.HostAppCapabilities;

class ClayApp {
  /** Builds the Clay-backed `app` capability namespace (composed by HostClay). */
  public static function createClayAppCapabilities():HostAppCapabilities {
    return cast {
      name: {
        getName: function():String {
          final id = Clay.app.appId;
          return id == null ? '' : id;
        },
      },
      quit: {
        quit: function():Void Clay.app.shutdown(),
      },
    };
  }
}
#end
