package flight;

#if hl

typedef MovieClip = flight._hl.MovieClip;

#elseif cpp

typedef MovieClip = flight._cpp.MovieClip;

#elseif (js && flight_esm)

typedef MovieClip = flight._js.MovieClip;

#elseif js

#error "flight.MovieClip on js requires flight_esm."

#else

#error "flight.MovieClip: no backend for this target."

#end

#if (js && flight_esm)
extern inline function areMovieClipGuardsEnabled(guards:MovieClipGuardState):Bool {
	return flight._js._fn.MovieClip.areMovieClipGuardsEnabled(guards);
}
#else
extern inline function areMovieClipGuardsEnabled(guards:MovieClipGuardState):Bool {
#if hl
	return flight._hl._fn.MovieClip.areMovieClipGuardsEnabled(guards);
#elseif cpp
	return flight._cpp._fn.MovieClip.areMovieClipGuardsEnabled(guards);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.areMovieClipGuardsEnabled(guards);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableMovieClipGuards(guards:MovieClipGuardState):Void {
	flight._js._fn.MovieClip.disableMovieClipGuards(guards);
}
#else
extern inline function disableMovieClipGuards(guards:MovieClipGuardState):Void {
#if hl
	flight._hl._fn.MovieClip.disableMovieClipGuards(guards);
#elseif cpp
	flight._cpp._fn.MovieClip.disableMovieClipGuards(guards);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.disableMovieClipGuards(guards);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableMovieClipGuards(guards:MovieClipGuardState, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.MovieClip.enableMovieClipGuards(guards, logState, clock);
}
#else
extern inline function enableMovieClipGuards(guards:MovieClipGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.MovieClip.enableMovieClipGuards(guards, logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.MovieClip.enableMovieClipGuards(guards, logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.enableMovieClipGuards(guards, logState, clockFn, clockCtx);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMovieClip():Dynamic {
	return flight._js._fn.MovieClip.createMovieClip();
}
#else
extern inline function createMovieClip():Dynamic {
#if hl
	return flight._hl._fn.MovieClip.createMovieClip();
#elseif cpp
	return flight._cpp._fn.MovieClip.createMovieClip();
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.createMovieClip();
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMovieClipData():MovieClipData {
	return flight._js._fn.MovieClip.createMovieClipData();
}
#else
extern inline function createMovieClipData():MovieClipData {
#if hl
	return flight._hl._fn.MovieClip.createMovieClipData();
#elseif cpp
	return flight._cpp._fn.MovieClip.createMovieClipData();
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.createMovieClipData();
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMovieClipRuntime():MovieClipRuntime {
	return flight._js._fn.MovieClip.createMovieClipRuntime();
}
#else
extern inline function createMovieClipRuntime():MovieClipRuntime {
#if hl
	return flight._hl._fn.MovieClip.createMovieClipRuntime();
#elseif cpp
	return flight._cpp._fn.MovieClip.createMovieClipRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.createMovieClipRuntime();
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addMovieClipFrameScript(clip:Dynamic, frame:TimelineFrameArg, script:FrameScript):Void {
	flight._js._fn.MovieClip.addMovieClipFrameScript(clip, frame, script);
}
#else
extern inline function addMovieClipFrameScript(clip:Dynamic, frame:TimelineFrameArg, script:FrameScript):Void {
#if hl
	flight._hl._fn.MovieClip.addMovieClipFrameScript(clip, frame, script);
#elseif cpp
	flight._cpp._fn.MovieClip.addMovieClipFrameScript(clip, frame, script);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.addMovieClipFrameScript(clip, frame, script);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeMovieClipSignals(clip:Dynamic):Void {
	flight._js._fn.MovieClip.disposeMovieClipSignals(clip);
}
#else
extern inline function disposeMovieClipSignals(clip:Dynamic):Void {
#if hl
	flight._hl._fn.MovieClip.disposeMovieClipSignals(clip);
#elseif cpp
	flight._cpp._fn.MovieClip.disposeMovieClipSignals(clip);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.disposeMovieClipSignals(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableMovieClipSignals(clip:Dynamic):MovieClipSignals {
	return flight._js._fn.MovieClip.enableMovieClipSignals(clip);
}
#else
extern inline function enableMovieClipSignals(clip:Dynamic):MovieClipSignals {
#if hl
	return flight._hl._fn.MovieClip.enableMovieClipSignals(clip);
#elseif cpp
	return flight._cpp._fn.MovieClip.enableMovieClipSignals(clip);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.enableMovieClipSignals(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMovieClipCurrentFrame(clip:Dynamic):Int {
	return flight._js._fn.MovieClip.getMovieClipCurrentFrame(clip);
}
#else
extern inline function getMovieClipCurrentFrame(clip:Dynamic):Int {
#if hl
	return flight._hl._fn.MovieClip.getMovieClipCurrentFrame(clip);
#elseif cpp
	return flight._cpp._fn.MovieClip.getMovieClipCurrentFrame(clip);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.getMovieClipCurrentFrame(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMovieClipCurrentLabel(clip:Dynamic):Null<TimelineLabel> {
	return flight._js._fn.MovieClip.getMovieClipCurrentLabel(clip);
}
#else
extern inline function getMovieClipCurrentLabel(clip:Dynamic):TimelineLabel {
#if hl
	return flight._hl._fn.MovieClip.getMovieClipCurrentLabel(clip);
#elseif cpp
	return flight._cpp._fn.MovieClip.getMovieClipCurrentLabel(clip);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.getMovieClipCurrentLabel(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMovieClipFrameScript(clip:Dynamic, frame:TimelineFrameArg):Null<FrameScript> {
	return flight._js._fn.MovieClip.getMovieClipFrameScript(clip, frame);
}
#else
extern inline function getMovieClipFrameScript(clip:Dynamic, frame:TimelineFrameArg):FrameScript {
#if hl
	return flight._hl._fn.MovieClip.getMovieClipFrameScript(clip, frame);
#elseif cpp
	return flight._cpp._fn.MovieClip.getMovieClipFrameScript(clip, frame);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.getMovieClipFrameScript(clip, frame);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMovieClipRuntime(source:MovieClip):MovieClipRuntime {
	return flight._js._fn.MovieClip.getMovieClipRuntime(source);
}
#else
extern inline function getMovieClipRuntime(source:MovieClip):MovieClipRuntime {
#if hl
	return flight._hl._fn.MovieClip.getMovieClipRuntime(source);
#elseif cpp
	return flight._cpp._fn.MovieClip.getMovieClipRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.getMovieClipRuntime(source);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMovieClipSignals(clip:Dynamic):Null<MovieClipSignals> {
	return flight._js._fn.MovieClip.getMovieClipSignals(clip);
}
#else
extern inline function getMovieClipSignals(clip:Dynamic):MovieClipSignals {
#if hl
	return flight._hl._fn.MovieClip.getMovieClipSignals(clip);
#elseif cpp
	return flight._cpp._fn.MovieClip.getMovieClipSignals(clip);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.getMovieClipSignals(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMovieClipTotalFrames(clip:Dynamic):Int {
	return flight._js._fn.MovieClip.getMovieClipTotalFrames(clip);
}
#else
extern inline function getMovieClipTotalFrames(clip:Dynamic):Int {
#if hl
	return flight._hl._fn.MovieClip.getMovieClipTotalFrames(clip);
#elseif cpp
	return flight._cpp._fn.MovieClip.getMovieClipTotalFrames(clip);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.getMovieClipTotalFrames(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function gotoAndPlayMovieClip(clip:Dynamic, frame:TimelineFrameArg):Void {
	flight._js._fn.MovieClip.gotoAndPlayMovieClip(clip, frame);
}
#else
extern inline function gotoAndPlayMovieClip(clip:Dynamic, frame:TimelineFrameArg):Void {
#if hl
	flight._hl._fn.MovieClip.gotoAndPlayMovieClip(clip, frame);
#elseif cpp
	flight._cpp._fn.MovieClip.gotoAndPlayMovieClip(clip, frame);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.gotoAndPlayMovieClip(clip, frame);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function gotoAndStopMovieClip(clip:Dynamic, frame:TimelineFrameArg):Void {
	flight._js._fn.MovieClip.gotoAndStopMovieClip(clip, frame);
}
#else
extern inline function gotoAndStopMovieClip(clip:Dynamic, frame:TimelineFrameArg):Void {
#if hl
	flight._hl._fn.MovieClip.gotoAndStopMovieClip(clip, frame);
#elseif cpp
	flight._cpp._fn.MovieClip.gotoAndStopMovieClip(clip, frame);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.gotoAndStopMovieClip(clip, frame);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isMovieClipPlaying(clip:Dynamic):Bool {
	return flight._js._fn.MovieClip.isMovieClipPlaying(clip);
}
#else
extern inline function isMovieClipPlaying(clip:Dynamic):Bool {
#if hl
	return flight._hl._fn.MovieClip.isMovieClipPlaying(clip);
#elseif cpp
	return flight._cpp._fn.MovieClip.isMovieClipPlaying(clip);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.isMovieClipPlaying(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function nextFrameMovieClip(clip:Dynamic):Void {
	flight._js._fn.MovieClip.nextFrameMovieClip(clip);
}
#else
extern inline function nextFrameMovieClip(clip:Dynamic):Void {
#if hl
	flight._hl._fn.MovieClip.nextFrameMovieClip(clip);
#elseif cpp
	flight._cpp._fn.MovieClip.nextFrameMovieClip(clip);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.nextFrameMovieClip(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function playMovieClip(clip:Dynamic):Void {
	flight._js._fn.MovieClip.playMovieClip(clip);
}
#else
extern inline function playMovieClip(clip:Dynamic):Void {
#if hl
	flight._hl._fn.MovieClip.playMovieClip(clip);
#elseif cpp
	flight._cpp._fn.MovieClip.playMovieClip(clip);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.playMovieClip(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function prevFrameMovieClip(clip:Dynamic):Void {
	flight._js._fn.MovieClip.prevFrameMovieClip(clip);
}
#else
extern inline function prevFrameMovieClip(clip:Dynamic):Void {
#if hl
	flight._hl._fn.MovieClip.prevFrameMovieClip(clip);
#elseif cpp
	flight._cpp._fn.MovieClip.prevFrameMovieClip(clip);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.prevFrameMovieClip(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removeMovieClipFrameScript(clip:Dynamic, frame:TimelineFrameArg):Void {
	flight._js._fn.MovieClip.removeMovieClipFrameScript(clip, frame);
}
#else
extern inline function removeMovieClipFrameScript(clip:Dynamic, frame:TimelineFrameArg):Void {
#if hl
	flight._hl._fn.MovieClip.removeMovieClipFrameScript(clip, frame);
#elseif cpp
	flight._cpp._fn.MovieClip.removeMovieClipFrameScript(clip, frame);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.removeMovieClipFrameScript(clip, frame);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setMovieClipSource(clip:Dynamic, source:TimelineSourceRef):Void {
	flight._js._fn.MovieClip.setMovieClipSource(clip, source);
}
#else
extern inline function setMovieClipSource(clip:Dynamic, source:TimelineSourceRef):Void {
#if hl
	flight._hl._fn.MovieClip.setMovieClipSource(clip, source);
#elseif cpp
	flight._cpp._fn.MovieClip.setMovieClipSource(clip, source);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.setMovieClipSource(clip, source);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stopMovieClip(clip:Dynamic):Void {
	flight._js._fn.MovieClip.stopMovieClip(clip);
}
#else
extern inline function stopMovieClip(clip:Dynamic):Void {
#if hl
	flight._hl._fn.MovieClip.stopMovieClip(clip);
#elseif cpp
	flight._cpp._fn.MovieClip.stopMovieClip(clip);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.stopMovieClip(clip);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateMovieClip(clip:Dynamic, deltaTime:Float):Void {
	flight._js._fn.MovieClip.updateMovieClip(clip, deltaTime);
}
#else
extern inline function updateMovieClip(clip:Dynamic, deltaTime:Float):Void {
#if hl
	flight._hl._fn.MovieClip.updateMovieClip(clip, deltaTime);
#elseif cpp
	flight._cpp._fn.MovieClip.updateMovieClip(clip, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.updateMovieClip(clip, deltaTime);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpritesheetTimelineSource(guards:MovieClipGuardState, spritesheet:Dynamic, animation:Dynamic):TimelineSourceRef {
	return flight._js._fn.MovieClip.createSpritesheetTimelineSource(guards, spritesheet, animation);
}
#else
extern inline function createSpritesheetTimelineSource(guards:MovieClipGuardState, spritesheet:Dynamic, animation:Dynamic):TimelineSourceRef {
#if hl
	return flight._hl._fn.MovieClip.createSpritesheetTimelineSource(guards, spritesheet, animation);
#elseif cpp
	return flight._cpp._fn.MovieClip.createSpritesheetTimelineSource(guards, spritesheet, animation);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.createSpritesheetTimelineSource(guards, spritesheet, animation);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainSpritesheetTimelineSource(animation:Dynamic):SpritesheetTimelineSourceExplanation {
	return flight._js._fn.MovieClip.explainSpritesheetTimelineSource(animation);
}
#else
extern inline function explainSpritesheetTimelineSource(animation:Dynamic):SpritesheetTimelineSourceExplanation {
#if hl
	return flight._hl._fn.MovieClip.explainSpritesheetTimelineSource(animation);
#elseif cpp
	return flight._cpp._fn.MovieClip.explainSpritesheetTimelineSource(animation);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.explainSpritesheetTimelineSource(animation);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSpritesheetTimelineSourceUnsupportedFieldString(value:Dynamic):String {
	return flight._js._fn.MovieClip.getSpritesheetTimelineSourceUnsupportedFieldString(value);
}
#else
extern inline function getSpritesheetTimelineSourceUnsupportedFieldString(value:flight.SpritesheetTimelineSourceUnsupportedField):String {
#if hl
	return cast flight._hl._fn.MovieClip.getSpritesheetTimelineSourceUnsupportedFieldString(value);
#elseif cpp
	return cast flight._cpp._fn.MovieClip.getSpritesheetTimelineSourceUnsupportedFieldString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.MovieClip.getSpritesheetTimelineSourceUnsupportedFieldString(value);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseSpritesheetTimelineSourceUnsupportedField(value:String):Null<Dynamic> {
	return flight._js._fn.MovieClip.parseSpritesheetTimelineSourceUnsupportedField(value);
}
#else
extern inline function parseSpritesheetTimelineSourceUnsupportedField(value:String):Int {
#if hl
	return flight._hl._fn.MovieClip.parseSpritesheetTimelineSourceUnsupportedField(cast value);
#elseif cpp
	return flight._cpp._fn.MovieClip.parseSpritesheetTimelineSourceUnsupportedField(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.MovieClip.parseSpritesheetTimelineSourceUnsupportedField(value);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMovieClipData(ptr:MovieClipData):Void {
	flight._js._fn.MovieClip.freeMovieClipData(ptr);
}
#else
extern inline function freeMovieClipData(ptr:MovieClipData):Void {
#if hl
	flight._hl._fn.MovieClip.freeMovieClipData(ptr);
#elseif cpp
	flight._cpp._fn.MovieClip.freeMovieClipData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.freeMovieClipData(ptr);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMovieClipRuntime(ptr:MovieClipRuntime):Void {
	flight._js._fn.MovieClip.freeMovieClipRuntime(ptr);
}
#else
extern inline function freeMovieClipRuntime(ptr:MovieClipRuntime):Void {
#if hl
	flight._hl._fn.MovieClip.freeMovieClipRuntime(ptr);
#elseif cpp
	flight._cpp._fn.MovieClip.freeMovieClipRuntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.freeMovieClipRuntime(ptr);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMovieClipSignals(ptr:MovieClipSignals):Void {
	flight._js._fn.MovieClip.freeMovieClipSignals(ptr);
}
#else
extern inline function freeMovieClipSignals(ptr:MovieClipSignals):Void {
#if hl
	flight._hl._fn.MovieClip.freeMovieClipSignals(ptr);
#elseif cpp
	flight._cpp._fn.MovieClip.freeMovieClipSignals(ptr);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.freeMovieClipSignals(ptr);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTimelineLabel(ptr:TimelineLabel):Void {
	flight._js._fn.MovieClip.freeTimelineLabel(ptr);
}
#else
extern inline function freeTimelineLabel(ptr:TimelineLabel):Void {
#if hl
	flight._hl._fn.MovieClip.freeTimelineLabel(ptr);
#elseif cpp
	flight._cpp._fn.MovieClip.freeTimelineLabel(ptr);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.freeTimelineLabel(ptr);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFrameScript(ptr:FrameScript):Void {
	flight._js._fn.MovieClip.freeFrameScript(ptr);
}
#else
extern inline function freeFrameScript(ptr:FrameScript):Void {
#if hl
	flight._hl._fn.MovieClip.freeFrameScript(ptr);
#elseif cpp
	flight._cpp._fn.MovieClip.freeFrameScript(ptr);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.freeFrameScript(ptr);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTimelineSourceRef(ptr:TimelineSourceRef):Void {
	flight._js._fn.MovieClip.freeTimelineSourceRef(ptr);
}
#else
extern inline function freeTimelineSourceRef(ptr:TimelineSourceRef):Void {
#if hl
	flight._hl._fn.MovieClip.freeTimelineSourceRef(ptr);
#elseif cpp
	flight._cpp._fn.MovieClip.freeTimelineSourceRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.freeTimelineSourceRef(ptr);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpritesheetTimelineSourceExplanation(ptr:SpritesheetTimelineSourceExplanation):Void {
	flight._js._fn.MovieClip.freeSpritesheetTimelineSourceExplanation(ptr);
}
#else
extern inline function freeSpritesheetTimelineSourceExplanation(ptr:SpritesheetTimelineSourceExplanation):Void {
#if hl
	flight._hl._fn.MovieClip.freeSpritesheetTimelineSourceExplanation(ptr);
#elseif cpp
	flight._cpp._fn.MovieClip.freeSpritesheetTimelineSourceExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.MovieClip.freeSpritesheetTimelineSourceExplanation(ptr);
#else
	#error "flight.MovieClip: no backend for this target."
#end
}
#end
