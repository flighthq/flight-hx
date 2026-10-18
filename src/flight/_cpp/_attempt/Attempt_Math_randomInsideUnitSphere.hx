// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/math/contract.hpp")
extern class Attempt_Math_randomInsideUnitSphere extends AttemptConfig {
  @:native("flight::math::random_inside_unit_sphere")
  public static function randomInsideUnitSphere(random:flight.RandomSource, out:flight.Vector3Like):Void;
}
#end
