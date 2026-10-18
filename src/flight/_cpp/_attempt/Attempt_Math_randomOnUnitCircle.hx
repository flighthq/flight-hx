// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_randomOnUnitCircle extends AttemptConfig {
  @:native("flight::math::random_on_unit_circle")
  public static function randomOnUnitCircle(random:flight.RandomSource, out:flight.Vector2Like):Void;
}
#end
