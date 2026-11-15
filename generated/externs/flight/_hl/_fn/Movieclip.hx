package flight._hl._fn;

extern class Movieclip {
	@:hlNative("flight", "flight_are_movie_clip_guards_enabled")
	public static function areMovieClipGuardsEnabled(guards:flight._hl.MovieClipGuardState):Bool;
	@:hlNative("flight", "flight_disable_movie_clip_guards")
	public static function disableMovieClipGuards(guards:flight._hl.MovieClipGuardState):Void;
	@:hlNative("flight", "flight_enable_movie_clip_guards")
	public static function enableMovieClipGuards(guards:flight._hl.MovieClipGuardState, logState:Dynamic, clock:flight._hl.MovieClipGuardClock):Void;
	@:hlNative("flight", "flight_create_movie_clip")
	public static function createMovieClip():Dynamic;
	@:hlNative("flight", "flight_create_movie_clip_data")
	public static function createMovieClipData():flight._hl.MovieClipData;
	@:hlNative("flight", "flight_create_movie_clip_runtime")
	public static function createMovieClipRuntime():flight._hl.MovieClipRuntime;
	@:hlNative("flight", "flight_add_movie_clip_frame_script")
	public static function addMovieClipFrameScript(clip:Dynamic, frame:flight._hl.TimelineFrameArg, script:flight._hl.FrameScript):Void;
	@:hlNative("flight", "flight_dispose_movie_clip_signals")
	public static function disposeMovieClipSignals(clip:Dynamic):Void;
	@:hlNative("flight", "flight_enable_movie_clip_signals")
	public static function enableMovieClipSignals(clip:Dynamic):flight._hl.MovieClipSignals;
	@:hlNative("flight", "flight_get_movie_clip_current_frame")
	public static function getMovieClipCurrentFrame(clip:Dynamic):Int;
	@:hlNative("flight", "flight_get_movie_clip_current_label")
	public static function getMovieClipCurrentLabel(clip:Dynamic):Dynamic;
	@:hlNative("flight", "flight_get_movie_clip_frame_script")
	public static function getMovieClipFrameScript(clip:Dynamic, frame:flight._hl.TimelineFrameArg):Dynamic;
	@:hlNative("flight", "flight_get_movie_clip_runtime")
	public static function getMovieClipRuntime(source:flight._hl.MovieClip):flight._hl.MovieClipRuntime;
	@:hlNative("flight", "flight_get_movie_clip_signals")
	public static function getMovieClipSignals(clip:Dynamic):Dynamic;
	@:hlNative("flight", "flight_get_movie_clip_total_frames")
	public static function getMovieClipTotalFrames(clip:Dynamic):Int;
	@:hlNative("flight", "flight_goto_and_play_movie_clip")
	public static function gotoAndPlayMovieClip(clip:Dynamic, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_goto_and_stop_movie_clip")
	public static function gotoAndStopMovieClip(clip:Dynamic, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_is_movie_clip_playing")
	public static function isMovieClipPlaying(clip:Dynamic):Bool;
	@:hlNative("flight", "flight_next_frame_movie_clip")
	public static function nextFrameMovieClip(clip:Dynamic):Void;
	@:hlNative("flight", "flight_play_movie_clip")
	public static function playMovieClip(clip:Dynamic):Void;
	@:hlNative("flight", "flight_prev_frame_movie_clip")
	public static function prevFrameMovieClip(clip:Dynamic):Void;
	@:hlNative("flight", "flight_remove_movie_clip_frame_script")
	public static function removeMovieClipFrameScript(clip:Dynamic, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_set_movie_clip_source")
	public static function setMovieClipSource(clip:Dynamic, source:flight._hl.TimelineSourceRef):Void;
	@:hlNative("flight", "flight_stop_movie_clip")
	public static function stopMovieClip(clip:Dynamic):Void;
	@:hlNative("flight", "flight_update_movie_clip")
	public static function updateMovieClip(clip:Dynamic, deltaTime:Float):Void;
	@:hlNative("flight", "flight_create_spritesheet_timeline_source")
	public static function createSpritesheetTimelineSource(guards:flight._hl.MovieClipGuardState, spritesheet:Dynamic, animation:Dynamic):flight._hl.TimelineSourceRef;
	@:hlNative("flight", "flight_explain_spritesheet_timeline_source")
	public static function explainSpritesheetTimelineSource(animation:Dynamic):flight._hl.SpritesheetTimelineSourceExplanation;
	@:hlNative("flight", "flight_get_spritesheet_timeline_source_unsupported_field_string")
	public static function getSpritesheetTimelineSourceUnsupportedFieldString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_spritesheet_timeline_source_unsupported_field")
	public static function parseSpritesheetTimelineSourceUnsupportedField(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_free_movie_clip_data")
	public static function freeMovieClipData(ptr:flight._hl.MovieClipData):Void;
	@:hlNative("flight", "flight_free_movie_clip_runtime")
	public static function freeMovieClipRuntime(ptr:flight._hl.MovieClipRuntime):Void;
	@:hlNative("flight", "flight_free_movie_clip_signals")
	public static function freeMovieClipSignals(ptr:flight._hl.MovieClipSignals):Void;
	@:hlNative("flight", "flight_free_timeline_label")
	public static function freeTimelineLabel(ptr:flight._hl.TimelineLabel):Void;
	@:hlNative("flight", "flight_free_frame_script")
	public static function freeFrameScript(ptr:flight._hl.FrameScript):Void;
	@:hlNative("flight", "flight_free_timeline_source_ref")
	public static function freeTimelineSourceRef(ptr:flight._hl.TimelineSourceRef):Void;
	@:hlNative("flight", "flight_free_spritesheet_timeline_source_explanation")
	public static function freeSpritesheetTimelineSourceExplanation(ptr:flight._hl.SpritesheetTimelineSourceExplanation):Void;
}
