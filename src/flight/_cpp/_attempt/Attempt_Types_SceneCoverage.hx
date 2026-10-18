// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_SceneCoverage extends AttemptConfig {
  @:native("flight::types::scene_coverage")
  public static var SceneCoverage:{ FallbackRemediable:String, FallbackUnavailable:String, Satisfied:String, Unavailable:String, Unregistered:String };
}
#end
