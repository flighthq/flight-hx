// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_hasGyroscope extends AttemptConfig {
  @:native("flight::sensors::has_gyroscope")
  public static function hasGyroscope(hostSensors:flight.HostSensorsCapability):Bool;
}
#end
