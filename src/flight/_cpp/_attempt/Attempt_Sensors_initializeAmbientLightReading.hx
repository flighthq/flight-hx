// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_initializeAmbientLightReading extends AttemptConfig {
  @:native("flight::sensors::initialize_ambient_light_reading")
  public static function initializeAmbientLightReading(out:flight.EntityConstruction<flight.AmbientLightReading>):Void;
}
#end
