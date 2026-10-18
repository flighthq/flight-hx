// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_LayoutResolutionFailureKind extends AttemptConfig {
  @:native("flight::types::layout_resolution_failure_kind")
  public static var LayoutResolutionFailureKind:{ IntrinsicSizesTooSmall:String, InvalidContainerStyle:String, InvalidHierarchy:String, InvalidItemStyle:String, OutputTooSmall:String, UnregisteredKind:String };
}
#end
