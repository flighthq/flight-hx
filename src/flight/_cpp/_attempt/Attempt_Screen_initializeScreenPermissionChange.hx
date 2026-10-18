// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_initializeScreenPermissionChange extends AttemptConfig {
  @:native("flight::screen::initialize_screen_permission_change")
  public static function initializeScreenPermissionChange(out:flight.EntityConstruction<flight.ScreenPermissionChange>):Void;
}
#end
