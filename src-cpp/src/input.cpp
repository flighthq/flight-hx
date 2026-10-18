// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/input/contract.hpp>
#include <flight_hx/input.hpp>

namespace flight_hx::input {

double apply_gamepad_axis_dead_zone(double value, double deadZone) {
  return flight::input::apply_gamepad_axis_dead_zone(value, deadZone);
}

} // namespace flight_hx::input
