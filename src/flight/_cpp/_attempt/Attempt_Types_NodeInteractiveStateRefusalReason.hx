// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_NodeInteractiveStateRefusalReason extends AttemptConfig {
  @:native("flight::types::node_interactive_state_refusal_reason")
  public static var NodeInteractiveStateRefusalReason:{ ExtensionCreationFailed:String, ExtensionKindUnregistered:String, ExtensionTargetUnsupported:String, PropertyTargetUnsupported:String, TransitionCreationFailed:String, TransitionKindUnregistered:String };
}
#end
