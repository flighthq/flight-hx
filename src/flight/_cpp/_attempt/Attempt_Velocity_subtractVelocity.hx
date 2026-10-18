// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_subtractVelocity extends AttemptConfig {
  @:native("flight::velocity::subtract_velocity")
  public static function subtractVelocity(out:flight.Velocity2D, a:flight.Velocity2D, b:flight.Velocity2D):flight.Velocity2D;
}
#end
