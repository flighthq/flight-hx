// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_getScreenCursorPosition extends AttemptConfig {
  @:native("flight::screen::get_screen_cursor_position")
  public static function getScreenCursorPosition(hostScreenQuery:flight.HostScreenQueryCapability, out:{ x:Float, y:Float }):{ x:Float, y:Float };
}
#end
