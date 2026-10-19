// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::platform {

flight::Ref<flight::types::PlatformInfo> create_platform_info();
flight::Ref<flight::types::PlatformInfo> get_platform_info(flight::Ref<flight::types::HostPlatformCapability> hostPlatform, flight::Ref<flight::types::PlatformInfo> out);
bool is_platform_desktop(flight::Ref<flight::types::HostPlatformCapability> hostPlatform);
bool is_platform_mobile(flight::Ref<flight::types::HostPlatformCapability> hostPlatform);
bool is_platform_native(flight::Ref<flight::types::HostPlatformCapability> hostPlatform);
bool is_platform_touch(flight::Ref<flight::types::HostPlatformCapability> hostPlatform);
bool is_platform_version_at_least(flight::Ref<flight::types::HostPlatformCapability> hostPlatform, ::String minimum);
bool is_platform_web(flight::Ref<flight::types::HostPlatformCapability> hostPlatform);

} // namespace flight_hx::platform
