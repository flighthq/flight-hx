// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getCubicBezierPoint extends AttemptConfig {
  @:native("flight::path::get_cubic_bezier_point")
  public static function getCubicBezierPoint(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:flight.Vector2Like):flight.Vector2Like;
}
#end
