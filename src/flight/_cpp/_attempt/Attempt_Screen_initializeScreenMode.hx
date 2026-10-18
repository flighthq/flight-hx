// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_initializeScreenMode extends AttemptConfig {
  @:native("flight::screen::initialize_screen_mode")
  public static function initializeScreenMode(out:flight.EntityConstruction<flight.ScreenMode>):Void;
}
#end
