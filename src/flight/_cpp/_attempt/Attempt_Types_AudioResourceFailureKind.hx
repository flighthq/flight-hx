// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_AudioResourceFailureKind extends AttemptConfig {
  @:native("flight::types::audio_resource_failure_kind")
  public static var AudioResourceFailureKind:{ Error:String, Unavailable:String };
}
#end
