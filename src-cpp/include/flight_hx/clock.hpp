// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::clock {

void add_clock_child(flight::Ref<flight::types::Clock> parent, flight::Ref<flight::types::Clock> child);
void advance_clock(flight::Ref<flight::types::Clock> clock, double deltaTime);
flight::Ref<flight::types::Clock> create_child_clock(flight::Ref<flight::types::Clock> parent, flight::Ref<flight::types::ClockOptions> options);
flight::Ref<flight::types::Clock> create_clock(flight::Ref<flight::types::ClockOptions> options);
void dispose_clock(flight::Ref<flight::types::Clock> clock);
double get_clock_effective_scale(flight::Ref<flight::types::Clock> clock);
flight_hx::Ref<flight::types::Clock> get_clock_parent(flight::Ref<flight::types::Clock> clock);
bool is_clock_effectively_paused(flight::Ref<flight::types::Clock> clock);
void pause_clock(flight::Ref<flight::types::Clock> clock);
void remove_clock_child(flight::Ref<flight::types::Clock> parent, flight::Ref<flight::types::Clock> child);
void reset_clock(flight::Ref<flight::types::Clock> clock);
void resume_clock(flight::Ref<flight::types::Clock> clock);
void set_clock_scale(flight::Ref<flight::types::Clock> clock, double scale);

} // namespace flight_hx::clock
