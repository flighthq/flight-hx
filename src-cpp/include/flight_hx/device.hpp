// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::device {

flight::Ref<flight::types::DeviceCapabilities> create_device_capabilities();
flight::Ref<flight::types::DeviceDisplayMetrics> create_device_display_metrics();
flight::Ref<flight::types::DeviceInfo> create_device_info();
flight::Ref<flight::types::SafeAreaInsets> create_safe_area_insets();
flight::Ref<flight::types::DeviceCapabilities> get_device_capabilities(flight::Ref<flight::types::HostDeviceCapability> hostDevice, flight::Ref<flight::types::DeviceCapabilities> out);
flight::Ref<flight::types::DeviceDisplayMetrics> get_device_display_metrics(flight::Ref<flight::types::HostDeviceCapability> hostDevice, flight::Ref<flight::types::DeviceDisplayMetrics> out);
::String get_device_id(flight::Ref<flight::types::HostDeviceCapability> hostDevice);
flight::Ref<flight::types::DeviceInfo> get_device_info(flight::Ref<flight::types::HostDeviceCapability> hostDevice, flight::Ref<flight::types::DeviceInfo> out);
flight::Ref<flight::types::SafeAreaInsets> get_safe_area_insets(flight::Ref<flight::types::HostDeviceCapability> hostDevice, flight::Ref<flight::types::SafeAreaInsets> out);
void refresh_device_info(flight::Ref<flight::types::HostDeviceCapability> hostDevice);

} // namespace flight_hx::device
