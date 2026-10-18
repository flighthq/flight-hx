// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_connectInputStateToInputManager extends AttemptConfig {
  @:native("flight::input::connect_input_state_to_input_manager")
  public static function connectInputStateToInputManager(state:flight.InputState, manager:flight.InputManager):()->Void;
}
#end
