// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_dipToScreenPoint extends AttemptConfig {
  @:native("flight::screen::dip_to_screen_point")
  public static function dipToScreenPoint(screen:flight.ScreenInfo, point:flight.Vector2Like, out:{ x:Float, y:Float }):{ x:Float, y:Float };
}
#end
