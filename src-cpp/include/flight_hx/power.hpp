// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::power {

double get_power_idle_polling_interval_ms();
void set_power_idle_polling_interval_ms(double intervalMs);
flight::Ref<flight::types::Power> create_power();
void detach_power(flight::Ref<flight::types::Power> power);
void dispose_power(flight::Ref<flight::types::Power> power);
void enable_power_signals(flight::Ref<flight::types::Power> power);
flight::Ref<flight::types::PowerBatteryHealth> make_power_battery_health();
flight::Ref<flight::types::PowerStatus> make_power_status();

} // namespace flight_hx::power
