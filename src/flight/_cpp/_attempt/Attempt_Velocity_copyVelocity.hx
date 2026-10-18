// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_copyVelocity extends AttemptConfig {
  @:native("flight::velocity::copy_velocity")
  public static function copyVelocity(out:flight.Velocity2D, source:flight.Velocity2D):flight.Velocity2D;
}
#end
