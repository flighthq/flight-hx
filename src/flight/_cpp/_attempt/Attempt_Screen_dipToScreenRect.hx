// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/screen/contract.hpp")
extern class Attempt_Screen_dipToScreenRect extends AttemptConfig {
  @:native("flight::screen::dip_to_screen_rect")
  public static function dipToScreenRect(screen:flight.ScreenInfo, rect:flight.RectangleLike, out:{ x:Float, y:Float, width:Float, height:Float }):{ x:Float, y:Float, width:Float, height:Float };
}
#end
