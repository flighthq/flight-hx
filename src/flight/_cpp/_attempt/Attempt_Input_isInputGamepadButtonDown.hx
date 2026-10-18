// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_isInputGamepadButtonDown extends AttemptConfig {
  @:native("flight::input::is_input_gamepad_button_down")
  public static function isInputGamepadButtonDown(state:flight.InputState, gamepad:Float, button:Float):Bool;
}
#end
