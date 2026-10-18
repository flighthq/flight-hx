// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_createTimelineSource extends AttemptConfig {
  @:native("flight::timeline::create_timeline_source")
  public static function createTimelineSource(obj:{ ?totalFrames:Float, ?frameRate:Null<Float>, ?labels:Array<flight.TimelineLabel>, ?cues:Array<flight.TimelineCue>, ?constructFrame:(flight.Node2D, Float)->Void }):flight.TimelineSource;
}
#end
