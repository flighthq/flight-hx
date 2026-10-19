// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::keyboard {

void detach_soft_keyboard(flight::Ref<flight::types::SoftKeyboard> keyboard);
void dispose_soft_keyboard(flight::Ref<flight::types::SoftKeyboard> keyboard);
double get_soft_keyboard_height(flight::Ref<flight::types::HostSoftKeyboardInfoCapability> hostSoftKeyboardInfo);
flight::Ref<flight::types::SoftKeyboardInfo> get_soft_keyboard_info(flight::Ref<flight::types::HostSoftKeyboardInfoCapability> hostSoftKeyboardInfo, flight::Ref<flight::types::SoftKeyboardInfo> out);
bool is_soft_keyboard_visible(flight::Ref<flight::types::HostSoftKeyboardInfoCapability> hostSoftKeyboardInfo);

} // namespace flight_hx::keyboard
