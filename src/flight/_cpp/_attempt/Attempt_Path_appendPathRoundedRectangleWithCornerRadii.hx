// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathRoundedRectangleWithCornerRadii extends AttemptConfig {
  @:native("flight::path::append_path_rounded_rectangle_with_corner_radii")
  public static function appendPathRoundedRectangleWithCornerRadii(path:flight.Path, x:Float, y:Float, width:Float, height:Float, topLeft:Float, topRight:Float, bottomRight:Float, bottomLeft:Float):Void;
}
#end
