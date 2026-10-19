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

flight::Ref<flight::types::Power> create_power() {
  return flight::power::create_power();
}

void detach_power(flight::Ref<flight::types::Power> power) {
  flight::power::detach_power(power);
}

void dispose_power(flight::Ref<flight::types::Power> power) {
  flight::power::dispose_power(power);
}

void enable_power_signals(flight::Ref<flight::types::Power> power) {
  flight::power::enable_power_signals(power);
}

flight::Ref<flight::types::PowerBatteryHealth> make_power_battery_health() {
  return flight::power::make_power_battery_health();
}

flight::Ref<flight::types::PowerStatus> make_power_status() {
  return flight::power::make_power_status();
}

flight::Ref<flight::types::PowerBatteryHealth> get_power_battery_health(flight::Ref<flight::types::HostPowerBatteryHealthCapability> hostPowerBatteryHealth, flight::Ref<flight::types::PowerBatteryHealth> out) {
  return flight::power::get_power_battery_health(hostPowerBatteryHealth, out);
}

flight::Ref<flight::types::PowerStatus> get_power_status(flight::Ref<flight::types::HostPowerStatusCapability> hostPowerStatus, flight::Ref<flight::types::PowerStatus> out) {
  return flight::power::get_power_status(hostPowerStatus, out);
}

double get_power_system_idle_time(flight::Ref<flight::types::HostPowerIdleCapability> hostPowerIdle) {
  return flight::power::get_power_system_idle_time(hostPowerIdle);
}

bool is_power_keep_awake_active(flight::Ref<flight::types::HostPowerKeepAwakeCapability> hostPowerKeepAwake) {
  return flight::power::is_power_keep_awake_active(hostPowerKeepAwake);
}

} // namespace flight_hx::power
