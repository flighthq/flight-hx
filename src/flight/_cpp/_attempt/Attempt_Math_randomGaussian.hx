// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_randomGaussian extends AttemptConfig {
  @:native("flight::math::random_gaussian")
  public static function randomGaussian(random:flight.RandomSource, ?mean:Float, ?standardDeviation:Float):Float;
}
#end
