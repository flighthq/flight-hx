// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_randomInt extends AttemptConfig {
  @:native("flight::math::random_int")
  public static function randomInt(random:flight.RandomSource, min:Float, max:Float):Float;
}
#end
