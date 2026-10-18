// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_shuffleInPlace extends AttemptConfig {
  @:native("flight::math::shuffle_in_place")
  public static function shuffleInPlace<T>(random:flight.RandomSource, items:Array<T>):Void;
}
#end
