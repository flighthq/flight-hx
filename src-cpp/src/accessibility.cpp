// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/accessibility/contract.hpp>
#include <flight_hx/accessibility.hpp>

namespace flight_hx::accessibility {

void destroy_accessibility(flight::Ref<flight::types::HostAccessibilityCapability> hostAccessibility) {
  flight::accessibility::destroy_accessibility(hostAccessibility);
}

} // namespace flight_hx::accessibility
