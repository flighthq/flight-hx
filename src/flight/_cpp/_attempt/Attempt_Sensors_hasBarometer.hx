// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_hasBarometer extends AttemptConfig {
  @:native("flight::sensors::has_barometer")
  public static function hasBarometer(hostSensors:flight.HostSensorsCapability):Bool;
}
#end
