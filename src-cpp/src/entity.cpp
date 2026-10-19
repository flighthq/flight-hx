// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/entity/contract.hpp>
#include <flight_hx/entity.hpp>

namespace flight_hx::entity {

bool are_entity_runtime_guards_enabled() {
  return flight::entity::are_entity_runtime_guards_enabled();
}

flight::Ref<flight::types::EntityRuntime> create_entity_runtime() {
  return flight::entity::create_entity_runtime();
}

flight::Ref<flight::types::EntityRuntime> create_guarded_entity_runtime(flight::Ref<flight::types::EntityRuntime> runtime) {
  return flight::entity::create_guarded_entity_runtime(runtime);
}

void disable_entity_runtime_guards() {
  flight::entity::disable_entity_runtime_guards();
}

void set_entity_runtime_guard_mode(bool enabled) {
  flight::entity::set_entity_runtime_guard_mode(enabled);
}

void detach_entity_binding(flight::Ref<flight::types::Entity> entity) {
  flight::entity::detach_entity_binding(entity);
}

flight::Ref<flight::types::EntityRuntime> get_entity_runtime(flight::Ref<flight::types::Entity> source) {
  const auto result = flight::entity::get_entity_runtime(source);
  return result.shared_object();
}

::String get_entity_uid(flight::Ref<flight::types::Entity> source) {
  const auto result = flight::entity::get_entity_uid(source);
  const std::string result_utf8 = result.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

bool has_entity_binding(flight::Ref<flight::types::Entity> source) {
  return flight::entity::has_entity_binding(source);
}

bool has_entity_runtime(flight::Ref<flight::types::Entity> source) {
  return flight::entity::has_entity_runtime(source);
}

void set_entity_uid(flight::Ref<flight::types::Entity> source, ::String uid) {
  flight::entity::set_entity_uid(source, flight::String::from_utf8(uid.utf8_str()));
}

} // namespace flight_hx::entity
