// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_getScreenNearestPoint extends AttemptConfig {
  @:native("flight::screen::get_screen_nearest_point")
  public static function getScreenNearestPoint(hostScreenQuery:flight.HostScreenQueryCapability, point:flight.Vector2Like, out:flight.ScreenInfo):flight.ScreenInfo;
}
#end
