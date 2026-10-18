// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_endInputStateFrame extends AttemptConfig {
  @:native("flight::input::end_input_state_frame")
  public static function endInputStateFrame(state:flight.InputState):Void;
}
#end
