// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_getScreenById extends AttemptConfig {
  @:native("flight::screen::get_screen_by_id")
  public static function getScreenById(hostScreenQuery:flight.HostScreenQueryCapability, id:Float, out:flight.ScreenInfo):Null<flight.ScreenInfo>;
}
#end
