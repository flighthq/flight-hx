// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_getPrimaryScreen extends AttemptConfig {
  @:native("flight::screen::get_primary_screen")
  public static function getPrimaryScreen(hostScreenQuery:flight.HostScreenQueryCapability, out:flight.ScreenInfo):flight.ScreenInfo;
}
#end
