// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_initializeInputKeyRepeatTimer extends AttemptConfig {
  @:native("flight::input::initialize_input_key_repeat_timer")
  public static function initializeInputKeyRepeatTimer(out:flight.EntityConstruction<flight.InputKeyRepeatTimer>, options:flight.InputKeyRepeatOptions):Void;
}
#end
