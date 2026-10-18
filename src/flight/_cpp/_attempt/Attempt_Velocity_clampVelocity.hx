// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_clampVelocity extends AttemptConfig {
  @:native("flight::velocity::clamp_velocity")
  public static function clampVelocity(out:flight.Velocity2D, velocity:flight.Velocity2D, maxLength:Float):flight.Velocity2D;
}
#end
