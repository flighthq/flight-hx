// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_getVelocitySampleAt extends AttemptConfig {
  @:native("flight::velocity::get_velocity_sample_at")
  public static function getVelocitySampleAt(sample:flight.VelocitySample, currentWorldTransform:flight.Matrix, pointX:Float, pointY:Float, out:flight.Velocity2D):flight.Velocity2D;
}
#end
