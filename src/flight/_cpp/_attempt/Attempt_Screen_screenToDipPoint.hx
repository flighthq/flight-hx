// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_screenToDipPoint extends AttemptConfig {
  @:native("flight::screen::screen_to_dip_point")
  public static function screenToDipPoint(screen:flight.ScreenInfo, point:flight.Vector2Like, out:{ x:Float, y:Float }):{ x:Float, y:Float };
}
#end
