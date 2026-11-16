package flight;

extern inline function areMovieClipGuardsEnabled(guards:MovieClipGuardState):Bool {
#if hl
	return flight._hl._fn.Movieclip.areMovieClipGuardsEnabled(guards);
#elseif cpp
	return flight._cpp._fn.Movieclip.areMovieClipGuardsEnabled(guards);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.areMovieClipGuardsEnabled(guards);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function disableMovieClipGuards(guards:MovieClipGuardState):Void {
#if hl
	flight._hl._fn.Movieclip.disableMovieClipGuards(guards);
#elseif cpp
	flight._cpp._fn.Movieclip.disableMovieClipGuards(guards);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.disableMovieClipGuards(guards);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function enableMovieClipGuards(guards:MovieClipGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Movieclip.enableMovieClipGuards(guards, logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.Movieclip.enableMovieClipGuards(guards, logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.enableMovieClipGuards(guards, logState, clockFn, clockCtx);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function createMovieClip():Dynamic {
#if hl
	return flight._hl._fn.Movieclip.createMovieClip();
#elseif cpp
	return flight._cpp._fn.Movieclip.createMovieClip();
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.createMovieClip();
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function createMovieClipData():MovieClipData {
#if hl
	return flight._hl._fn.Movieclip.createMovieClipData();
#elseif cpp
	return flight._cpp._fn.Movieclip.createMovieClipData();
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.createMovieClipData();
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function createMovieClipRuntime():MovieClipRuntime {
#if hl
	return flight._hl._fn.Movieclip.createMovieClipRuntime();
#elseif cpp
	return flight._cpp._fn.Movieclip.createMovieClipRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.createMovieClipRuntime();
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function addMovieClipFrameScript(clip:Dynamic, frame:TimelineFrameArg, script:FrameScript):Void {
#if hl
	flight._hl._fn.Movieclip.addMovieClipFrameScript(clip, frame, script);
#elseif cpp
	flight._cpp._fn.Movieclip.addMovieClipFrameScript(clip, frame, script);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.addMovieClipFrameScript(clip, frame, script);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function disposeMovieClipSignals(clip:Dynamic):Void {
#if hl
	flight._hl._fn.Movieclip.disposeMovieClipSignals(clip);
#elseif cpp
	flight._cpp._fn.Movieclip.disposeMovieClipSignals(clip);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.disposeMovieClipSignals(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function enableMovieClipSignals(clip:Dynamic):MovieClipSignals {
#if hl
	return flight._hl._fn.Movieclip.enableMovieClipSignals(clip);
#elseif cpp
	return flight._cpp._fn.Movieclip.enableMovieClipSignals(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.enableMovieClipSignals(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function getMovieClipCurrentFrame(clip:Dynamic):Int {
#if hl
	return flight._hl._fn.Movieclip.getMovieClipCurrentFrame(clip);
#elseif cpp
	return flight._cpp._fn.Movieclip.getMovieClipCurrentFrame(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.getMovieClipCurrentFrame(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function getMovieClipCurrentLabel(clip:Dynamic):TimelineLabel {
#if hl
	return flight._hl._fn.Movieclip.getMovieClipCurrentLabel(clip);
#elseif cpp
	return flight._cpp._fn.Movieclip.getMovieClipCurrentLabel(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.getMovieClipCurrentLabel(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function getMovieClipFrameScript(clip:Dynamic, frame:TimelineFrameArg):FrameScript {
#if hl
	return flight._hl._fn.Movieclip.getMovieClipFrameScript(clip, frame);
#elseif cpp
	return flight._cpp._fn.Movieclip.getMovieClipFrameScript(clip, frame);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.getMovieClipFrameScript(clip, frame);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function getMovieClipRuntime(source:MovieClip):MovieClipRuntime {
#if hl
	return flight._hl._fn.Movieclip.getMovieClipRuntime(source);
#elseif cpp
	return flight._cpp._fn.Movieclip.getMovieClipRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.getMovieClipRuntime(source);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function getMovieClipSignals(clip:Dynamic):MovieClipSignals {
#if hl
	return flight._hl._fn.Movieclip.getMovieClipSignals(clip);
#elseif cpp
	return flight._cpp._fn.Movieclip.getMovieClipSignals(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.getMovieClipSignals(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function getMovieClipTotalFrames(clip:Dynamic):Int {
#if hl
	return flight._hl._fn.Movieclip.getMovieClipTotalFrames(clip);
#elseif cpp
	return flight._cpp._fn.Movieclip.getMovieClipTotalFrames(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.getMovieClipTotalFrames(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function gotoAndPlayMovieClip(clip:Dynamic, frame:TimelineFrameArg):Void {
#if hl
	flight._hl._fn.Movieclip.gotoAndPlayMovieClip(clip, frame);
#elseif cpp
	flight._cpp._fn.Movieclip.gotoAndPlayMovieClip(clip, frame);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.gotoAndPlayMovieClip(clip, frame);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function gotoAndStopMovieClip(clip:Dynamic, frame:TimelineFrameArg):Void {
#if hl
	flight._hl._fn.Movieclip.gotoAndStopMovieClip(clip, frame);
#elseif cpp
	flight._cpp._fn.Movieclip.gotoAndStopMovieClip(clip, frame);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.gotoAndStopMovieClip(clip, frame);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function isMovieClipPlaying(clip:Dynamic):Bool {
#if hl
	return flight._hl._fn.Movieclip.isMovieClipPlaying(clip);
#elseif cpp
	return flight._cpp._fn.Movieclip.isMovieClipPlaying(clip);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.isMovieClipPlaying(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function nextFrameMovieClip(clip:Dynamic):Void {
#if hl
	flight._hl._fn.Movieclip.nextFrameMovieClip(clip);
#elseif cpp
	flight._cpp._fn.Movieclip.nextFrameMovieClip(clip);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.nextFrameMovieClip(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function playMovieClip(clip:Dynamic):Void {
#if hl
	flight._hl._fn.Movieclip.playMovieClip(clip);
#elseif cpp
	flight._cpp._fn.Movieclip.playMovieClip(clip);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.playMovieClip(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function prevFrameMovieClip(clip:Dynamic):Void {
#if hl
	flight._hl._fn.Movieclip.prevFrameMovieClip(clip);
#elseif cpp
	flight._cpp._fn.Movieclip.prevFrameMovieClip(clip);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.prevFrameMovieClip(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function removeMovieClipFrameScript(clip:Dynamic, frame:TimelineFrameArg):Void {
#if hl
	flight._hl._fn.Movieclip.removeMovieClipFrameScript(clip, frame);
#elseif cpp
	flight._cpp._fn.Movieclip.removeMovieClipFrameScript(clip, frame);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.removeMovieClipFrameScript(clip, frame);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function setMovieClipSource(clip:Dynamic, source:TimelineSourceRef):Void {
#if hl
	flight._hl._fn.Movieclip.setMovieClipSource(clip, source);
#elseif cpp
	flight._cpp._fn.Movieclip.setMovieClipSource(clip, source);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.setMovieClipSource(clip, source);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function stopMovieClip(clip:Dynamic):Void {
#if hl
	flight._hl._fn.Movieclip.stopMovieClip(clip);
#elseif cpp
	flight._cpp._fn.Movieclip.stopMovieClip(clip);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.stopMovieClip(clip);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function updateMovieClip(clip:Dynamic, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Movieclip.updateMovieClip(clip, deltaTime);
#elseif cpp
	flight._cpp._fn.Movieclip.updateMovieClip(clip, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.updateMovieClip(clip, deltaTime);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function createSpritesheetTimelineSource(guards:MovieClipGuardState, spritesheet:Dynamic, animation:Dynamic):TimelineSourceRef {
#if hl
	return flight._hl._fn.Movieclip.createSpritesheetTimelineSource(guards, spritesheet, animation);
#elseif cpp
	return flight._cpp._fn.Movieclip.createSpritesheetTimelineSource(guards, spritesheet, animation);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.createSpritesheetTimelineSource(guards, spritesheet, animation);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function explainSpritesheetTimelineSource(animation:Dynamic):SpritesheetTimelineSourceExplanation {
#if hl
	return flight._hl._fn.Movieclip.explainSpritesheetTimelineSource(animation);
#elseif cpp
	return flight._cpp._fn.Movieclip.explainSpritesheetTimelineSource(animation);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.explainSpritesheetTimelineSource(animation);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function getSpritesheetTimelineSourceUnsupportedFieldString(value:flight.SpritesheetTimelineSourceUnsupportedField):String {
#if hl
	return cast flight._hl._fn.Movieclip.getSpritesheetTimelineSourceUnsupportedFieldString(value);
#elseif cpp
	return cast flight._cpp._fn.Movieclip.getSpritesheetTimelineSourceUnsupportedFieldString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Movieclip.getSpritesheetTimelineSourceUnsupportedFieldString(value);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function parseSpritesheetTimelineSourceUnsupportedField(value:String):Int {
#if hl
	return flight._hl._fn.Movieclip.parseSpritesheetTimelineSourceUnsupportedField(cast value);
#elseif cpp
	return flight._cpp._fn.Movieclip.parseSpritesheetTimelineSourceUnsupportedField(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Movieclip.parseSpritesheetTimelineSourceUnsupportedField(value);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function freeMovieClipData(ptr:MovieClipData):Void {
#if hl
	flight._hl._fn.Movieclip.freeMovieClipData(ptr);
#elseif cpp
	flight._cpp._fn.Movieclip.freeMovieClipData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.freeMovieClipData(ptr);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function freeMovieClipRuntime(ptr:MovieClipRuntime):Void {
#if hl
	flight._hl._fn.Movieclip.freeMovieClipRuntime(ptr);
#elseif cpp
	flight._cpp._fn.Movieclip.freeMovieClipRuntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.freeMovieClipRuntime(ptr);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function freeMovieClipSignals(ptr:MovieClipSignals):Void {
#if hl
	flight._hl._fn.Movieclip.freeMovieClipSignals(ptr);
#elseif cpp
	flight._cpp._fn.Movieclip.freeMovieClipSignals(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.freeMovieClipSignals(ptr);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function freeTimelineLabel(ptr:TimelineLabel):Void {
#if hl
	flight._hl._fn.Movieclip.freeTimelineLabel(ptr);
#elseif cpp
	flight._cpp._fn.Movieclip.freeTimelineLabel(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.freeTimelineLabel(ptr);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function freeFrameScript(ptr:FrameScript):Void {
#if hl
	flight._hl._fn.Movieclip.freeFrameScript(ptr);
#elseif cpp
	flight._cpp._fn.Movieclip.freeFrameScript(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.freeFrameScript(ptr);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function freeTimelineSourceRef(ptr:TimelineSourceRef):Void {
#if hl
	flight._hl._fn.Movieclip.freeTimelineSourceRef(ptr);
#elseif cpp
	flight._cpp._fn.Movieclip.freeTimelineSourceRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.freeTimelineSourceRef(ptr);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
extern inline function freeSpritesheetTimelineSourceExplanation(ptr:SpritesheetTimelineSourceExplanation):Void {
#if hl
	flight._hl._fn.Movieclip.freeSpritesheetTimelineSourceExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Movieclip.freeSpritesheetTimelineSourceExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Movieclip.freeSpritesheetTimelineSourceExplanation(ptr);
#else
	#error "flight.Movieclip: no backend for this target."
#end
}
