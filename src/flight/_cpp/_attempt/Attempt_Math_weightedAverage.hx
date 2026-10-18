// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_weightedAverage extends AttemptConfig {
  @:native("flight::math::weighted_average")
  public static function weightedAverage(values:Array<Float>, weights:Array<Float>):Float;
}
#end
