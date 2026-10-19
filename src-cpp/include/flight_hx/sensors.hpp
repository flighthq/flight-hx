// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::sensors {

void compute_euler_from_quaternion(flight::Ref<flight::types::OrientationReading> out, flight::Ref<flight::types::QuaternionReading> quaternion);
void compute_gravity_from_orientation(flight::Ref<flight::types::MotionReading> out, flight::Ref<flight::types::OrientationReading> orientation);
void compute_quaternion_from_orientation_reading(flight::Ref<flight::types::QuaternionReading> out, flight::Ref<flight::types::OrientationReading> orientation);
void compute_screen_relative_orientation(flight::Ref<flight::types::OrientationReading> out, flight::Ref<flight::types::OrientationReading> orientation, double screenAngle);
void compute_world_acceleration_from_device_acceleration(flight::Ref<flight::types::MotionReading> out, flight::Ref<flight::types::MotionReading> acceleration, flight::Ref<flight::types::QuaternionReading> quaternion);
flight::Ref<flight::types::AmbientLightReading> create_ambient_light_reading();
flight::Ref<flight::types::MotionReading> create_motion_reading();
flight::Ref<flight::types::OrientationReading> create_orientation_reading();
flight::Ref<flight::types::PressureReading> create_pressure_reading();
flight::Ref<flight::types::ProximityReading> create_proximity_reading();
flight::Ref<flight::types::QuaternionReading> create_quaternion_reading();
flight::Ref<flight::types::RotationRateReading> create_rotation_rate_reading();
flight::Ref<flight::types::Sensors> create_sensors();
void detach_sensors(flight::Ref<flight::types::Sensors> sensors);
void dispose_sensors(flight::Ref<flight::types::Sensors> sensors);

} // namespace flight_hx::sensors
