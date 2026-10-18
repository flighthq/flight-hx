// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/power/contract.hpp>
#include <flight_hx/power.hpp>

namespace flight_hx::power {

double get_power_idle_polling_interval_ms() {
  return flight::power::get_power_idle_polling_interval_ms();
}

void set_power_idle_polling_interval_ms(double intervalMs) {
  flight::power::set_power_idle_polling_interval_ms(intervalMs);
}

} // namespace flight_hx::power
