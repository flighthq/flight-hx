// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_detachPointerInput extends AttemptConfig {
  @:native("flight::input::detach_pointer_input")
  public static function detachPointerInput(manager:flight.InputManager, source:flight.InputIngressSource):Void;
}
#end
