// Maintained host adapter: Flight `screen` capability namespace for Clay. Clay
// exposes a single screen via Clay.app (screenWidth/Height/Density); multi-
// display enumeration, modes, and change delivery are omitted so Flight's
// sentinels stand. The upstream host seam split ScreenBackend into a `query`
// backend (enumeration + cursor); this fills the honest Clay geometry.
package flight.hostClay;

#if clay
import clay.Clay;
import flight.types.HostScreenCapabilities;

class ClayScreen {
  public static function createClayScreenCapabilities():HostScreenCapabilities {
    final fill = function(out:Dynamic):Dynamic {
      out.x = 0.0;
      out.y = 0.0;
      out.width = (Clay.app.screenWidth : Float);
      out.height = (Clay.app.screenHeight : Float);
      out.scaleFactor = Clay.app.screenDensity;
      out.isPrimary = true;
      return out;
    };
    return cast {
      query: {
        getPrimaryScreen: function(out:Dynamic):Dynamic return fill(out),
        getScreens: function(out:Array<Dynamic>):Array<Dynamic> {
          out.resize(1);
          if (out[0] == null) out[0] = {};
          fill(out[0]);
          return out;
        },
        getCursorPosition: function(out:Dynamic):Dynamic {
          out.x = 0.0;
          out.y = 0.0;
          return out;
        },
      },
    };
  }
}
#end
