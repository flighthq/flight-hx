package flight;

#if hl

typedef InvertAdjustment = flight._hl.InvertAdjustment;

#elseif cpp

typedef InvertAdjustment = flight._cpp.InvertAdjustment;

#elseif (js && flight_esm)

typedef InvertAdjustment = flight._js.InvertAdjustment;

#elseif js

#error "flight.InvertAdjustment on js requires flight_esm."

#else

#error "flight.InvertAdjustment: no backend for this target."

#end
