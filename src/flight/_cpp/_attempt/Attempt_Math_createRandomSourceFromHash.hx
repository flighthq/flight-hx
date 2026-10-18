// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_createRandomSourceFromHash extends AttemptConfig {
  @:native("flight::math::create_random_source_from_hash")
  public static function createRandomSourceFromHash(x:Float, y:Float):flight.RandomSource;
}
#end
