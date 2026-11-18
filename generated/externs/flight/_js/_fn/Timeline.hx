package flight._js._fn;

@:jsRequire("@flighthq/timeline")
extern class Timeline {
	@:native("createTimeline")
	public static function createTimeline(obj:Null<flight._js.TimelineOptions>):Dynamic;
	@:native("createTimelineSource")
	public static function createTimelineSource(obj:Null<flight._js.TimelineSourceOptions>):flight._js.TimelineSourceRef;
	@:native("addTimelineFrameScript")
	public static function addTimelineFrameScript(timeline:Dynamic, frame:flight._js.TimelineFrameArg, script:flight._js.FrameScript):Void;
	@:native("clearTimelineFrameScripts")
	public static function clearTimelineFrameScripts(timeline:Dynamic):Void;
	@:native("disposeTimelineSignals")
	public static function disposeTimelineSignals(timeline:Dynamic):Void;
	@:native("enableTimelineSignals")
	public static function enableTimelineSignals(timeline:Dynamic):Dynamic;
	@:native("findTimelineLabel")
	public static function findTimelineLabel(timeline:Dynamic, name:String):Null<flight._js.TimelineLabel>;
	@:native("getTimelineCurrentLabel")
	public static function getTimelineCurrentLabel(timeline:Dynamic):Null<flight._js.TimelineLabel>;
	@:native("getTimelineFrameScript")
	public static function getTimelineFrameScript(timeline:Dynamic, frame:flight._js.TimelineFrameArg):Null<flight._js.FrameScript>;
	@:native("getTimelineFrameScriptFrames")
	public static function getTimelineFrameScriptFrames(out:Dynamic, timeline:Dynamic):Void;
	@:native("gotoAndPlayTimeline")
	public static function gotoAndPlayTimeline(timeline:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("gotoAndStopTimeline")
	public static function gotoAndStopTimeline(timeline:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("nextFrameTimeline")
	public static function nextFrameTimeline(timeline:Dynamic):Void;
	@:native("playTimeline")
	public static function playTimeline(timeline:Dynamic):Void;
	@:native("prevFrameTimeline")
	public static function prevFrameTimeline(timeline:Dynamic):Void;
	@:native("removeTimelineFrameScript")
	public static function removeTimelineFrameScript(timeline:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("stopTimeline")
	public static function stopTimeline(timeline:Dynamic):Void;
	@:native("updateTimeline")
	public static function updateTimeline(timeline:Dynamic, deltaTime:Float):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTimelineLabel(ptr:flight._js.TimelineLabel):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFrameScript(ptr:flight._js.FrameScript):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTimelineSourceRef(ptr:flight._js.TimelineSourceRef):Void {}
}
