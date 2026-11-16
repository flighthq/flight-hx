package flight;

#if hl

typedef SpineBinaryTimelineHandlerEntry = flight._hl.SpineBinaryTimelineHandlerEntry;

#elseif cpp

typedef SpineBinaryTimelineHandlerEntry = flight._cpp.SpineBinaryTimelineHandlerEntry;

#elseif (js && flight_esm)

typedef SpineBinaryTimelineHandlerEntry = flight._js.SpineBinaryTimelineHandlerEntry;

#elseif js

#error "flight.SpineBinaryTimelineHandlerEntry on js requires flight_esm."

#else

#error "flight.SpineBinaryTimelineHandlerEntry: no backend for this target."

#end
