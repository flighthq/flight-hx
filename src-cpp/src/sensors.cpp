// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/sensors/contract.hpp>
#include <flight_hx/sensors.hpp>

namespace flight_hx::sensors {

void compute_euler_from_quaternion(flight::Ref<flight::types::OrientationReading> out, flight::Ref<flight::types::QuaternionReading> quaternion) {
  flight::sensors::compute_euler_from_quaternion(out, quaternion);
}

void compute_gravity_from_orientation(flight::Ref<flight::types::MotionReading> out, flight::Ref<flight::types::OrientationReading> orientation) {
  flight::sensors::compute_gravity_from_orientation(out, orientation);
}

void compute_quaternion_from_orientation_reading(flight::Ref<flight::types::QuaternionReading> out, flight::Ref<flight::types::OrientationReading> orientation) {
  flight::sensors::compute_quaternion_from_orientation_reading(out, orientation);
}

void compute_screen_relative_orientation(flight::Ref<flight::types::OrientationReading> out, flight::Ref<flight::types::OrientationReading> orientation, double screenAngle) {
  flight::sensors::compute_screen_relative_orientation(out, orientation, screenAngle);
}

void compute_world_acceleration_from_device_acceleration(flight::Ref<flight::types::MotionReading> out, flight::Ref<flight::types::MotionReading> acceleration, flight::Ref<flight::types::QuaternionReading> quaternion) {
  flight::sensors::compute_world_acceleration_from_device_acceleration(out, acceleration, quaternion);
}

flight::Ref<flight::types::AmbientLightReading> create_ambient_light_reading() {
  return flight::sensors::create_ambient_light_reading();
}

flight::Ref<flight::types::MotionReading> create_motion_reading() {
  return flight::sensors::create_motion_reading();
}

flight::Ref<flight::types::OrientationReading> create_orientation_reading() {
  return flight::sensors::create_orientation_reading();
}

flight::Ref<flight::types::PressureReading> create_pressure_reading() {
  return flight::sensors::create_pressure_reading();
}

flight::Ref<flight::types::ProximityReading> create_proximity_reading() {
  return flight::sensors::create_proximity_reading();
}

flight::Ref<flight::types::QuaternionReading> create_quaternion_reading() {
  return flight::sensors::create_quaternion_reading();
}

flight::Ref<flight::types::RotationRateReading> create_rotation_rate_reading() {
  return flight::sensors::create_rotation_rate_reading();
}

flight::Ref<flight::types::Sensors> create_sensors() {
  return flight::sensors::create_sensors();
}

void detach_sensors(flight::Ref<flight::types::Sensors> sensors) {
  flight::sensors::detach_sensors(sensors);
}

void dispose_sensors(flight::Ref<flight::types::Sensors> sensors) {
  flight::sensors::dispose_sensors(sensors);
}

} // namespace flight_hx::sensors
