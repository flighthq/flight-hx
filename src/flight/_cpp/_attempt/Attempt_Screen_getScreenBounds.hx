// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_getScreenBounds extends AttemptConfig {
  @:native("flight::screen::get_screen_bounds")
  public static function getScreenBounds(screen:flight.ScreenInfo, out:{ x:Float, y:Float, width:Float, height:Float }):{ x:Float, y:Float, width:Float, height:Float };
}
#end
