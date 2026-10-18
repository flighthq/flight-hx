// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_randomGaussianPair extends AttemptConfig {
  @:native("flight::math::random_gaussian_pair")
  public static function randomGaussianPair(random:flight.RandomSource, ?mean:Float, ?standardDeviation:Float):Array<Float>;
}
#end
