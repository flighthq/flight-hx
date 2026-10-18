// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_createRandomSource extends AttemptConfig {
  @:native("flight::math::create_random_source")
  public static function createRandomSource(seed:Float):flight.RandomSource;
}
#end
