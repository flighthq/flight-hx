// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_getScreenCurrentMode extends AttemptConfig {
  @:native("flight::screen::get_screen_current_mode")
  public static function getScreenCurrentMode(screen:flight.ScreenInfo, out:flight.ScreenMode):flight.ScreenMode;
}
#end
