package flight;

#if hl

typedef SepiaAdjustment = flight._hl.SepiaAdjustment;

#elseif cpp

typedef SepiaAdjustment = flight._cpp.SepiaAdjustment;

#elseif (js && flight_esm)

typedef SepiaAdjustment = flight._js.SepiaAdjustment;

#elseif js

#error "flight.SepiaAdjustment on js requires flight_esm."

#else

#error "flight.SepiaAdjustment: no backend for this target."

#end
