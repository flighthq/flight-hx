package flight._hl._fn;

extern class Timeline {
	@:hlNative("flight", "flight_create_timeline")
	public static function createTimeline(obj:flight._hl.TimelineOptions):hl.Bytes;
	@:hlNative("flight", "flight_create_timeline_source")
	public static function createTimelineSource(obj:flight._hl.TimelineSourceOptions):flight._hl.TimelineSourceRef;
	@:hlNative("flight", "flight_add_timeline_frame_script")
	public static function addTimelineFrameScript(timeline:hl.Bytes, frame:flight._hl.TimelineFrameArg, script:flight._hl.FrameScript):Void;
	@:hlNative("flight", "flight_clear_timeline_frame_scripts")
	public static function clearTimelineFrameScripts(timeline:hl.Bytes):Void;
	@:hlNative("flight", "flight_dispose_timeline_signals")
	public static function disposeTimelineSignals(timeline:hl.Bytes):Void;
	@:hlNative("flight", "flight_enable_timeline_signals")
	public static function enableTimelineSignals(timeline:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_find_timeline_label")
	public static function findTimelineLabel(timeline:hl.Bytes, name:hl.Bytes):flight._hl.TimelineLabel;
	@:hlNative("flight", "flight_get_timeline_current_label")
	public static function getTimelineCurrentLabel(timeline:hl.Bytes):flight._hl.TimelineLabel;
	@:hlNative("flight", "flight_get_timeline_frame_script")
	public static function getTimelineFrameScript(timeline:hl.Bytes, frame:flight._hl.TimelineFrameArg):flight._hl.FrameScript;
	@:hlNative("flight", "flight_get_timeline_frame_script_frames")
	public static function getTimelineFrameScriptFrames(out:hl.Bytes, timeline:hl.Bytes):Void;
	@:hlNative("flight", "flight_goto_and_play_timeline")
	public static function gotoAndPlayTimeline(timeline:hl.Bytes, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_goto_and_stop_timeline")
	public static function gotoAndStopTimeline(timeline:hl.Bytes, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_next_frame_timeline")
	public static function nextFrameTimeline(timeline:hl.Bytes):Void;
	@:hlNative("flight", "flight_play_timeline")
	public static function playTimeline(timeline:hl.Bytes):Void;
	@:hlNative("flight", "flight_prev_frame_timeline")
	public static function prevFrameTimeline(timeline:hl.Bytes):Void;
	@:hlNative("flight", "flight_remove_timeline_frame_script")
	public static function removeTimelineFrameScript(timeline:hl.Bytes, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_stop_timeline")
	public static function stopTimeline(timeline:hl.Bytes):Void;
	@:hlNative("flight", "flight_update_timeline")
	public static function updateTimeline(timeline:hl.Bytes, deltaTime:Float):Bool;
	@:hlNative("flight", "flight_free_timeline_label")
	public static function freeTimelineLabel(ptr:flight._hl.TimelineLabel):Void;
	@:hlNative("flight", "flight_free_frame_script")
	public static function freeFrameScript(ptr:flight._hl.FrameScript):Void;
	@:hlNative("flight", "flight_free_timeline_source_ref")
	public static function freeTimelineSourceRef(ptr:flight._hl.TimelineSourceRef):Void;
}
