package flight;

#if hl

typedef RiveCoreObjectHandlerEntry = flight._hl.RiveCoreObjectHandlerEntry;

#elseif cpp

typedef RiveCoreObjectHandlerEntry = flight._cpp.RiveCoreObjectHandlerEntry;

#elseif (js && flight_esm)

typedef RiveCoreObjectHandlerEntry = flight._js.RiveCoreObjectHandlerEntry;

#elseif js

#error "flight.RiveCoreObjectHandlerEntry on js requires flight_esm."

#else

#error "flight.RiveCoreObjectHandlerEntry: no backend for this target."

#end
