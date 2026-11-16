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
