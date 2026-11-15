package flight._js._fn;

@:jsRequire("flight")
extern class Timeline {
	@:native("flight_create_timeline")
	public static function createTimeline(obj:flight._js.TimelineOptions):Dynamic;
	@:native("flight_create_timeline_source")
	public static function createTimelineSource(obj:flight._js.TimelineSourceOptions):flight._js.TimelineSourceRef;
	@:native("flight_add_timeline_frame_script")
	public static function addTimelineFrameScript(timeline:Dynamic, frame:flight._js.TimelineFrameArg, script:flight._js.FrameScript):Void;
	@:native("flight_clear_timeline_frame_scripts")
	public static function clearTimelineFrameScripts(timeline:Dynamic):Void;
	@:native("flight_dispose_timeline_signals")
	public static function disposeTimelineSignals(timeline:Dynamic):Void;
	@:native("flight_enable_timeline_signals")
	public static function enableTimelineSignals(timeline:Dynamic):Dynamic;
	@:native("flight_find_timeline_label")
	public static function findTimelineLabel(timeline:Dynamic, name:String):Dynamic;
	@:native("flight_get_timeline_current_label")
	public static function getTimelineCurrentLabel(timeline:Dynamic):Dynamic;
	@:native("flight_get_timeline_frame_script")
	public static function getTimelineFrameScript(timeline:Dynamic, frame:flight._js.TimelineFrameArg):Dynamic;
	@:native("flight_get_timeline_frame_script_frames")
	public static function getTimelineFrameScriptFrames(out:Dynamic, timeline:Dynamic):Void;
	@:native("flight_goto_and_play_timeline")
	public static function gotoAndPlayTimeline(timeline:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("flight_goto_and_stop_timeline")
	public static function gotoAndStopTimeline(timeline:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("flight_next_frame_timeline")
	public static function nextFrameTimeline(timeline:Dynamic):Void;
	@:native("flight_play_timeline")
	public static function playTimeline(timeline:Dynamic):Void;
	@:native("flight_prev_frame_timeline")
	public static function prevFrameTimeline(timeline:Dynamic):Void;
	@:native("flight_remove_timeline_frame_script")
	public static function removeTimelineFrameScript(timeline:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("flight_stop_timeline")
	public static function stopTimeline(timeline:Dynamic):Void;
	@:native("flight_update_timeline")
	public static function updateTimeline(timeline:Dynamic, deltaTime:Float):Bool;
}
