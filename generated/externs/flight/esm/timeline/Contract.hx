package flight.esm.timeline;

#if (js && flight_esm)
@:jsRequire("@flighthq/timeline/contract")
extern class Contract {
  public static final TimelineAudioCueKind:String;
  public static final TimelineFrameEntryCause:Dynamic;
  public static final TimelineGotoCueKind:String;
  public static final TimelineNextFrameCueKind:String;
  public static final TimelinePlayCueKind:String;
  public static final TimelinePreviousFrameCueKind:String;
  public static final TimelineStopCueKind:String;
  public static final TimelineStreamAudioCueKind:String;
  public static function addTimelineFrameScript(timeline:flight.esm.types.timeline.Types.Timeline, frame:Dynamic, script:flight.esm.types.timeline.Types.FrameScript):Void;
  public static function clearTimelineFrameScripts(timeline:flight.esm.types.timeline.Types.Timeline):Void;
  public static function createTimeline(?obj:Dynamic):flight.esm.types.timeline.Types.Timeline;
  public static function createTimelineSource(obj:Dynamic):flight.esm.types.timeline.Types.TimelineSource;
  public static function disposeTimelineSignals(timeline:flight.esm.types.timeline.Types.Timeline):Void;
  public static function enableTimelineSignals(timeline:flight.esm.types.timeline.Types.Timeline):flight.esm.types.timeline.Types.TimelineSignals;
  public static function findTimelineLabel(timeline:flight.esm.types.timeline.Types.Timeline, name:String):Null<flight.esm.types.timeline.Types.TimelineLabel>;
  public static function getTimelineCurrentLabel(timeline:flight.esm.types.timeline.Types.Timeline):Null<flight.esm.types.timeline.Types.TimelineLabel>;
  public static function getTimelineFrameScript(timeline:flight.esm.types.timeline.Types.Timeline, frame:Dynamic):Null<flight.esm.types.timeline.Types.FrameScript>;
  public static function getTimelineFrameScriptFrames(timeline:flight.esm.types.timeline.Types.Timeline):Array<Float>;
  public static function getTimelineLabels(timeline:flight.esm.types.timeline.Types.Timeline):Array<flight.esm.types.timeline.Types.TimelineLabel>;
  public static function gotoAndPlayTimeline(timeline:flight.esm.types.timeline.Types.Timeline, frame:Dynamic):Void;
  public static function gotoAndStopTimeline(timeline:flight.esm.types.timeline.Types.Timeline, frame:Dynamic):Void;
  public static function initializeTimeline(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.timeline.Types.Timeline>, ?obj:Dynamic):Void;
  public static function initializeTimelineSource(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.timeline.Types.TimelineSource>, obj:Dynamic):Void;
  public static function nextFrameTimeline(timeline:flight.esm.types.timeline.Types.Timeline):Void;
  public static function playTimeline(timeline:flight.esm.types.timeline.Types.Timeline):Void;
  public static function prevFrameTimeline(timeline:flight.esm.types.timeline.Types.Timeline):Void;
  public static function removeTimelineFrameScript(timeline:flight.esm.types.timeline.Types.Timeline, frame:Dynamic):Void;
  public static function stopTimeline(timeline:flight.esm.types.timeline.Types.Timeline):Void;
  public static function updateTimeline(timeline:flight.esm.types.timeline.Types.Timeline, deltaTime:Float):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
