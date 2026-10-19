// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
import flight.*;
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<set name="HXCPP_NO_CPP11" value="1" />
<unset name="HXCPP_CPP11" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/sensors.cpp" />
  <compilerflag value="/std:c++20" if="windows" />
  <compilerflag value="-std=c++20" unless="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/overrides/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/generated/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/overrides/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/generated/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_hx_root}/src-cpp/include" unless="windows" />
</files>
')
@:include("flight_hx/sensors.hpp")
extern class Sensors {
  @:native("flight_hx::sensors::compute_euler_from_quaternion")
  static function computeEulerFromQuaternion(out:flight.OrientationReading, quaternion:flight.QuaternionReading):Void;

  @:native("flight_hx::sensors::compute_gravity_from_orientation")
  static function computeGravityFromOrientation(out:flight.MotionReading, orientation:flight.OrientationReading):Void;

  @:native("flight_hx::sensors::compute_quaternion_from_orientation_reading")
  static function computeQuaternionFromOrientationReading(out:flight.QuaternionReading, orientation:flight.OrientationReading):Void;

  @:native("flight_hx::sensors::compute_screen_relative_orientation")
  static function computeScreenRelativeOrientation(out:flight.OrientationReading, orientation:flight.OrientationReading, screenAngle:Float):Void;

  @:native("flight_hx::sensors::compute_world_acceleration_from_device_acceleration")
  static function computeWorldAccelerationFromDeviceAcceleration(out:flight.MotionReading, acceleration:flight.MotionReading, quaternion:flight.QuaternionReading):Void;

  @:native("flight_hx::sensors::create_ambient_light_reading")
  static function createAmbientLightReading():flight.AmbientLightReading;

  @:native("flight_hx::sensors::create_motion_reading")
  static function createMotionReading():flight.MotionReading;

  @:native("flight_hx::sensors::create_orientation_reading")
  static function createOrientationReading():flight.OrientationReading;

  @:native("flight_hx::sensors::create_pressure_reading")
  static function createPressureReading():flight.PressureReading;

  @:native("flight_hx::sensors::create_proximity_reading")
  static function createProximityReading():flight.ProximityReading;

  @:native("flight_hx::sensors::create_quaternion_reading")
  static function createQuaternionReading():flight.QuaternionReading;

  @:native("flight_hx::sensors::create_rotation_rate_reading")
  static function createRotationRateReading():flight.RotationRateReading;

  @:native("flight_hx::sensors::create_sensors")
  static function createSensors():flight.Sensors;

  @:native("flight_hx::sensors::detach_sensors")
  static function detachSensors(sensors:flight.Sensors):Void;

  @:native("flight_hx::sensors::dispose_sensors")
  static function disposeSensors(sensors:flight.Sensors):Void;
}
#end
