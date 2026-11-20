package flight.esm.types.timeline;

#if (js && flight_esm)
typedef FrameScript = ((target:flight.esm.types.scene2d_contract.Types.Node2D, frame:Float) -> Void);

typedef Timeline = { source:Null<flight.esm.types.timeline.Types.TimelineSource>, target:Null<flight.esm.types.scene2d_contract.Types.Node2D>, currentFrame:Float, cueRegistry:Null<flight.esm.types.timeline.Types.TimelineCueRegistry>, frameScripts:Null<js.lib.Map<Float, flight.esm.types.timeline.Types.FrameScript>>, isPlaying:Bool, timeElapsed:Float, lastFrameUpdate:Float, playMode:flight.esm.types.timeline.Types.TimelinePlayMode, signals:Null<flight.esm.types.timeline.Types.TimelineSignals> };

typedef TimelineAudioCue = { kind:String, duration:Null<Float>, gain:Float, envelope:Array<flight.esm.types.timeline.Types.TimelineAudioEnvelopePoint>, loops:Float, offset:Float, resource:flight.esm.types.audio.Types.AudioResource, skipIfPlaying:Bool, stop:Bool, frame:Float };

typedef TimelineAudioEnvelopePoint = { leftGain:Float, rightGain:Float, time:Float };

typedef TimelineCue = { frame:Float, kind:String };

typedef TimelineCueHandler = ((timeline:flight.esm.types.timeline.Types.Timeline, cue:flight.esm.types.timeline.Types.TimelineCue, cause:flight.esm.types.timeline.Types.TimelineFrameEntryCause) -> Void);

typedef TimelineCueHandlerEntry = { dispatchOnSeek:Bool, handle:flight.esm.types.timeline.Types.TimelineCueHandler, kind:String };

typedef TimelineCueRegistry = { entries:Array<flight.esm.types.timeline.Types.TimelineCueHandlerEntry> };

typedef TimelineFrameEntryCause = String;

typedef TimelineFrameEvent = { frame:Float, previousFrame:Float };

typedef TimelineGotoCue = { kind:String, targetFrame:Null<Float>, targetLabel:Null<String>, frame:Float };

typedef TimelineLabel = { frame:Float, name:String };

typedef TimelinePlayMode = String;

typedef TimelinePlaybackCue = { kind:String, frame:Float };

typedef TimelineSignals = { onComplete:flight.esm.types.signals.Types.Signal<Void>, onEnterFrame:flight.esm.types.signals.Types.Signal<flight.esm.types.timeline.Types.TimelineFrameEvent>, onExitFrame:flight.esm.types.signals.Types.Signal<flight.esm.types.timeline.Types.TimelineFrameEvent>, onFrameConstructed:flight.esm.types.signals.Types.Signal<flight.esm.types.timeline.Types.TimelineFrameEvent>, onLoop:flight.esm.types.signals.Types.Signal<Void> };

typedef TimelineSource = { totalFrames:Float, labels:Array<flight.esm.types.timeline.Types.TimelineLabel>, cues:Array<flight.esm.types.timeline.Types.TimelineCue>, frameRate:Null<Float>, constructFrame:((target:flight.esm.types.scene2d_contract.Types.Node2D, frame:Float) -> Void) };

typedef TimelineStreamAudioCue = { kind:String, gain:Float, resource:flight.esm.types.audio.Types.AudioResource, frame:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
