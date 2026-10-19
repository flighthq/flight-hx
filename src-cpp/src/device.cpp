// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/device/contract.hpp>
#include <flight_hx/device.hpp>

namespace flight_hx::device {

flight::Ref<flight::types::DeviceCapabilities> create_device_capabilities() {
  return flight::device::create_device_capabilities();
}

flight::Ref<flight::types::DeviceDisplayMetrics> create_device_display_metrics() {
  return flight::device::create_device_display_metrics();
}

flight::Ref<flight::types::DeviceInfo> create_device_info() {
  return flight::device::create_device_info();
}

flight::Ref<flight::types::SafeAreaInsets> create_safe_area_insets() {
  return flight::device::create_safe_area_insets();
}

} // namespace flight_hx::device
