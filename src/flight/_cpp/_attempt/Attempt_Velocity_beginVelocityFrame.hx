// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_beginVelocityFrame extends AttemptConfig {
  @:native("flight::velocity::begin_velocity_frame")
  public static function beginVelocityFrame(field:flight.VelocityField):Void;
}
#end
