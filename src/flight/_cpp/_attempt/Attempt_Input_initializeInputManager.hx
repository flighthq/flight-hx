// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_initializeInputManager extends AttemptConfig {
  @:native("flight::input::initialize_input_manager")
  public static function initializeInputManager(out:flight.EntityConstruction<flight.InputManager>):Void;
}
#end
