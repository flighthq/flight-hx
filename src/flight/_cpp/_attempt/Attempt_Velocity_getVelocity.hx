// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_getVelocity extends AttemptConfig {
  @:native("flight::velocity::get_velocity")
  public static function getVelocity(field:flight.VelocityField, source:Dynamic, out:flight.Velocity2D):flight.Velocity2D;
}
#end
