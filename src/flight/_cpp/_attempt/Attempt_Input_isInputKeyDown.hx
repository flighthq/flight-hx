// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_isInputKeyDown extends AttemptConfig {
  @:native("flight::input::is_input_key_down")
  public static function isInputKeyDown(state:flight.InputState, keyCode:Float):Bool;
}
#end
