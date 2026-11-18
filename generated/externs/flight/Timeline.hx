package flight;

#if hl

typedef Timeline = flight._hl.Timeline;

#elseif cpp

typedef Timeline = flight._cpp.Timeline;

#elseif (js && flight_esm)

typedef Timeline = flight._js.Timeline;

#elseif js

#error "flight.Timeline on js requires flight_esm."

#else

#error "flight.Timeline: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createTimeline(obj:Null<TimelineOptions>):Dynamic {
	return flight._js._fn.Timeline.createTimeline(obj);
}
#else
extern inline function createTimeline(obj:TimelineOptions):Dynamic {
#if hl
	return flight._hl._fn.Timeline.createTimeline(obj);
#elseif cpp
	return flight._cpp._fn.Timeline.createTimeline(obj);
#elseif (js && flight_esm)
	return flight._js._fn.Timeline.createTimeline(obj);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTimelineSource(obj:Null<TimelineSourceOptions>):TimelineSourceRef {
	return flight._js._fn.Timeline.createTimelineSource(obj);
}
#else
extern inline function createTimelineSource(obj:TimelineSourceOptions):TimelineSourceRef {
#if hl
	return flight._hl._fn.Timeline.createTimelineSource(obj);
#elseif cpp
	return flight._cpp._fn.Timeline.createTimelineSource(obj);
#elseif (js && flight_esm)
	return flight._js._fn.Timeline.createTimelineSource(obj);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addTimelineFrameScript(timeline:Dynamic, frame:TimelineFrameArg, script:FrameScript):Void {
	flight._js._fn.Timeline.addTimelineFrameScript(timeline, frame, script);
}
#else
extern inline function addTimelineFrameScript(timeline:Dynamic, frame:TimelineFrameArg, script:FrameScript):Void {
#if hl
	flight._hl._fn.Timeline.addTimelineFrameScript(timeline, frame, script);
#elseif cpp
	flight._cpp._fn.Timeline.addTimelineFrameScript(timeline, frame, script);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.addTimelineFrameScript(timeline, frame, script);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearTimelineFrameScripts(timeline:Dynamic):Void {
	flight._js._fn.Timeline.clearTimelineFrameScripts(timeline);
}
#else
extern inline function clearTimelineFrameScripts(timeline:Dynamic):Void {
#if hl
	flight._hl._fn.Timeline.clearTimelineFrameScripts(timeline);
#elseif cpp
	flight._cpp._fn.Timeline.clearTimelineFrameScripts(timeline);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.clearTimelineFrameScripts(timeline);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeTimelineSignals(timeline:Dynamic):Void {
	flight._js._fn.Timeline.disposeTimelineSignals(timeline);
}
#else
extern inline function disposeTimelineSignals(timeline:Dynamic):Void {
#if hl
	flight._hl._fn.Timeline.disposeTimelineSignals(timeline);
#elseif cpp
	flight._cpp._fn.Timeline.disposeTimelineSignals(timeline);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.disposeTimelineSignals(timeline);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableTimelineSignals(timeline:Dynamic):Dynamic {
	return flight._js._fn.Timeline.enableTimelineSignals(timeline);
}
#else
extern inline function enableTimelineSignals(timeline:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Timeline.enableTimelineSignals(timeline);
#elseif cpp
	return flight._cpp._fn.Timeline.enableTimelineSignals(timeline);
#elseif (js && flight_esm)
	return flight._js._fn.Timeline.enableTimelineSignals(timeline);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function findTimelineLabel(timeline:Dynamic, name:String):Null<TimelineLabel> {
	return flight._js._fn.Timeline.findTimelineLabel(timeline, name);
}
#else
extern inline function findTimelineLabel(timeline:Dynamic, name:String):TimelineLabel {
#if hl
	return flight._hl._fn.Timeline.findTimelineLabel(timeline, cast name);
#elseif cpp
	return flight._cpp._fn.Timeline.findTimelineLabel(timeline, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Timeline.findTimelineLabel(timeline, name);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTimelineCurrentLabel(timeline:Dynamic):Null<TimelineLabel> {
	return flight._js._fn.Timeline.getTimelineCurrentLabel(timeline);
}
#else
extern inline function getTimelineCurrentLabel(timeline:Dynamic):TimelineLabel {
#if hl
	return flight._hl._fn.Timeline.getTimelineCurrentLabel(timeline);
#elseif cpp
	return flight._cpp._fn.Timeline.getTimelineCurrentLabel(timeline);
#elseif (js && flight_esm)
	return flight._js._fn.Timeline.getTimelineCurrentLabel(timeline);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTimelineFrameScript(timeline:Dynamic, frame:TimelineFrameArg):Null<FrameScript> {
	return flight._js._fn.Timeline.getTimelineFrameScript(timeline, frame);
}
#else
extern inline function getTimelineFrameScript(timeline:Dynamic, frame:TimelineFrameArg):FrameScript {
#if hl
	return flight._hl._fn.Timeline.getTimelineFrameScript(timeline, frame);
#elseif cpp
	return flight._cpp._fn.Timeline.getTimelineFrameScript(timeline, frame);
#elseif (js && flight_esm)
	return flight._js._fn.Timeline.getTimelineFrameScript(timeline, frame);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTimelineFrameScriptFrames(out:Dynamic, timeline:Dynamic):Void {
	flight._js._fn.Timeline.getTimelineFrameScriptFrames(out, timeline);
}
#else
extern inline function getTimelineFrameScriptFrames(out:Dynamic, timeline:Dynamic):Void {
#if hl
	flight._hl._fn.Timeline.getTimelineFrameScriptFrames(out, timeline);
#elseif cpp
	flight._cpp._fn.Timeline.getTimelineFrameScriptFrames(out, timeline);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.getTimelineFrameScriptFrames(out, timeline);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function gotoAndPlayTimeline(timeline:Dynamic, frame:TimelineFrameArg):Void {
	flight._js._fn.Timeline.gotoAndPlayTimeline(timeline, frame);
}
#else
extern inline function gotoAndPlayTimeline(timeline:Dynamic, frame:TimelineFrameArg):Void {
#if hl
	flight._hl._fn.Timeline.gotoAndPlayTimeline(timeline, frame);
#elseif cpp
	flight._cpp._fn.Timeline.gotoAndPlayTimeline(timeline, frame);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.gotoAndPlayTimeline(timeline, frame);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function gotoAndStopTimeline(timeline:Dynamic, frame:TimelineFrameArg):Void {
	flight._js._fn.Timeline.gotoAndStopTimeline(timeline, frame);
}
#else
extern inline function gotoAndStopTimeline(timeline:Dynamic, frame:TimelineFrameArg):Void {
#if hl
	flight._hl._fn.Timeline.gotoAndStopTimeline(timeline, frame);
#elseif cpp
	flight._cpp._fn.Timeline.gotoAndStopTimeline(timeline, frame);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.gotoAndStopTimeline(timeline, frame);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function nextFrameTimeline(timeline:Dynamic):Void {
	flight._js._fn.Timeline.nextFrameTimeline(timeline);
}
#else
extern inline function nextFrameTimeline(timeline:Dynamic):Void {
#if hl
	flight._hl._fn.Timeline.nextFrameTimeline(timeline);
#elseif cpp
	flight._cpp._fn.Timeline.nextFrameTimeline(timeline);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.nextFrameTimeline(timeline);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function playTimeline(timeline:Dynamic):Void {
	flight._js._fn.Timeline.playTimeline(timeline);
}
#else
extern inline function playTimeline(timeline:Dynamic):Void {
#if hl
	flight._hl._fn.Timeline.playTimeline(timeline);
#elseif cpp
	flight._cpp._fn.Timeline.playTimeline(timeline);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.playTimeline(timeline);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function prevFrameTimeline(timeline:Dynamic):Void {
	flight._js._fn.Timeline.prevFrameTimeline(timeline);
}
#else
extern inline function prevFrameTimeline(timeline:Dynamic):Void {
#if hl
	flight._hl._fn.Timeline.prevFrameTimeline(timeline);
#elseif cpp
	flight._cpp._fn.Timeline.prevFrameTimeline(timeline);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.prevFrameTimeline(timeline);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removeTimelineFrameScript(timeline:Dynamic, frame:TimelineFrameArg):Void {
	flight._js._fn.Timeline.removeTimelineFrameScript(timeline, frame);
}
#else
extern inline function removeTimelineFrameScript(timeline:Dynamic, frame:TimelineFrameArg):Void {
#if hl
	flight._hl._fn.Timeline.removeTimelineFrameScript(timeline, frame);
#elseif cpp
	flight._cpp._fn.Timeline.removeTimelineFrameScript(timeline, frame);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.removeTimelineFrameScript(timeline, frame);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stopTimeline(timeline:Dynamic):Void {
	flight._js._fn.Timeline.stopTimeline(timeline);
}
#else
extern inline function stopTimeline(timeline:Dynamic):Void {
#if hl
	flight._hl._fn.Timeline.stopTimeline(timeline);
#elseif cpp
	flight._cpp._fn.Timeline.stopTimeline(timeline);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.stopTimeline(timeline);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateTimeline(timeline:Dynamic, deltaTime:Float):Bool {
	return flight._js._fn.Timeline.updateTimeline(timeline, deltaTime);
}
#else
extern inline function updateTimeline(timeline:Dynamic, deltaTime:Float):Bool {
#if hl
	return flight._hl._fn.Timeline.updateTimeline(timeline, deltaTime);
#elseif cpp
	return flight._cpp._fn.Timeline.updateTimeline(timeline, deltaTime);
#elseif (js && flight_esm)
	return flight._js._fn.Timeline.updateTimeline(timeline, deltaTime);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTimelineLabel(ptr:TimelineLabel):Void {
	flight._js._fn.Timeline.freeTimelineLabel(ptr);
}
#else
extern inline function freeTimelineLabel(ptr:TimelineLabel):Void {
#if hl
	flight._hl._fn.Timeline.freeTimelineLabel(ptr);
#elseif cpp
	flight._cpp._fn.Timeline.freeTimelineLabel(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.freeTimelineLabel(ptr);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFrameScript(ptr:FrameScript):Void {
	flight._js._fn.Timeline.freeFrameScript(ptr);
}
#else
extern inline function freeFrameScript(ptr:FrameScript):Void {
#if hl
	flight._hl._fn.Timeline.freeFrameScript(ptr);
#elseif cpp
	flight._cpp._fn.Timeline.freeFrameScript(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.freeFrameScript(ptr);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTimelineSourceRef(ptr:TimelineSourceRef):Void {
	flight._js._fn.Timeline.freeTimelineSourceRef(ptr);
}
#else
extern inline function freeTimelineSourceRef(ptr:TimelineSourceRef):Void {
#if hl
	flight._hl._fn.Timeline.freeTimelineSourceRef(ptr);
#elseif cpp
	flight._cpp._fn.Timeline.freeTimelineSourceRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Timeline.freeTimelineSourceRef(ptr);
#else
	#error "flight.Timeline: no backend for this target."
#end
}
#end
