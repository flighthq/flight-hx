// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_detachRelativePointerInput extends AttemptConfig {
  @:native("flight::input::detach_relative_pointer_input")
  public static function detachRelativePointerInput(manager:flight.InputManager, source:flight.InputIngressSource):Void;
}
#end
