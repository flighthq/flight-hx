// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_randomBool extends AttemptConfig {
  @:native("flight::math::random_bool")
  public static function randomBool(random:flight.RandomSource, ?probability:Float):Bool;
}
#end
