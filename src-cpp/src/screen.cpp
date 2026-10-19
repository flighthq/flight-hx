// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/screen/contract.hpp>
#include <flight_hx/screen.hpp>

namespace flight_hx::screen {

flight::Ref<flight::types::ScreenInfo> create_screen_info() {
  return flight::screen::create_screen_info();
}

flight::Ref<flight::types::ScreenMode> create_screen_mode() {
  return flight::screen::create_screen_mode();
}

flight::Ref<flight::types::ScreenPermissionChange> create_screen_permission_change() {
  return flight::screen::create_screen_permission_change();
}

flight::Ref<flight::types::ScreenSignals> create_screen_signals() {
  return flight::screen::create_screen_signals();
}

void detach_screen_permission_change(flight::Ref<flight::types::ScreenPermissionChange> permissionChange) {
  flight::screen::detach_screen_permission_change(permissionChange);
}

void detach_screen_signals(flight::Ref<flight::types::ScreenSignals> signals) {
  flight::screen::detach_screen_signals(signals);
}

void dispose_screen_permission_change(flight::Ref<flight::types::ScreenPermissionChange> permissionChange) {
  flight::screen::dispose_screen_permission_change(permissionChange);
}

void dispose_screen_signals(flight::Ref<flight::types::ScreenSignals> signals) {
  flight::screen::dispose_screen_signals(signals);
}

} // namespace flight_hx::screen
