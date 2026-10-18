// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/path/contract.hpp")
extern class Attempt_Path_appendPathEllipticalArcTo extends AttemptConfig {
  @:native("flight::path::append_path_elliptical_arc_to")
  public static function appendPathEllipticalArcTo(path:flight.Path, radiusX:Float, radiusY:Float, xAxisRotation:Float, largeArc:Bool, sweep:Bool, endX:Float, endY:Float):Void;
}
#end
