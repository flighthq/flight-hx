// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/timeline/contract.hpp")
extern class Attempt_Timeline_initializeTimelineSource extends AttemptConfig {
  @:native("flight::timeline::initialize_timeline_source")
  public static function initializeTimelineSource(out:flight.EntityConstruction<flight.TimelineSource>, obj:{ ?totalFrames:Float, ?frameRate:Null<Float>, ?labels:Array<flight.TimelineLabel>, ?cues:Array<flight.TimelineCue>, ?constructFrame:(flight.Node2D, Float)->Void }):Void;
}
#end
