package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/movieclip")
extern class Movieclip {
  public static final MovieClipKind:String;
  public static function addMovieClipFrameScript(clip:flight.esm.types.movieclip.Types.MovieClip, frame:Dynamic, script:flight.esm.types.timeline.Types.FrameScript):Void;
  public static function areMovieClipGuardsEnabled():Bool;
  public static function createMovieClip():flight.esm.types.movieclip.Types.MovieClip;
  public static function createSpritesheetTimelineSource(spritesheet:flight.esm.types.spritesheet.Types.Spritesheet, animation:flight.esm.types.spritesheet.Types.SpritesheetAnimation):flight.esm.types.timeline.Types.TimelineSource;
  public static function disableMovieClipGuards():Void;
  public static function disposeMovieClipSignals(clip:flight.esm.types.movieclip.Types.MovieClip):Void;
  public static function enableMovieClipGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function enableMovieClipSignals(clip:flight.esm.types.movieclip.Types.MovieClip):flight.esm.types.timeline.Types.TimelineSignals;
  public static function explainSpritesheetTimelineSource(animation:flight.esm.types.spritesheet.Types.SpritesheetAnimation):flight.esm.types.movieclip.Types.SpritesheetTimelineSourceExplanation;
  public static function getMovieClipCurrentFrame(clip:flight.esm.types.movieclip.Types.MovieClip):Float;
  public static function getMovieClipCurrentLabel(clip:flight.esm.types.movieclip.Types.MovieClip):Null<flight.esm.types.timeline.Types.TimelineLabel>;
  public static function getMovieClipFrameScript(clip:flight.esm.types.movieclip.Types.MovieClip, frame:Dynamic):Null<flight.esm.types.timeline.Types.FrameScript>;
  public static function getMovieClipSignals(clip:flight.esm.types.movieclip.Types.MovieClip):Null<flight.esm.types.timeline.Types.TimelineSignals>;
  public static function getMovieClipTotalFrames(clip:flight.esm.types.movieclip.Types.MovieClip):Float;
  public static function gotoAndPlayMovieClip(clip:flight.esm.types.movieclip.Types.MovieClip, frame:Dynamic):Void;
  public static function gotoAndStopMovieClip(clip:flight.esm.types.movieclip.Types.MovieClip, frame:Dynamic):Void;
  public static function isMovieClipPlaying(clip:flight.esm.types.movieclip.Types.MovieClip):Bool;
  public static function nextFrameMovieClip(clip:flight.esm.types.movieclip.Types.MovieClip):Void;
  public static function playMovieClip(clip:flight.esm.types.movieclip.Types.MovieClip):Void;
  public static function prevFrameMovieClip(clip:flight.esm.types.movieclip.Types.MovieClip):Void;
  public static function removeMovieClipFrameScript(clip:flight.esm.types.movieclip.Types.MovieClip, frame:Dynamic):Void;
  public static function setMovieClipSource(clip:flight.esm.types.movieclip.Types.MovieClip, source:flight.esm.types.timeline.Types.TimelineSource):Void;
  public static function stopMovieClip(clip:flight.esm.types.movieclip.Types.MovieClip):Void;
  public static function updateMovieClip(clip:flight.esm.types.movieclip.Types.MovieClip, deltaTime:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
