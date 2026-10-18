// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_dampVelocity extends AttemptConfig {
  @:native("flight::velocity::damp_velocity")
  public static function dampVelocity(out:flight.Velocity2D, current:flight.Velocity2D, previous:flight.Velocity2D, factor:Float):flight.Velocity2D;
}
#end
