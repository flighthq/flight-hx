// Maintained host adapter: Flight ScreenBackend for Clay (sentinel-copy + Clay
// overrides). WRITE-AHEAD against develop 2cf1c5cef. Clay exposes a single
// screen via Clay.app (screenWidth/Height/Density); multi-display enumeration is
// a sentinel like hostLime's subset. See agents/host-develop-adaptation.md.
package flight.hostClay;

#if clay
import clay.Clay;

class ClayScreen {
  /** Install via `flight._Screen.installScreenHostBackend`. */
  public static function createClayScreenBackend():Dynamic {
    final backend:Dynamic = Reflect.copy((flight._Screen._sentinel__screen : Dynamic));
    backend.getPrimaryDisplayGeometry = function():Dynamic
      return {x: 0.0, y: 0.0, width: (Clay.app.screenWidth : Float), height: (Clay.app.screenHeight : Float)};
    backend.getDisplayScale = function():Float return Clay.app.screenDensity;
    // TODO(develop): display enumeration/modes/orientation via Clay/SDL; sentinel otherwise.
    return cast backend;
  }
}
#end
