package flight;

#if hl

typedef SpineJsonTimelineHandlerEntry = flight._hl.SpineJsonTimelineHandlerEntry;

#elseif cpp

typedef SpineJsonTimelineHandlerEntry = flight._cpp.SpineJsonTimelineHandlerEntry;

#elseif (js && flight_esm)

typedef SpineJsonTimelineHandlerEntry = flight._js.SpineJsonTimelineHandlerEntry;

#elseif js

#error "flight.SpineJsonTimelineHandlerEntry on js requires flight_esm."

#else

#error "flight.SpineJsonTimelineHandlerEntry: no backend for this target."

#end
