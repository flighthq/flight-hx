package flight._hl._fn;

extern class MovieClip {
	@:hlNative("flight", "flight_are_movie_clip_guards_enabled")
	public static function areMovieClipGuardsEnabled(guards:flight._hl.MovieClipGuardState):Bool;
	@:hlNative("flight", "flight_disable_movie_clip_guards")
	public static function disableMovieClipGuards(guards:flight._hl.MovieClipGuardState):Void;
	@:hlNative("flight", "flight_create_movie_clip")
	public static function createMovieClip():flight._hl.FlightNode;
	@:hlNative("flight", "flight_add_movie_clip_frame_script")
	public static function addMovieClipFrameScript(clip:flight._hl.FlightNode, frame:flight._hl.TimelineFrameArg, script:flight._hl.FrameScript):Void;
	@:hlNative("flight", "flight_dispose_movie_clip_signals")
	public static function disposeMovieClipSignals(clip:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_enable_movie_clip_signals")
	public static function enableMovieClipSignals(clip:flight._hl.FlightNode):flight._hl.MovieClipSignals;
	@:hlNative("flight", "flight_get_movie_clip_current_frame")
	public static function getMovieClipCurrentFrame(clip:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_movie_clip_current_label")
	public static function getMovieClipCurrentLabel(clip:flight._hl.FlightNode):flight._hl.TimelineLabel;
	@:hlNative("flight", "flight_get_movie_clip_frame_script")
	public static function getMovieClipFrameScript(clip:flight._hl.FlightNode, frame:flight._hl.TimelineFrameArg):flight._hl.FrameScript;
	@:hlNative("flight", "flight_get_movie_clip_signals")
	public static function getMovieClipSignals(clip:flight._hl.FlightNode):flight._hl.MovieClipSignals;
	@:hlNative("flight", "flight_get_movie_clip_total_frames")
	public static function getMovieClipTotalFrames(clip:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_goto_and_play_movie_clip")
	public static function gotoAndPlayMovieClip(clip:flight._hl.FlightNode, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_goto_and_stop_movie_clip")
	public static function gotoAndStopMovieClip(clip:flight._hl.FlightNode, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_is_movie_clip_playing")
	public static function isMovieClipPlaying(clip:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_next_frame_movie_clip")
	public static function nextFrameMovieClip(clip:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_play_movie_clip")
	public static function playMovieClip(clip:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_prev_frame_movie_clip")
	public static function prevFrameMovieClip(clip:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_remove_movie_clip_frame_script")
	public static function removeMovieClipFrameScript(clip:flight._hl.FlightNode, frame:flight._hl.TimelineFrameArg):Void;
	@:hlNative("flight", "flight_set_movie_clip_source")
	public static function setMovieClipSource(clip:flight._hl.FlightNode, source:flight._hl.TimelineSourceRef):Void;
	@:hlNative("flight", "flight_stop_movie_clip")
	public static function stopMovieClip(clip:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_update_movie_clip")
	public static function updateMovieClip(clip:flight._hl.FlightNode, deltaTime:Float):Void;
	@:hlNative("flight", "flight_create_spritesheet_timeline_source")
	public static function createSpritesheetTimelineSource(guards:flight._hl.MovieClipGuardState, spritesheet:hl.Bytes, animation:hl.Bytes):flight._hl.TimelineSourceRef;
	@:hlNative("flight", "flight_explain_spritesheet_timeline_source")
	public static function explainSpritesheetTimelineSource(animation:hl.Bytes):flight._hl.SpritesheetTimelineSourceExplanation;
	@:hlNative("flight", "flight_free_movie_clip_signals")
	public static function freeMovieClipSignals(ptr:flight._hl.MovieClipSignals):Void;
	@:hlNative("flight", "flight_free_frame_script")
	public static function freeFrameScript(ptr:flight._hl.FrameScript):Void;
	@:hlNative("flight", "flight_free_spritesheet_timeline_source_explanation")
	public static function freeSpritesheetTimelineSourceExplanation(ptr:flight._hl.SpritesheetTimelineSourceExplanation):Void;
}
