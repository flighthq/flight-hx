// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_randomWeighted extends AttemptConfig {
  @:native("flight::math::random_weighted")
  public static function randomWeighted(random:flight.RandomSource, weights:Array<Float>):Float;
}
#end
