// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/clock/contract.hpp>
#include <flight_hx/clock.hpp>

namespace flight_hx::clock {

void add_clock_child(flight::Ref<flight::types::Clock> parent, flight::Ref<flight::types::Clock> child) {
  flight::clock::add_clock_child(parent, child);
}

void advance_clock(flight::Ref<flight::types::Clock> clock, double deltaTime) {
  flight::clock::advance_clock(clock, deltaTime);
}

flight::Ref<flight::types::Clock> create_child_clock(flight::Ref<flight::types::Clock> parent, flight::Ref<flight::types::ClockOptions> options) {
  return flight::clock::create_child_clock(parent, (options ? std::optional<flight::Ref<flight::types::ClockOptions>>{options} : std::nullopt));
}

flight::Ref<flight::types::Clock> create_clock(flight::Ref<flight::types::ClockOptions> options) {
  return flight::clock::create_clock((options ? std::optional<flight::Ref<flight::types::ClockOptions>>{options} : std::nullopt));
}

void dispose_clock(flight::Ref<flight::types::Clock> clock) {
  flight::clock::dispose_clock(clock);
}

double get_clock_effective_scale(flight::Ref<flight::types::Clock> clock) {
  return flight::clock::get_clock_effective_scale(clock);
}

flight_hx::Ref<flight::types::Clock> get_clock_parent(flight::Ref<flight::types::Clock> clock) {
  const auto result = flight::clock::get_clock_parent(clock);
  return result.has_value() ? flight_hx::Ref<flight::types::Clock>{result.value()} : flight_hx::Ref<flight::types::Clock>{};
}

bool is_clock_effectively_paused(flight::Ref<flight::types::Clock> clock) {
  return flight::clock::is_clock_effectively_paused(clock);
}

void pause_clock(flight::Ref<flight::types::Clock> clock) {
  flight::clock::pause_clock(clock);
}

void remove_clock_child(flight::Ref<flight::types::Clock> parent, flight::Ref<flight::types::Clock> child) {
  flight::clock::remove_clock_child(parent, child);
}

void reset_clock(flight::Ref<flight::types::Clock> clock) {
  flight::clock::reset_clock(clock);
}

void resume_clock(flight::Ref<flight::types::Clock> clock) {
  flight::clock::resume_clock(clock);
}

void set_clock_scale(flight::Ref<flight::types::Clock> clock, double scale) {
  flight::clock::set_clock_scale(clock, scale);
}

} // namespace flight_hx::clock
