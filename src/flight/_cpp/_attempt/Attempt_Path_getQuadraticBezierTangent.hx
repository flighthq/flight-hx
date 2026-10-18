// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_getQuadraticBezierTangent extends AttemptConfig {
  @:native("flight::path::get_quadratic_bezier_tangent")
  public static function getQuadraticBezierTangent(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:flight.Vector2Like):flight.Vector2Like;
}
#end
