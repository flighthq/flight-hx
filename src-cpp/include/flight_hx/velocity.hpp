// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::velocity {

void begin_velocity_frame(flight::Ref<flight::types::VelocityField> field);
flight::Ref<flight::types::VelocityField> create_velocity_field();

} // namespace flight_hx::velocity
