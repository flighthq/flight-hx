// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/input/contract.hpp")
extern class Attempt_Input_attachPointerInput extends AttemptConfig {
  @:native("flight::input::attach_pointer_input")
  public static function attachPointerInput(hostInputIngress:flight.HostInputIngressCapability, manager:flight.InputManager, source:flight.InputIngressSource, ?options:flight.AttachInputOptions):Void;
}
#end
