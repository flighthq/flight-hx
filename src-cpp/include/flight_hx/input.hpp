// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#pragma once
#include <flight_hx/types/reference_fwd.hpp>

// Declaration-only boundary: no flight::* type enters hxcpp-generated namespace flight.
namespace flight_hx::input {

double apply_gamepad_axis_dead_zone(double value, double deadZone);
flight::Ref<flight::types::InputManager> create_input_manager();
flight::Ref<flight::types::InputSignals> create_input_signals();
flight::Ref<flight::types::InputState> create_input_state();
void end_input_state_frame(flight::Ref<flight::types::InputState> state);
double get_input_gamepad_axis(flight::Ref<flight::types::InputState> state, double gamepad, double axis);
bool is_input_gamepad_button_down(flight::Ref<flight::types::InputState> state, double gamepad, double button);
bool is_input_key_down(flight::Ref<flight::types::InputState> state, double keyCode);
bool is_input_pointer_button_down(flight::Ref<flight::types::InputState> state, double pointerId, double button);
bool was_input_gamepad_button_pressed(flight::Ref<flight::types::InputState> state, double gamepad, double button);
bool was_input_gamepad_button_released(flight::Ref<flight::types::InputState> state, double gamepad, double button);
bool was_input_key_pressed(flight::Ref<flight::types::InputState> state, double keyCode);
bool was_input_key_released(flight::Ref<flight::types::InputState> state, double keyCode);

} // namespace flight_hx::input
