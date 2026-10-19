// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::entity {

bool are_entity_runtime_guards_enabled();
flight::Ref<flight::types::EntityRuntime> create_entity_runtime();
flight::Ref<flight::types::EntityRuntime> create_guarded_entity_runtime(flight::Ref<flight::types::EntityRuntime> runtime);
void disable_entity_runtime_guards();
void set_entity_runtime_guard_mode(bool enabled);

} // namespace flight_hx::entity
