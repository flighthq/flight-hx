// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::velocity {

void begin_velocity_frame(flight::Ref<flight::types::VelocityField> field);
flight::Ref<flight::types::VelocityField> create_velocity_field();
flight::Ref<flight::types::Velocity2D> add_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> a, flight::Ref<flight::types::Velocity2D> b);
flight::Ref<flight::types::Velocity2D> clamp_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> velocity, double maxLength);
flight::Ref<flight::types::Velocity2D> copy_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> source);
flight::Ref<flight::types::Velocity2D> damp_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> current, flight::Ref<flight::types::Velocity2D> previous, double factor);
flight::Ref<flight::types::Velocity2D> get_velocity_sample_at(flight::Ref<flight::types::VelocitySample> sample, flight::Ref<flight::types::Matrix> currentWorldTransform, double pointX, double pointY, flight::Ref<flight::types::Velocity2D> out);
bool is_velocity_zero(flight::Ref<flight::types::Velocity2D> velocity, bool epsilonPresent, double epsilon);
double length_of_velocity(flight::Ref<flight::types::Velocity2D> velocity);
flight::Ref<flight::types::Velocity2D> lerp_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> a, flight::Ref<flight::types::Velocity2D> b, double t);
flight::Ref<flight::types::Velocity2D> normalize_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> source);
flight::Ref<flight::types::Velocity2D> scale_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> velocity, double scale);
flight::Ref<flight::types::Velocity2D> subtract_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> a, flight::Ref<flight::types::Velocity2D> b);
flight::Ref<flight::types::Velocity2D> zero_velocity(flight::Ref<flight::types::Velocity2D> out);

} // namespace flight_hx::velocity
