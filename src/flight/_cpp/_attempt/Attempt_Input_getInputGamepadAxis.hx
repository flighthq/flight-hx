// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_getInputGamepadAxis extends AttemptConfig {
  @:native("flight::input::get_input_gamepad_axis")
  public static function getInputGamepadAxis(state:flight.InputState, gamepad:Float, axis:Float):Float;
}
#end
