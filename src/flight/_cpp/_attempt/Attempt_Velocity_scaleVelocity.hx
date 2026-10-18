// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_scaleVelocity extends AttemptConfig {
  @:native("flight::velocity::scale_velocity")
  public static function scaleVelocity(out:flight.Velocity2D, velocity:flight.Velocity2D, scale:Float):flight.Velocity2D;
}
#end
