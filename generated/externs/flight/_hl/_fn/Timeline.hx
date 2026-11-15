package flight._hl._fn;

extern class Timeline {
	@:hlNative("flight", "flight_create_timeline")
	public static function createTimeline(obj:flight._hl.TimelineOptions):Dynamic;
	@:hlNative("flight", "flight_create_timeline_source")
	public static function createTimelineSource(obj:flight._hl.TimelineSourceOptions):flight._hl.TimelineSourceRef;
	@:hlNative("flight", "flight_add_timeline_frame_script")
	public static function addTimelineFrameScript(timeline:Dynamic, frame:flight._hl.TimelineFrameArg, script:flight._hl.FrameScript):Void;
	@:hlNative("flight", "flight_clear_timeline_frame_scripts")
	public static function clearTimelineFrameScripts(timeline:Dynamic):Void;
	@:hlNative("flight", "flight_dispose_timeline_signals")
	public static function disposeTimelineSignals(timeline:Dynamic):Void;
	@:hlNative("flight", "flight_enable_timeline_signals")
	public static function enableTimelineSignals(timeline:Dynamic):Dynamic;
	@:hlNative("flight", "flight_find_timeline_label")
	public static function findTimelineLabel(timeline:Dynamic, name:hl.Bytes):Dynamic;
	@:hlNative("flight", "flight_get_timeline_current_label")
	public static function getTimelineCurrentLabel(timeline:Dynamic):Dynamic;
	@:hlNative("flight", "flight_get_timeline_frame_script")
	public static function getTimelineFrameScript(timeline:Dynamic, frame:flight._hl.TimelineFrameArg):Dynamic;
	@:hlNative("flight", "flight_get_timeline_frame_script_frames")
	public static function getTimelineFrameScriptFrames(out:Dynamic, timeline:Dynamic):Void;
	@:hlNative("flight", "flight_goto_and_play_timeline")
	public static function gotoAndPlayTimeline(timeline:Dynamic, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_goto_and_stop_timeline")
	public static function gotoAndStopTimeline(timeline:Dynamic, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_next_frame_timeline")
	public static function nextFrameTimeline(timeline:Dynamic):Void;
	@:hlNative("flight", "flight_play_timeline")
	public static function playTimeline(timeline:Dynamic):Void;
	@:hlNative("flight", "flight_prev_frame_timeline")
	public static function prevFrameTimeline(timeline:Dynamic):Void;
	@:hlNative("flight", "flight_remove_timeline_frame_script")
	public static function removeTimelineFrameScript(timeline:Dynamic, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_stop_timeline")
	public static function stopTimeline(timeline:Dynamic):Void;
	@:hlNative("flight", "flight_update_timeline")
	public static function updateTimeline(timeline:Dynamic, deltaTime:Float):Bool;
}
