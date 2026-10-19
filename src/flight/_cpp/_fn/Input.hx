// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._fn;

#if cpp
import flight.*;
@:buildXml('
<error value="flight_cpp_root must name the pinned or installed flight-cpp root" unless="flight_cpp_root" />
<error value="flight_hx_root must name the flight-hx package root" unless="flight_hx_root" />
<set name="NO_PRECOMPILED_HEADERS" value="1" />
<set name="HXCPP_NO_CPP11" value="1" />
<unset name="HXCPP_CPP11" />
<files id="haxe">
  <file name="${removeQuotes:flight_hx_root}/src-cpp/src/input.cpp" />
  <compilerflag value="/std:c++20" if="windows" />
  <compilerflag value="-std=c++20" unless="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/overrides/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_cpp_root}/generated/include" if="windows" />
  <compilerflag value="/I${removeQuotes:flight_hx_root}/src-cpp/include" if="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/overrides/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_cpp_root}/generated/include" unless="windows" />
  <compilerflag value="-I${removeQuotes:flight_hx_root}/src-cpp/include" unless="windows" />
</files>
')
@:include("flight_hx/input.hpp")
extern class Input {
  @:native("flight_hx::input::apply_gamepad_axis_dead_zone")
  static function applyGamepadAxisDeadZone(value:Float, deadZone:Float):Float;

  @:native("flight_hx::input::create_input_manager")
  static function createInputManager():flight.InputManager;

  @:native("flight_hx::input::create_input_signals")
  static function createInputSignals():flight.InputSignals;

  @:native("flight_hx::input::create_input_state")
  static function createInputState():flight.InputState;

  @:native("flight_hx::input::end_input_state_frame")
  static function endInputStateFrame(state:flight.InputState):Void;

  @:native("flight_hx::input::get_input_gamepad_axis")
  static function getInputGamepadAxis(state:flight.InputState, gamepad:Float, axis:Float):Float;

  @:native("flight_hx::input::is_input_gamepad_button_down")
  static function isInputGamepadButtonDown(state:flight.InputState, gamepad:Float, button:Float):Bool;

  @:native("flight_hx::input::is_input_key_down")
  static function isInputKeyDown(state:flight.InputState, keyCode:Float):Bool;

  @:native("flight_hx::input::is_input_pointer_button_down")
  static function isInputPointerButtonDown(state:flight.InputState, pointerId:Float, button:Float):Bool;

  @:native("flight_hx::input::was_input_gamepad_button_pressed")
  static function wasInputGamepadButtonPressed(state:flight.InputState, gamepad:Float, button:Float):Bool;

  @:native("flight_hx::input::was_input_gamepad_button_released")
  static function wasInputGamepadButtonReleased(state:flight.InputState, gamepad:Float, button:Float):Bool;

  @:native("flight_hx::input::was_input_key_pressed")
  static function wasInputKeyPressed(state:flight.InputState, keyCode:Float):Bool;

  @:native("flight_hx::input::was_input_key_released")
  static function wasInputKeyReleased(state:flight.InputState, keyCode:Float):Bool;
}
#end
