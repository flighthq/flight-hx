// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/types/contract.hpp")
extern class Attempt_Types_TimelineFrameEntryCause extends AttemptConfig {
  @:native("flight::types::timeline_frame_entry_cause")
  public static var TimelineFrameEntryCause:{ Advance:String, Seek:String };
}
#end
