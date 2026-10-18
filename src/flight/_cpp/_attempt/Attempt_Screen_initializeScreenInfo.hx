// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_initializeScreenInfo extends AttemptConfig {
  @:native("flight::screen::initialize_screen_info")
  public static function initializeScreenInfo(out:flight.EntityConstruction<flight.ScreenInfo>):Void;
}
#end
