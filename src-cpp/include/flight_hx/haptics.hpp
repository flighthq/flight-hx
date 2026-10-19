// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::haptics {

bool cancel_device_vibration(flight::Ref<flight::types::HostHapticsCapability> hostHaptics);
flight::Ref<flight::types::HapticsCapabilities> get_haptics_capabilities(flight::Ref<flight::types::HostHapticsCapability> hostHaptics, flight::Ref<flight::types::HapticsCapabilities> out);
bool is_haptics_supported(flight::Ref<flight::types::HostHapticsCapability> hostHaptics);
void prepare_haptics(flight::Ref<flight::types::HostHapticsCapability> hostHaptics);
bool trigger_haptic_selection(flight::Ref<flight::types::HostHapticsCapability> hostHaptics);
bool vibrate_device(flight::Ref<flight::types::HostHapticsCapability> hostHaptics, double durationMs);

} // namespace flight_hx::haptics
