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

} // namespace flight_hx::velocity
