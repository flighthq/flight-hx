// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/keyboard/contract.hpp>
#include <flight_hx/keyboard.hpp>

namespace flight_hx::keyboard {

void detach_soft_keyboard(flight::Ref<flight::types::SoftKeyboard> keyboard) {
  flight::keyboard::detach_soft_keyboard(keyboard);
}

void dispose_soft_keyboard(flight::Ref<flight::types::SoftKeyboard> keyboard) {
  flight::keyboard::dispose_soft_keyboard(keyboard);
}

double get_soft_keyboard_height(flight::Ref<flight::types::HostSoftKeyboardInfoCapability> hostSoftKeyboardInfo) {
  return flight::keyboard::get_soft_keyboard_height(hostSoftKeyboardInfo);
}

flight::Ref<flight::types::SoftKeyboardInfo> get_soft_keyboard_info(flight::Ref<flight::types::HostSoftKeyboardInfoCapability> hostSoftKeyboardInfo, flight::Ref<flight::types::SoftKeyboardInfo> out) {
  return flight::keyboard::get_soft_keyboard_info(hostSoftKeyboardInfo, out);
}

bool is_soft_keyboard_visible(flight::Ref<flight::types::HostSoftKeyboardInfoCapability> hostSoftKeyboardInfo) {
  return flight::keyboard::is_soft_keyboard_visible(hostSoftKeyboardInfo);
}

} // namespace flight_hx::keyboard
