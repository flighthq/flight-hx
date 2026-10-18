// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_randomInsideUnitDisc extends AttemptConfig {
  @:native("flight::math::random_inside_unit_disc")
  public static function randomInsideUnitDisc(random:flight.RandomSource, out:flight.Vector2Like):Void;
}
#end
