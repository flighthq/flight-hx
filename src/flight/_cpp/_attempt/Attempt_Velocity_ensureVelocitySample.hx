// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_ensureVelocitySample extends AttemptConfig {
  @:native("flight::velocity::ensure_velocity_sample")
  public static function ensureVelocitySample(field:flight.VelocityField, source:Dynamic):flight.VelocitySample;
}
#end
