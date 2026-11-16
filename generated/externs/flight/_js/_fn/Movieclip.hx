package flight._js._fn;

@:jsRequire("flight")
extern class Movieclip {
	@:native("flight_are_movie_clip_guards_enabled")
	public static function areMovieClipGuardsEnabled(guards:flight._js.MovieClipGuardState):Bool;
	@:native("flight_disable_movie_clip_guards")
	public static function disableMovieClipGuards(guards:flight._js.MovieClipGuardState):Void;
	@:native("flight_enable_movie_clip_guards")
	public static function enableMovieClipGuards(guards:flight._js.MovieClipGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:native("flight_create_movie_clip")
	public static function createMovieClip():Dynamic;
	@:native("flight_create_movie_clip_data")
	public static function createMovieClipData():flight._js.MovieClipData;
	@:native("flight_create_movie_clip_runtime")
	public static function createMovieClipRuntime():flight._js.MovieClipRuntime;
	@:native("flight_add_movie_clip_frame_script")
	public static function addMovieClipFrameScript(clip:Dynamic, frame:flight._js.TimelineFrameArg, script:flight._js.FrameScript):Void;
	@:native("flight_dispose_movie_clip_signals")
	public static function disposeMovieClipSignals(clip:Dynamic):Void;
	@:native("flight_enable_movie_clip_signals")
	public static function enableMovieClipSignals(clip:Dynamic):flight._js.MovieClipSignals;
	@:native("flight_get_movie_clip_current_frame")
	public static function getMovieClipCurrentFrame(clip:Dynamic):Int;
	@:native("flight_get_movie_clip_current_label")
	public static function getMovieClipCurrentLabel(clip:Dynamic):Dynamic;
	@:native("flight_get_movie_clip_frame_script")
	public static function getMovieClipFrameScript(clip:Dynamic, frame:flight._js.TimelineFrameArg):Dynamic;
	@:native("flight_get_movie_clip_runtime")
	public static function getMovieClipRuntime(source:flight._js.MovieClip):flight._js.MovieClipRuntime;
	@:native("flight_get_movie_clip_signals")
	public static function getMovieClipSignals(clip:Dynamic):Dynamic;
	@:native("flight_get_movie_clip_total_frames")
	public static function getMovieClipTotalFrames(clip:Dynamic):Int;
	@:native("flight_goto_and_play_movie_clip")
	public static function gotoAndPlayMovieClip(clip:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("flight_goto_and_stop_movie_clip")
	public static function gotoAndStopMovieClip(clip:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("flight_is_movie_clip_playing")
	public static function isMovieClipPlaying(clip:Dynamic):Bool;
	@:native("flight_next_frame_movie_clip")
	public static function nextFrameMovieClip(clip:Dynamic):Void;
	@:native("flight_play_movie_clip")
	public static function playMovieClip(clip:Dynamic):Void;
	@:native("flight_prev_frame_movie_clip")
	public static function prevFrameMovieClip(clip:Dynamic):Void;
	@:native("flight_remove_movie_clip_frame_script")
	public static function removeMovieClipFrameScript(clip:Dynamic, frame:flight._js.TimelineFrameArg):Void;
	@:native("flight_set_movie_clip_source")
	public static function setMovieClipSource(clip:Dynamic, source:flight._js.TimelineSourceRef):Void;
	@:native("flight_stop_movie_clip")
	public static function stopMovieClip(clip:Dynamic):Void;
	@:native("flight_update_movie_clip")
	public static function updateMovieClip(clip:Dynamic, deltaTime:Float):Void;
	@:native("flight_create_spritesheet_timeline_source")
	public static function createSpritesheetTimelineSource(guards:flight._js.MovieClipGuardState, spritesheet:Dynamic, animation:Dynamic):flight._js.TimelineSourceRef;
	@:native("flight_explain_spritesheet_timeline_source")
	public static function explainSpritesheetTimelineSource(animation:Dynamic):flight._js.SpritesheetTimelineSourceExplanation;
	@:native("flight_get_spritesheet_timeline_source_unsupported_field_string")
	public static function getSpritesheetTimelineSourceUnsupportedFieldString(value:Int):String;
	@:native("flight_parse_spritesheet_timeline_source_unsupported_field")
	public static function parseSpritesheetTimelineSourceUnsupportedField(value:String):Int;
	@:native("flight_free_movie_clip_data")
	public static function freeMovieClipData(ptr:flight._js.MovieClipData):Void;
	@:native("flight_free_movie_clip_runtime")
	public static function freeMovieClipRuntime(ptr:flight._js.MovieClipRuntime):Void;
	@:native("flight_free_movie_clip_signals")
	public static function freeMovieClipSignals(ptr:flight._js.MovieClipSignals):Void;
	@:native("flight_free_timeline_label")
	public static function freeTimelineLabel(ptr:flight._js.TimelineLabel):Void;
	@:native("flight_free_frame_script")
	public static function freeFrameScript(ptr:flight._js.FrameScript):Void;
	@:native("flight_free_timeline_source_ref")
	public static function freeTimelineSourceRef(ptr:flight._js.TimelineSourceRef):Void;
	@:native("flight_free_spritesheet_timeline_source_explanation")
	public static function freeSpritesheetTimelineSourceExplanation(ptr:flight._js.SpritesheetTimelineSourceExplanation):Void;
}
