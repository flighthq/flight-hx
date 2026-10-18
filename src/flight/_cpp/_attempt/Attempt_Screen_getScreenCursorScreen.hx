// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_getScreenCursorScreen extends AttemptConfig {
  @:native("flight::screen::get_screen_cursor_screen")
  public static function getScreenCursorScreen(hostScreenQuery:flight.HostScreenQueryCapability, out:flight.ScreenInfo):flight.ScreenInfo;
}
#end
