// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/shape/shape_bounds_registry.hpp>
#include <flight/shape/shape_fill.hpp>
#include <flight_hx/shape.hpp>

namespace flight_hx::shape {

void clear_shape_bounds_commands() {
  flight::shape::clear_shape_bounds_commands();
}

double get_path_command_operand_count(double verb) {
  return flight::shape::get_path_command_operand_count(verb);
}

double get_shape_bounds_command_registry_revision() {
  return flight::shape::get_shape_bounds_command_registry_revision();
}

} // namespace flight_hx::shape
