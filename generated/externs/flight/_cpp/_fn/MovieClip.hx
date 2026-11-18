package flight._cpp._fn;

extern class MovieClip {
	@:native("flight_are_movie_clip_guards_enabled")
	public static function areMovieClipGuardsEnabled(guards:flight._cpp.MovieClipGuardState):Bool;
	@:native("flight_disable_movie_clip_guards")
	public static function disableMovieClipGuards(guards:flight._cpp.MovieClipGuardState):Void;
	@:native("flight_enable_movie_clip_guards")
	public static function enableMovieClipGuards(guards:flight._cpp.MovieClipGuardState, logState:cpp.Star<cpp.Void>, clockFn:cpp.Star<cpp.Void>, clockCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_create_movie_clip")
	public static function createMovieClip():cpp.Star<cpp.Void>;
	@:native("flight_add_movie_clip_frame_script")
	public static function addMovieClipFrameScript(clip:cpp.Star<cpp.Void>, frame:flight._cpp.TimelineFrameArg, script:flight._cpp.FrameScript):Void;
	@:native("flight_dispose_movie_clip_signals")
	public static function disposeMovieClipSignals(clip:cpp.Star<cpp.Void>):Void;
	@:native("flight_enable_movie_clip_signals")
	public static function enableMovieClipSignals(clip:cpp.Star<cpp.Void>):flight._cpp.MovieClipSignals;
	@:native("flight_get_movie_clip_current_frame")
	public static function getMovieClipCurrentFrame(clip:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_movie_clip_current_label")
	public static function getMovieClipCurrentLabel(clip:cpp.Star<cpp.Void>):flight._cpp.TimelineLabel;
	@:native("flight_get_movie_clip_frame_script")
	public static function getMovieClipFrameScript(clip:cpp.Star<cpp.Void>, frame:flight._cpp.TimelineFrameArg):flight._cpp.FrameScript;
	@:native("flight_get_movie_clip_signals")
	public static function getMovieClipSignals(clip:cpp.Star<cpp.Void>):flight._cpp.MovieClipSignals;
	@:native("flight_get_movie_clip_total_frames")
	public static function getMovieClipTotalFrames(clip:cpp.Star<cpp.Void>):Int;
	@:native("flight_goto_and_play_movie_clip")
	public static function gotoAndPlayMovieClip(clip:cpp.Star<cpp.Void>, frame:flight._cpp.TimelineFrameArg):Void;
	@:native("flight_goto_and_stop_movie_clip")
	public static function gotoAndStopMovieClip(clip:cpp.Star<cpp.Void>, frame:flight._cpp.TimelineFrameArg):Void;
	@:native("flight_is_movie_clip_playing")
	public static function isMovieClipPlaying(clip:cpp.Star<cpp.Void>):Bool;
	@:native("flight_next_frame_movie_clip")
	public static function nextFrameMovieClip(clip:cpp.Star<cpp.Void>):Void;
	@:native("flight_play_movie_clip")
	public static function playMovieClip(clip:cpp.Star<cpp.Void>):Void;
	@:native("flight_prev_frame_movie_clip")
	public static function prevFrameMovieClip(clip:cpp.Star<cpp.Void>):Void;
	@:native("flight_remove_movie_clip_frame_script")
	public static function removeMovieClipFrameScript(clip:cpp.Star<cpp.Void>, frame:flight._cpp.TimelineFrameArg):Void;
	@:native("flight_set_movie_clip_source")
	public static function setMovieClipSource(clip:cpp.Star<cpp.Void>, source:flight._cpp.TimelineSourceRef):Void;
	@:native("flight_stop_movie_clip")
	public static function stopMovieClip(clip:cpp.Star<cpp.Void>):Void;
	@:native("flight_update_movie_clip")
	public static function updateMovieClip(clip:cpp.Star<cpp.Void>, deltaTime:Float):Void;
	@:native("flight_create_spritesheet_timeline_source")
	public static function createSpritesheetTimelineSource(guards:flight._cpp.MovieClipGuardState, spritesheet:cpp.Star<cpp.Void>, animation:cpp.Star<cpp.Void>):flight._cpp.TimelineSourceRef;
	@:native("flight_explain_spritesheet_timeline_source")
	public static function explainSpritesheetTimelineSource(animation:cpp.Star<cpp.Void>):flight._cpp.SpritesheetTimelineSourceExplanation;
	@:native("flight_free_movie_clip_signals")
	public static function freeMovieClipSignals(ptr:flight._cpp.MovieClipSignals):Void;
	@:native("flight_free_spritesheet_timeline_source_explanation")
	public static function freeSpritesheetTimelineSourceExplanation(ptr:flight._cpp.SpritesheetTimelineSourceExplanation):Void;
}
