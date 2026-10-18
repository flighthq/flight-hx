// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/binpack/contract.hpp")
extern class Attempt_Binpack_packRectangles extends AttemptConfig {
  @:native("flight::binpack::pack_rectangles")
  public static function packRectangles(rects:Array<flight.PackableRectangle>, ?options:flight.BinPackOptions):flight.PackResult;
}
#end
