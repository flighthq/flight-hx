// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
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

flight::Ref<flight::types::DeviceCapabilities> get_device_capabilities(flight::Ref<flight::types::HostDeviceCapability> hostDevice, flight::Ref<flight::types::DeviceCapabilities> out) {
  return flight::device::get_device_capabilities(hostDevice, out);
}

flight::Ref<flight::types::DeviceDisplayMetrics> get_device_display_metrics(flight::Ref<flight::types::HostDeviceCapability> hostDevice, flight::Ref<flight::types::DeviceDisplayMetrics> out) {
  return flight::device::get_device_display_metrics(hostDevice, out);
}

::String get_device_id(flight::Ref<flight::types::HostDeviceCapability> hostDevice) {
  const auto result = flight::device::get_device_id(hostDevice);
  const std::string result_utf8 = result.to_utf8();
  if (result_utf8.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight String exceeds the hxcpp String length limit");
  }
  return ::String::create(result_utf8.data(), static_cast<int>(result_utf8.size()));
}

flight::Ref<flight::types::DeviceInfo> get_device_info(flight::Ref<flight::types::HostDeviceCapability> hostDevice, flight::Ref<flight::types::DeviceInfo> out) {
  return flight::device::get_device_info(hostDevice, out);
}

flight::Ref<flight::types::SafeAreaInsets> get_safe_area_insets(flight::Ref<flight::types::HostDeviceCapability> hostDevice, flight::Ref<flight::types::SafeAreaInsets> out) {
  return flight::device::get_safe_area_insets(hostDevice, out);
}

void refresh_device_info(flight::Ref<flight::types::HostDeviceCapability> hostDevice) {
  flight::device::refresh_device_info(hostDevice);
}

} // namespace flight_hx::device
