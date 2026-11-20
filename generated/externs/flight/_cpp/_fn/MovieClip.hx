package flight._cpp._fn;

extern class MovieClip {
	@:native("flight_are_movie_clip_guards_enabled")
	public static function areMovieClipGuardsEnabled(guards:flight._cpp.MovieClipGuardState):Bool;
	@:native("flight_disable_movie_clip_guards")
	public static function disableMovieClipGuards(guards:flight._cpp.MovieClipGuardState):Void;
	@:native("flight_create_movie_clip")
	public static function createMovieClip():flight._cpp.FlightNode;
	@:native("flight_add_movie_clip_frame_script")
	public static function addMovieClipFrameScript(clip:flight._cpp.FlightNode, frame:flight._cpp.TimelineFrameArg, script:flight._cpp.FrameScript):Void;
	@:native("flight_dispose_movie_clip_signals")
	public static function disposeMovieClipSignals(clip:flight._cpp.FlightNode):Void;
	@:native("flight_enable_movie_clip_signals")
	public static function enableMovieClipSignals(clip:flight._cpp.FlightNode):flight._cpp.MovieClipSignals;
	@:native("flight_get_movie_clip_current_frame")
	public static function getMovieClipCurrentFrame(clip:flight._cpp.FlightNode):Int;
	@:native("flight_get_movie_clip_current_label")
	public static function getMovieClipCurrentLabel(clip:flight._cpp.FlightNode):flight._cpp.TimelineLabel;
	@:native("flight_get_movie_clip_frame_script")
	public static function getMovieClipFrameScript(clip:flight._cpp.FlightNode, frame:flight._cpp.TimelineFrameArg):flight._cpp.FrameScript;
	@:native("flight_get_movie_clip_signals")
	public static function getMovieClipSignals(clip:flight._cpp.FlightNode):flight._cpp.MovieClipSignals;
	@:native("flight_get_movie_clip_total_frames")
	public static function getMovieClipTotalFrames(clip:flight._cpp.FlightNode):Int;
	@:native("flight_goto_and_play_movie_clip")
	public static function gotoAndPlayMovieClip(clip:flight._cpp.FlightNode, frame:flight._cpp.TimelineFrameArg):Void;
	@:native("flight_goto_and_stop_movie_clip")
	public static function gotoAndStopMovieClip(clip:flight._cpp.FlightNode, frame:flight._cpp.TimelineFrameArg):Void;
	@:native("flight_is_movie_clip_playing")
	public static function isMovieClipPlaying(clip:flight._cpp.FlightNode):Bool;
	@:native("flight_next_frame_movie_clip")
	public static function nextFrameMovieClip(clip:flight._cpp.FlightNode):Void;
	@:native("flight_play_movie_clip")
	public static function playMovieClip(clip:flight._cpp.FlightNode):Void;
	@:native("flight_prev_frame_movie_clip")
	public static function prevFrameMovieClip(clip:flight._cpp.FlightNode):Void;
	@:native("flight_remove_movie_clip_frame_script")
	public static function removeMovieClipFrameScript(clip:flight._cpp.FlightNode, frame:flight._cpp.TimelineFrameArg):Void;
	@:native("flight_set_movie_clip_source")
	public static function setMovieClipSource(clip:flight._cpp.FlightNode, source:flight._cpp.TimelineSourceRef):Void;
	@:native("flight_stop_movie_clip")
	public static function stopMovieClip(clip:flight._cpp.FlightNode):Void;
	@:native("flight_update_movie_clip")
	public static function updateMovieClip(clip:flight._cpp.FlightNode, deltaTime:Float):Void;
	@:native("flight_create_spritesheet_timeline_source")
	public static function createSpritesheetTimelineSource(guards:flight._cpp.MovieClipGuardState, spritesheet:cpp.Star<cpp.Void>, animation:cpp.Star<cpp.Void>):flight._cpp.TimelineSourceRef;
	@:native("flight_explain_spritesheet_timeline_source")
	public static function explainSpritesheetTimelineSource(animation:cpp.Star<cpp.Void>):flight._cpp.SpritesheetTimelineSourceExplanation;
	@:native("flight_free_movie_clip_signals")
	public static function freeMovieClipSignals(ptr:flight._cpp.MovieClipSignals):Void;
	@:native("flight_free_frame_script")
	public static function freeFrameScript(ptr:flight._cpp.FrameScript):Void;
	@:native("flight_free_spritesheet_timeline_source_explanation")
	public static function freeSpritesheetTimelineSourceExplanation(ptr:flight._cpp.SpritesheetTimelineSourceExplanation):Void;
}
