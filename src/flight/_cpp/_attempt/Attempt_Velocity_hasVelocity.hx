// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_hasVelocity extends AttemptConfig {
  @:native("flight::velocity::has_velocity")
  public static function hasVelocity(field:flight.VelocityField, source:Dynamic):Bool;
}
#end
