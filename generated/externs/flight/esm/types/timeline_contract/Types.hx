package flight.esm.types.timeline_contract;

#if (js && flight_esm)
typedef FrameScript = flight.esm.types.timeline.Types.FrameScript;

typedef Timeline = flight.esm.types.timeline.Types.Timeline;

typedef TimelineAudioCue = flight.esm.types.timeline.Types.TimelineAudioCue;

typedef TimelineAudioEnvelopePoint = flight.esm.types.timeline.Types.TimelineAudioEnvelopePoint;

typedef TimelineCue = flight.esm.types.timeline.Types.TimelineCue;

typedef TimelineCueHandler = flight.esm.types.timeline.Types.TimelineCueHandler;

typedef TimelineCueHandlerEntry = flight.esm.types.timeline.Types.TimelineCueHandlerEntry;

typedef TimelineCueRegistry = flight.esm.types.timeline.Types.TimelineCueRegistry;

typedef TimelineFrameEntryCause = flight.esm.types.timeline.Types.TimelineFrameEntryCause;

typedef TimelineFrameEvent = flight.esm.types.timeline.Types.TimelineFrameEvent;

typedef TimelineGotoCue = flight.esm.types.timeline.Types.TimelineGotoCue;

typedef TimelineLabel = flight.esm.types.timeline.Types.TimelineLabel;

typedef TimelinePlayMode = flight.esm.types.timeline.Types.TimelinePlayMode;

typedef TimelinePlaybackCue = flight.esm.types.timeline.Types.TimelinePlaybackCue;

typedef TimelineSignals = flight.esm.types.timeline.Types.TimelineSignals;

typedef TimelineSource = flight.esm.types.timeline.Types.TimelineSource;

typedef TimelineStreamAudioCue = flight.esm.types.timeline.Types.TimelineStreamAudioCue;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
