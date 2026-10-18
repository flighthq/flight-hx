// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/velocity/contract.hpp")
extern class Attempt_Velocity_initializeVelocityField extends AttemptConfig {
  @:native("flight::velocity::initialize_velocity_field")
  public static function initializeVelocityField(out:flight.EntityConstruction<flight.VelocityField>):Void;
}
#end
