package flight;

#if hl

typedef SpineJsonSectionHandlerEntry = flight._hl.SpineJsonSectionHandlerEntry;

#elseif cpp

typedef SpineJsonSectionHandlerEntry = flight._cpp.SpineJsonSectionHandlerEntry;

#elseif (js && flight_esm)

typedef SpineJsonSectionHandlerEntry = flight._js.SpineJsonSectionHandlerEntry;

#elseif js

#error "flight.SpineJsonSectionHandlerEntry on js requires flight_esm."

#else

#error "flight.SpineJsonSectionHandlerEntry: no backend for this target."

#end
