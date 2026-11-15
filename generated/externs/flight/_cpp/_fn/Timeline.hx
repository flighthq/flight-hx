package flight._cpp._fn;

extern class Timeline {
	@:native("flight_create_timeline")
	public static function createTimeline(obj:flight._cpp.TimelineOptions):cpp.Star<cpp.Void>;
	@:native("flight_create_timeline_source")
	public static function createTimelineSource(obj:flight._cpp.TimelineSourceOptions):flight._cpp.TimelineSourceRef;
	@:native("flight_add_timeline_frame_script")
	public static function addTimelineFrameScript(timeline:cpp.Star<cpp.Void>, frame:flight._cpp.TimelineFrameArg, script:flight._cpp.FrameScript):Void;
	@:native("flight_clear_timeline_frame_scripts")
	public static function clearTimelineFrameScripts(timeline:cpp.Star<cpp.Void>):Void;
	@:native("flight_dispose_timeline_signals")
	public static function disposeTimelineSignals(timeline:cpp.Star<cpp.Void>):Void;
	@:native("flight_enable_timeline_signals")
	public static function enableTimelineSignals(timeline:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_find_timeline_label")
	public static function findTimelineLabel(timeline:cpp.Star<cpp.Void>, name:cpp.ConstCharStar):flight._cpp.TimelineLabel;
	@:native("flight_get_timeline_current_label")
	public static function getTimelineCurrentLabel(timeline:cpp.Star<cpp.Void>):flight._cpp.TimelineLabel;
	@:native("flight_get_timeline_frame_script")
	public static function getTimelineFrameScript(timeline:cpp.Star<cpp.Void>, frame:flight._cpp.TimelineFrameArg):flight._cpp.FrameScript;
	@:native("flight_get_timeline_frame_script_frames")
	public static function getTimelineFrameScriptFrames(out:cpp.Star<cpp.Void>, timeline:cpp.Star<cpp.Void>):Void;
	@:native("flight_goto_and_play_timeline")
	public static function gotoAndPlayTimeline(timeline:cpp.Star<cpp.Void>, frame:flight._cpp.TimelineFrameArg):Void;
	@:native("flight_goto_and_stop_timeline")
	public static function gotoAndStopTimeline(timeline:cpp.Star<cpp.Void>, frame:flight._cpp.TimelineFrameArg):Void;
	@:native("flight_next_frame_timeline")
	public static function nextFrameTimeline(timeline:cpp.Star<cpp.Void>):Void;
	@:native("flight_play_timeline")
	public static function playTimeline(timeline:cpp.Star<cpp.Void>):Void;
	@:native("flight_prev_frame_timeline")
	public static function prevFrameTimeline(timeline:cpp.Star<cpp.Void>):Void;
	@:native("flight_remove_timeline_frame_script")
	public static function removeTimelineFrameScript(timeline:cpp.Star<cpp.Void>, frame:flight._cpp.TimelineFrameArg):Void;
	@:native("flight_stop_timeline")
	public static function stopTimeline(timeline:cpp.Star<cpp.Void>):Void;
	@:native("flight_update_timeline")
	public static function updateTimeline(timeline:cpp.Star<cpp.Void>, deltaTime:Float):Bool;
}
