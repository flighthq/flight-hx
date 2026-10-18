// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_ImageResourceFailureKind extends AttemptConfig {
  @:native("flight::types::image_resource_failure_kind")
  public static var ImageResourceFailureKind:{ Error:String, Unavailable:String };
}
#end
