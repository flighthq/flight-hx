// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <hxcpp.h>
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
void attach_screen_permission_change(flight::Ref<flight::types::HostScreenPermissionChangeCapability> hostScreenPermissionChange, flight::Ref<flight::types::ScreenPermissionChange> permissionChange);
void attach_screen_signals(flight::Ref<flight::types::HostScreenChangeCapability> hostScreenChange, flight::Ref<flight::types::ScreenSignals> signals);
flight::Ref<flight::types::ScreenInfo> get_primary_screen(flight::Ref<flight::types::HostScreenQueryCapability> hostScreenQuery, flight::Ref<flight::types::ScreenInfo> out);
flight_hx::Ref<flight::types::ScreenInfo> get_screen_by_id(flight::Ref<flight::types::HostScreenQueryCapability> hostScreenQuery, double id, flight::Ref<flight::types::ScreenInfo> out);
flight::Ref<flight::types::ScreenMode> get_screen_current_mode(flight::Ref<flight::types::ScreenInfo> screen, flight::Ref<flight::types::ScreenMode> out);
flight::Ref<flight::types::ScreenInfo> get_screen_cursor_screen(flight::Ref<flight::types::HostScreenQueryCapability> hostScreenQuery, flight::Ref<flight::types::ScreenInfo> out);
::Array<::Dynamic> get_screens(flight::Ref<flight::types::HostScreenQueryCapability> hostScreenQuery, ::Array<::Dynamic> out);

} // namespace flight_hx::screen
