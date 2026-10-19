// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::screen {

flight::Ref<flight::types::ScreenInfo> create_screen_info();
flight::Ref<flight::types::ScreenMode> create_screen_mode();
flight::Ref<flight::types::ScreenPermissionChange> create_screen_permission_change();
flight::Ref<flight::types::ScreenSignals> create_screen_signals();
void detach_screen_permission_change(flight::Ref<flight::types::ScreenPermissionChange> permissionChange);
void detach_screen_signals(flight::Ref<flight::types::ScreenSignals> signals);
void dispose_screen_permission_change(flight::Ref<flight::types::ScreenPermissionChange> permissionChange);
void dispose_screen_signals(flight::Ref<flight::types::ScreenSignals> signals);

} // namespace flight_hx::screen
