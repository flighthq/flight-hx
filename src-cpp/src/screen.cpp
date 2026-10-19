// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <flight/screen/contract.hpp>
#include <flight_hx/screen.hpp>

namespace flight_hx::screen {

namespace {

template <typename T>
flight::Array<flight::Ref<T>> to_flight_reference_array(const ::Array<::Dynamic>& source) {
  flight::Array<flight::Ref<T>> result;
  for (int index = 0; index < source->length; ++index) {
    const ::Dynamic value = source[index];
    result.push(value.GetPtr() ? static_cast<flight::Ref<T>>(value.StaticCast<flight_hx::Ref<T>>()) : flight::Ref<T>{});
  }
  return result;
}

template <typename T>
::Array<::Dynamic> to_haxe_reference_array(const flight::Array<flight::Ref<T>>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight reference Array exceeds the hxcpp Array length limit");
  }
  ::Array<::Dynamic> result = ::Array_obj<::Dynamic>::__new(static_cast<int>(source.size()));
  int index = 0;
  for (const flight::Ref<T>& value : source) result[index++] = flight_hx::Ref<T>(value);
  return result;
}

template <typename T>
void replace_haxe_reference_array(::Array<::Dynamic> destination, const flight::Array<flight::Ref<T>>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight reference Array exceeds the hxcpp Array length limit");
  }
  destination->resize(static_cast<int>(source.size()));
  int index = 0;
  for (const flight::Ref<T>& value : source) destination[index++] = flight_hx::Ref<T>(value);
}

} // namespace

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

void attach_screen_permission_change(flight::Ref<flight::types::HostScreenPermissionChangeCapability> hostScreenPermissionChange, flight::Ref<flight::types::ScreenPermissionChange> permissionChange) {
  flight::screen::attach_screen_permission_change(hostScreenPermissionChange, permissionChange);
}

void attach_screen_signals(flight::Ref<flight::types::HostScreenChangeCapability> hostScreenChange, flight::Ref<flight::types::ScreenSignals> signals) {
  flight::screen::attach_screen_signals(hostScreenChange, signals);
}

flight::Ref<flight::types::ScreenInfo> get_primary_screen(flight::Ref<flight::types::HostScreenQueryCapability> hostScreenQuery, flight::Ref<flight::types::ScreenInfo> out) {
  return flight::screen::get_primary_screen(hostScreenQuery, out);
}

flight_hx::Ref<flight::types::ScreenInfo> get_screen_by_id(flight::Ref<flight::types::HostScreenQueryCapability> hostScreenQuery, double id, flight::Ref<flight::types::ScreenInfo> out) {
  const auto result = flight::screen::get_screen_by_id(hostScreenQuery, id, out);
  return result.has_value() ? flight_hx::Ref<flight::types::ScreenInfo>{result.value()} : flight_hx::Ref<flight::types::ScreenInfo>{};
}

flight::Ref<flight::types::ScreenMode> get_screen_current_mode(flight::Ref<flight::types::ScreenInfo> screen, flight::Ref<flight::types::ScreenMode> out) {
  return flight::screen::get_screen_current_mode(screen, out);
}

flight::Ref<flight::types::ScreenInfo> get_screen_cursor_screen(flight::Ref<flight::types::HostScreenQueryCapability> hostScreenQuery, flight::Ref<flight::types::ScreenInfo> out) {
  return flight::screen::get_screen_cursor_screen(hostScreenQuery, out);
}

::Array<::Dynamic> get_screens(flight::Ref<flight::types::HostScreenQueryCapability> hostScreenQuery, ::Array<::Dynamic> out) {
  auto flight_out = to_flight_reference_array<flight::types::ScreenInfo>(out);
  const auto result = flight::screen::get_screens(hostScreenQuery, flight_out);
  replace_haxe_reference_array<flight::types::ScreenInfo>(out, flight_out);
  if (result.identity() == flight_out.identity()) return out;
  return to_haxe_reference_array<flight::types::ScreenInfo>(result);
}

} // namespace flight_hx::screen
