// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_createInputState extends AttemptConfig {
  @:native("flight::input::create_input_state")
  public static function createInputState():flight.InputState;
}
#end
