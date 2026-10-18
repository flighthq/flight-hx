// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_median extends AttemptConfig {
  @:native("flight::math::median")
  public static function median(values:Array<Float>):Float;
}
#end
