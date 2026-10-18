// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_pick extends AttemptConfig {
  @:native("flight::math::pick")
  public static function pick<T>(random:flight.RandomSource, items:Array<T>):Null<T>;
}
#end
