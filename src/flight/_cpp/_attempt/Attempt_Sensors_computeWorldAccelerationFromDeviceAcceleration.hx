// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/sensors/contract.hpp")
extern class Attempt_Sensors_computeWorldAccelerationFromDeviceAcceleration extends AttemptConfig {
  @:native("flight::sensors::compute_world_acceleration_from_device_acceleration")
  public static function computeWorldAccelerationFromDeviceAcceleration(out:flight.MotionReading, acceleration:flight.MotionReading, quaternion:flight.QuaternionReading):Void;
}
#end
