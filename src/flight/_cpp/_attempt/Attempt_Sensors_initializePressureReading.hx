// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_initializePressureReading extends AttemptConfig {
  @:native("flight::sensors::initialize_pressure_reading")
  public static function initializePressureReading(out:flight.EntityConstruction<flight.PressureReading>):Void;
}
#end
