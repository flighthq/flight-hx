// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_standardDeviation extends AttemptConfig {
  @:native("flight::math::standard_deviation")
  public static function standardDeviation(values:Array<Float>):Float;
}
#end
