// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_ResourceResolutionState extends AttemptConfig {
  @:native("flight::types::resource_resolution_state")
  public static var ResourceResolutionState:{ Failed:String, Loading:String, Resolved:String, Unresolved:String };
}
#end
