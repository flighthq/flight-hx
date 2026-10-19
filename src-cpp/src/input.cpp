// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <flight/input/contract.hpp>
#include <flight_hx/input.hpp>

namespace flight_hx::input {

double apply_gamepad_axis_dead_zone(double value, double deadZone) {
  return flight::input::apply_gamepad_axis_dead_zone(value, deadZone);
}

flight::Ref<flight::types::InputManager> create_input_manager() {
  return flight::input::create_input_manager();
}

flight::Ref<flight::types::InputSignals> create_input_signals() {
  return flight::input::create_input_signals();
}

flight::Ref<flight::types::InputState> create_input_state() {
  return flight::input::create_input_state();
}

void end_input_state_frame(flight::Ref<flight::types::InputState> state) {
  flight::input::end_input_state_frame(state);
}

double get_input_gamepad_axis(flight::Ref<flight::types::InputState> state, double gamepad, double axis) {
  return flight::input::get_input_gamepad_axis(state, gamepad, axis);
}

bool is_input_gamepad_button_down(flight::Ref<flight::types::InputState> state, double gamepad, double button) {
  return flight::input::is_input_gamepad_button_down(state, gamepad, button);
}

bool is_input_key_down(flight::Ref<flight::types::InputState> state, double keyCode) {
  return flight::input::is_input_key_down(state, keyCode);
}

bool is_input_pointer_button_down(flight::Ref<flight::types::InputState> state, double pointerId, double button) {
  return flight::input::is_input_pointer_button_down(state, pointerId, button);
}

bool was_input_gamepad_button_pressed(flight::Ref<flight::types::InputState> state, double gamepad, double button) {
  return flight::input::was_input_gamepad_button_pressed(state, gamepad, button);
}

bool was_input_gamepad_button_released(flight::Ref<flight::types::InputState> state, double gamepad, double button) {
  return flight::input::was_input_gamepad_button_released(state, gamepad, button);
}

bool was_input_key_pressed(flight::Ref<flight::types::InputState> state, double keyCode) {
  return flight::input::was_input_key_pressed(state, keyCode);
}

bool was_input_key_released(flight::Ref<flight::types::InputState> state, double keyCode) {
  return flight::input::was_input_key_released(state, keyCode);
}

} // namespace flight_hx::input
