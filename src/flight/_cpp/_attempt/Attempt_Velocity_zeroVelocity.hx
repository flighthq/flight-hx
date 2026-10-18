// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_zeroVelocity extends AttemptConfig {
  @:native("flight::velocity::zero_velocity")
  public static function zeroVelocity(out:flight.Velocity2D):flight.Velocity2D;
}
#end
