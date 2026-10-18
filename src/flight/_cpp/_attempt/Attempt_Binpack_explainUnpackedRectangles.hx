// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/binpack/contract.hpp")
extern class Attempt_Binpack_explainUnpackedRectangles extends AttemptConfig {
  @:native("flight::binpack::explain_unpacked_rectangles")
  public static function explainUnpackedRectangles(rectangles:Array<flight.PackableRectangle>, ?options:flight.BinPackOptions):Array<flight.UnpackedRectangleExplanation>;
}
#end
