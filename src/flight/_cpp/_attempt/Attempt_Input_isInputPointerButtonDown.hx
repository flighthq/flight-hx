// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_isInputPointerButtonDown extends AttemptConfig {
  @:native("flight::input::is_input_pointer_button_down")
  public static function isInputPointerButtonDown(state:flight.InputState, pointerId:Float, button:Float):Bool;
}
#end
