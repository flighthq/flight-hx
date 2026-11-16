package flight;

#if hl

typedef SpineBinarySectionHandlerEntry = flight._hl.SpineBinarySectionHandlerEntry;

#elseif cpp

typedef SpineBinarySectionHandlerEntry = flight._cpp.SpineBinarySectionHandlerEntry;

#elseif (js && flight_esm)

typedef SpineBinarySectionHandlerEntry = flight._js.SpineBinarySectionHandlerEntry;

#elseif js

#error "flight.SpineBinarySectionHandlerEntry on js requires flight_esm."

#else

#error "flight.SpineBinarySectionHandlerEntry: no backend for this target."

#end
