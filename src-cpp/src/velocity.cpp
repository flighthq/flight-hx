// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/velocity/contract.hpp>
#include <flight_hx/velocity.hpp>

namespace flight_hx::velocity {

void begin_velocity_frame(flight::Ref<flight::types::VelocityField> field) {
  flight::velocity::begin_velocity_frame(field);
}

flight::Ref<flight::types::VelocityField> create_velocity_field() {
  return flight::velocity::create_velocity_field();
}

flight::Ref<flight::types::Velocity2D> add_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> a, flight::Ref<flight::types::Velocity2D> b) {
  return flight::velocity::add_velocity(out, a, b);
}

flight::Ref<flight::types::Velocity2D> clamp_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> velocity, double maxLength) {
  return flight::velocity::clamp_velocity(out, velocity, maxLength);
}

flight::Ref<flight::types::Velocity2D> copy_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> source) {
  return flight::velocity::copy_velocity(out, source);
}

flight::Ref<flight::types::Velocity2D> damp_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> current, flight::Ref<flight::types::Velocity2D> previous, double factor) {
  return flight::velocity::damp_velocity(out, current, previous, factor);
}

flight::Ref<flight::types::Velocity2D> get_velocity_sample_at(flight::Ref<flight::types::VelocitySample> sample, flight::Ref<flight::types::Matrix> currentWorldTransform, double pointX, double pointY, flight::Ref<flight::types::Velocity2D> out) {
  return flight::velocity::get_velocity_sample_at(sample, currentWorldTransform, pointX, pointY, out);
}

bool is_velocity_zero(flight::Ref<flight::types::Velocity2D> velocity, bool epsilonPresent, double epsilon) {
  return flight::velocity::is_velocity_zero(velocity, (epsilonPresent ? std::optional<double>{epsilon} : std::nullopt));
}

double length_of_velocity(flight::Ref<flight::types::Velocity2D> velocity) {
  return flight::velocity::length_of_velocity(velocity);
}

flight::Ref<flight::types::Velocity2D> lerp_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> a, flight::Ref<flight::types::Velocity2D> b, double t) {
  return flight::velocity::lerp_velocity(out, a, b, t);
}

flight::Ref<flight::types::Velocity2D> normalize_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> source) {
  return flight::velocity::normalize_velocity(out, source);
}

flight::Ref<flight::types::Velocity2D> scale_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> velocity, double scale) {
  return flight::velocity::scale_velocity(out, velocity, scale);
}

flight::Ref<flight::types::Velocity2D> subtract_velocity(flight::Ref<flight::types::Velocity2D> out, flight::Ref<flight::types::Velocity2D> a, flight::Ref<flight::types::Velocity2D> b) {
  return flight::velocity::subtract_velocity(out, a, b);
}

flight::Ref<flight::types::Velocity2D> zero_velocity(flight::Ref<flight::types::Velocity2D> out) {
  return flight::velocity::zero_velocity(out);
}

} // namespace flight_hx::velocity
