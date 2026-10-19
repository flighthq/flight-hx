// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <string>
#include <flight/platform/contract.hpp>
#include <flight_hx/platform.hpp>

namespace flight_hx::platform {

flight::Ref<flight::types::PlatformInfo> create_platform_info() {
  return flight::platform::create_platform_info();
}

flight::Ref<flight::types::PlatformInfo> get_platform_info(flight::Ref<flight::types::HostPlatformCapability> hostPlatform, flight::Ref<flight::types::PlatformInfo> out) {
  return flight::platform::get_platform_info(hostPlatform, out);
}

bool is_platform_desktop(flight::Ref<flight::types::HostPlatformCapability> hostPlatform) {
  return flight::platform::is_platform_desktop(hostPlatform);
}

bool is_platform_mobile(flight::Ref<flight::types::HostPlatformCapability> hostPlatform) {
  return flight::platform::is_platform_mobile(hostPlatform);
}

bool is_platform_native(flight::Ref<flight::types::HostPlatformCapability> hostPlatform) {
  return flight::platform::is_platform_native(hostPlatform);
}

bool is_platform_touch(flight::Ref<flight::types::HostPlatformCapability> hostPlatform) {
  return flight::platform::is_platform_touch(hostPlatform);
}

bool is_platform_version_at_least(flight::Ref<flight::types::HostPlatformCapability> hostPlatform, ::String minimum) {
  return flight::platform::is_platform_version_at_least(hostPlatform, flight::String::from_utf8(minimum.utf8_str()));
}

bool is_platform_web(flight::Ref<flight::types::HostPlatformCapability> hostPlatform) {
  return flight::platform::is_platform_web(hostPlatform);
}

} // namespace flight_hx::platform
