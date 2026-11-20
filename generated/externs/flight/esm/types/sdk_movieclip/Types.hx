package flight.esm.types.sdk_movieclip;

#if (js && flight_esm)
typedef MovieClip = flight.esm.types.movieclip.Types.MovieClip;

typedef MovieClipData = flight.esm.types.movieclip.Types.MovieClipData;

typedef MovieClipRuntime = flight.esm.types.movieclip.Types.MovieClipRuntime;

typedef MovieClipSignals = flight.esm.types.movieclip.Types.MovieClipSignals;

typedef SpritesheetTimelineSourceExplanation = flight.esm.types.movieclip.Types.SpritesheetTimelineSourceExplanation;

typedef SpritesheetTimelineSourceGuard = flight.esm.types.movieclip.Types.SpritesheetTimelineSourceGuard;

typedef SpritesheetTimelineSourceUnsupportedField = flight.esm.types.movieclip.Types.SpritesheetTimelineSourceUnsupportedField;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
