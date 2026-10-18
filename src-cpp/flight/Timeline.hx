// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Timeline = flight._cpp.Timeline;

extern inline function addTimelineFrameScript(timeline:flight.Timeline, frame:Dynamic, script:flight.FrameScript):Void {
  flight._cpp._attempt.Attempt_Timeline_addTimelineFrameScript.addTimelineFrameScript(timeline, frame, script);
}

extern inline function clearTimelineFrameScripts(timeline:flight.Timeline):Void {
  flight._cpp._attempt.Attempt_Timeline_clearTimelineFrameScripts.clearTimelineFrameScripts(timeline);
}

extern inline function createTimeline(?obj:Dynamic):flight.Timeline {
  return flight._cpp._attempt.Attempt_Timeline_createTimeline.createTimeline(obj);
}

extern inline function createTimelineSource(obj:{ ?totalFrames:Float, ?frameRate:Null<Float>, ?labels:Array<flight.TimelineLabel>, ?cues:Array<flight.TimelineCue>, ?constructFrame:(flight.Node2D, Float)->Void }):flight.TimelineSource {
  return flight._cpp._attempt.Attempt_Timeline_createTimelineSource.createTimelineSource(obj);
}

extern inline function disposeTimelineSignals(timeline:flight.Timeline):Void {
  flight._cpp._attempt.Attempt_Timeline_disposeTimelineSignals.disposeTimelineSignals(timeline);
}

extern inline function enableTimelineSignals(timeline:flight.Timeline):flight.TimelineSignals {
  return flight._cpp._attempt.Attempt_Timeline_enableTimelineSignals.enableTimelineSignals(timeline);
}

extern inline function findTimelineLabel(timeline:flight.Timeline, name:String):Null<flight.TimelineLabel> {
  return flight._cpp._attempt.Attempt_Timeline_findTimelineLabel.findTimelineLabel(timeline, name);
}

extern inline function getTimelineCurrentLabel(timeline:flight.Timeline):Null<flight.TimelineLabel> {
  return flight._cpp._attempt.Attempt_Timeline_getTimelineCurrentLabel.getTimelineCurrentLabel(timeline);
}

extern inline function getTimelineFrameScript(timeline:flight.Timeline, frame:Dynamic):Null<flight.FrameScript> {
  return flight._cpp._attempt.Attempt_Timeline_getTimelineFrameScript.getTimelineFrameScript(timeline, frame);
}

extern inline function getTimelineFrameScriptFrames(timeline:flight.Timeline):Array<Float> {
  return flight._cpp._attempt.Attempt_Timeline_getTimelineFrameScriptFrames.getTimelineFrameScriptFrames(timeline);
}

extern inline function getTimelineLabels(timeline:flight.Timeline):Array<flight.TimelineLabel> {
  return flight._cpp._attempt.Attempt_Timeline_getTimelineLabels.getTimelineLabels(timeline);
}

extern inline function gotoAndPlayTimeline(timeline:flight.Timeline, frame:Dynamic):Void {
  flight._cpp._attempt.Attempt_Timeline_gotoAndPlayTimeline.gotoAndPlayTimeline(timeline, frame);
}

extern inline function gotoAndStopTimeline(timeline:flight.Timeline, frame:Dynamic):Void {
  flight._cpp._attempt.Attempt_Timeline_gotoAndStopTimeline.gotoAndStopTimeline(timeline, frame);
}

extern inline function initializeTimeline(out:flight.EntityConstruction<flight.Timeline>, ?obj:Dynamic):Void {
  flight._cpp._attempt.Attempt_Timeline_initializeTimeline.initializeTimeline(out, obj);
}

extern inline function initializeTimelineSource(out:flight.EntityConstruction<flight.TimelineSource>, obj:{ ?totalFrames:Float, ?frameRate:Null<Float>, ?labels:Array<flight.TimelineLabel>, ?cues:Array<flight.TimelineCue>, ?constructFrame:(flight.Node2D, Float)->Void }):Void {
  flight._cpp._attempt.Attempt_Timeline_initializeTimelineSource.initializeTimelineSource(out, obj);
}

extern inline function nextFrameTimeline(timeline:flight.Timeline):Void {
  flight._cpp._attempt.Attempt_Timeline_nextFrameTimeline.nextFrameTimeline(timeline);
}

extern inline function playTimeline(timeline:flight.Timeline):Void {
  flight._cpp._attempt.Attempt_Timeline_playTimeline.playTimeline(timeline);
}

extern inline function prevFrameTimeline(timeline:flight.Timeline):Void {
  flight._cpp._attempt.Attempt_Timeline_prevFrameTimeline.prevFrameTimeline(timeline);
}

extern inline function removeTimelineFrameScript(timeline:flight.Timeline, frame:Dynamic):Void {
  flight._cpp._attempt.Attempt_Timeline_removeTimelineFrameScript.removeTimelineFrameScript(timeline, frame);
}

extern inline function stopTimeline(timeline:flight.Timeline):Void {
  flight._cpp._attempt.Attempt_Timeline_stopTimeline.stopTimeline(timeline);
}

extern inline function updateTimeline(timeline:flight.Timeline, deltaTime:Float):Bool {
  return flight._cpp._attempt.Attempt_Timeline_updateTimeline.updateTimeline(timeline, deltaTime);
}
