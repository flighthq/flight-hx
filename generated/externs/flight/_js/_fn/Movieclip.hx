package flight._js._fn;

@:jsRequire("@flighthq/movieclip")
extern class Movieclip {
	@:native("areMovieClipGuardsEnabled")
	public static function areMovieClipGuardsEnabled(guards:flight._js.MovieClipGuardState):Bool;
	@:native("disableMovieClipGuards")
	public static function disableMovieClipGuards(guards:flight._js.MovieClipGuardState):Void;
	@:native("enableMovieClipGuards")
	public static function enableMovieClipGuards(guards:flight._js.MovieClipGuardState, logState:Dynamic, clock:Dynamic):Void;
	@:native("createMovieClip")
	public static function createMovieClip():Dynamic;
	@:native("createMovieClipData")
	public static function createMovieClipData():flight._js.MovieClipData;
	@:native("createMovieClipRuntime")
	public static function createMovieClipRuntime():flight._js.MovieClipRuntime;
	@:native("addMovieClipFrameScript")
	public static function addMovieClipFrameScript(clip:Dynamic, frame:flight._js.TimelineFrameArg, script:flight._js.FrameScript):Void;
	@:native("disposeMovieClipSignals")
	public static function disposeMovieClipSignals(clip:Dynamic):Void;
	@:native("enableMovieClipSignals")
	public static function enableMovieClipSignals(clip:Dynamic):flight._js.MovieClipSignals;
	@:native("getMovieClipCurrentFrame")
	public static function getMovieClipCurrentFrame(clip:Dynamic):Int;
	@:native("getMovieClipCurrentLabel")
	public static function getMovieClipCurrentLabel(clip:Dynamic):Null<flight._js.TimelineLabel>;
	@:native("getMovieClipFrameScript")
	public static function getMovieClipFrameScript(clip:Dynamic, frame:flight._js.TimelineFrameArg):Null<flight._js.FrameScript>;
	@:native("getMovieClipRuntime")
	public static function getMovieClipRuntime(source:flight._js.MovieClip):flight._js.MovieClipRuntime;
	@:native("getMovieClipSignals")
	public static function getMovieClipSignals(clip:Dynamic):Null<flight._js.MovieClipSignals>;
	@:native("getMovieClipTotalFrames")
	public static function getMovieClipTotalFrames(clip:Dynamic):Int;
	@:native("gotoAndPlayMovieClip")
	public static function gotoAndPlayMovieClip(clip:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("gotoAndStopMovieClip")
	public static function gotoAndStopMovieClip(clip:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("isMovieClipPlaying")
	public static function isMovieClipPlaying(clip:Dynamic):Bool;
	@:native("nextFrameMovieClip")
	public static function nextFrameMovieClip(clip:Dynamic):Void;
	@:native("playMovieClip")
	public static function playMovieClip(clip:Dynamic):Void;
	@:native("prevFrameMovieClip")
	public static function prevFrameMovieClip(clip:Dynamic):Void;
	@:native("removeMovieClipFrameScript")
	public static function removeMovieClipFrameScript(clip:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("setMovieClipSource")
	public static function setMovieClipSource(clip:Dynamic, source:flight._js.TimelineSourceRef):Void;
	@:native("stopMovieClip")
	public static function stopMovieClip(clip:Dynamic):Void;
	@:native("updateMovieClip")
	public static function updateMovieClip(clip:Dynamic, deltaTime:Float):Void;
	@:native("createSpritesheetTimelineSource")
	public static function createSpritesheetTimelineSource(guards:flight._js.MovieClipGuardState, spritesheet:Dynamic, animation:Dynamic):flight._js.TimelineSourceRef;
	@:native("explainSpritesheetTimelineSource")
	public static function explainSpritesheetTimelineSource(animation:Dynamic):flight._js.SpritesheetTimelineSourceExplanation;
	@:native("getSpritesheetTimelineSourceUnsupportedFieldString")
	public static function getSpritesheetTimelineSourceUnsupportedFieldString(value:Dynamic):String;
	@:native("parseSpritesheetTimelineSourceUnsupportedField")
	public static function parseSpritesheetTimelineSourceUnsupportedField(value:String):Null<Dynamic>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMovieClipData(ptr:flight._js.MovieClipData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMovieClipRuntime(ptr:flight._js.MovieClipRuntime):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMovieClipSignals(ptr:flight._js.MovieClipSignals):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTimelineLabel(ptr:flight._js.TimelineLabel):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFrameScript(ptr:flight._js.FrameScript):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTimelineSourceRef(ptr:flight._js.TimelineSourceRef):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpritesheetTimelineSourceExplanation(ptr:flight._js.SpritesheetTimelineSourceExplanation):Void {}
}
