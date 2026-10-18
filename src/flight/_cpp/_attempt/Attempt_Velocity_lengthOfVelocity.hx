// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_lengthOfVelocity extends AttemptConfig {
  @:native("flight::velocity::length_of_velocity")
  public static function lengthOfVelocity(velocity:flight.Velocity2D):Float;
}
#end
