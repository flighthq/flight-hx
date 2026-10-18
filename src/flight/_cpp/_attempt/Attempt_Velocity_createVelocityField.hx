// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_createVelocityField extends AttemptConfig {
  @:native("flight::velocity::create_velocity_field")
  public static function createVelocityField():flight.VelocityField;
}
#end
