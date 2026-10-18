// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_wasInputKeyPressed extends AttemptConfig {
  @:native("flight::input::was_input_key_pressed")
  public static function wasInputKeyPressed(state:flight.InputState, keyCode:Float):Bool;
}
#end
