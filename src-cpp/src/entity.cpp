// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/entity/contract.hpp>
#include <flight_hx/entity.hpp>

namespace flight_hx::entity {

bool are_entity_runtime_guards_enabled() {
  return flight::entity::are_entity_runtime_guards_enabled();
}

void disable_entity_runtime_guards() {
  flight::entity::disable_entity_runtime_guards();
}

void set_entity_runtime_guard_mode(bool enabled) {
  flight::entity::set_entity_runtime_guard_mode(enabled);
}

} // namespace flight_hx::entity
