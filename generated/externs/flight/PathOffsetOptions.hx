package flight;

#if hl

typedef PathOffsetOptions = flight._hl.PathOffsetOptions;

#elseif cpp

typedef PathOffsetOptions = flight._cpp.PathOffsetOptions;

#elseif (js && flight_esm)

typedef PathOffsetOptions = flight._js.PathOffsetOptions;

#elseif js

#error "flight.PathOffsetOptions on js requires flight_esm."

#else

#error "flight.PathOffsetOptions: no backend for this target."

#end
