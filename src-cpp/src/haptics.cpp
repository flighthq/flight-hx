// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/haptics/contract.hpp>
#include <flight_hx/haptics.hpp>

namespace flight_hx::haptics {

bool cancel_device_vibration(flight::Ref<flight::types::HostHapticsCapability> hostHaptics) {
  return flight::haptics::cancel_device_vibration(hostHaptics);
}

flight::Ref<flight::types::HapticsCapabilities> get_haptics_capabilities(flight::Ref<flight::types::HostHapticsCapability> hostHaptics, flight::Ref<flight::types::HapticsCapabilities> out) {
  return flight::haptics::get_haptics_capabilities(hostHaptics, out);
}

bool is_haptics_supported(flight::Ref<flight::types::HostHapticsCapability> hostHaptics) {
  return flight::haptics::is_haptics_supported(hostHaptics);
}

void prepare_haptics(flight::Ref<flight::types::HostHapticsCapability> hostHaptics) {
  flight::haptics::prepare_haptics(hostHaptics);
}

bool trigger_haptic_selection(flight::Ref<flight::types::HostHapticsCapability> hostHaptics) {
  return flight::haptics::trigger_haptic_selection(hostHaptics);
}

bool vibrate_device(flight::Ref<flight::types::HostHapticsCapability> hostHaptics, double durationMs) {
  return flight::haptics::vibrate_device(hostHaptics, durationMs);
}

} // namespace flight_hx::haptics
