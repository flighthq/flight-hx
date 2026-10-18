// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_getScreenNearestRect extends AttemptConfig {
  @:native("flight::screen::get_screen_nearest_rect")
  public static function getScreenNearestRect(hostScreenQuery:flight.HostScreenQueryCapability, rect:flight.RectangleLike, out:flight.ScreenInfo):flight.ScreenInfo;
}
#end
