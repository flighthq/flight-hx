package flight;

#if hl

typedef StatechartRegion = flight._hl.StatechartRegion;

#elseif cpp

typedef StatechartRegion = flight._cpp.StatechartRegion;

#elseif (js && flight_esm)

typedef StatechartRegion = flight._js.StatechartRegion;

#elseif js

#error "flight.StatechartRegion on js requires flight_esm."

#else

#error "flight.StatechartRegion: no backend for this target."

#end
