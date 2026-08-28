// Maintained host adapter: Flight AppBackend over a Clay application.
// Clay counterpart of flight.hostLime.LimeApp. Clay is single-window and
// subclass-driven (clay.Clay + a clay.Events), so identity comes off the
// global Clay.app rather than a passed application handle.
package flight.hostClay;

#if clay
import clay.Clay;
import flight.App;
import flight.types.AppBackend;

/** Maps Flight's AppBackend onto the Clay application singleton. */
class ClayApp {
  /**
   * Creates a Flight application backend backed by `Clay.app`.
   *
   * Starts from Flight's web backend (the documented sentinels for dock menus,
   * login items, recent documents, etc.) and overrides the integrations Clay
   * can honestly supply.
   */
  public static function createClayAppBackend():AppBackend {
    final backend = App.createWebAppBackend();
    backend.getName = function():String {
      final id = Clay.app.appId;
      return id == null ? '' : id;
    };
    backend.quit = function():Void {
      Clay.app.shutdown();
    };
    // TODO(hostClay): focus/showApp map onto Clay's window once the per-window
    // handle is wired (Clay exposes windowing through its runtime; the base
    // web sentinels remain correct until then).
    return backend;
  }
}
#end
