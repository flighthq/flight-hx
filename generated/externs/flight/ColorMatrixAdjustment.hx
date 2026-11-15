package flight;

#if hl

typedef ColorMatrixAdjustment = flight._hl.ColorMatrixAdjustment;

#elseif cpp

typedef ColorMatrixAdjustment = flight._cpp.ColorMatrixAdjustment;

#elseif (js && flight_esm)

typedef ColorMatrixAdjustment = flight._js.ColorMatrixAdjustment;

#elseif js

#error "flight.ColorMatrixAdjustment on js requires flight_esm."

#else

#error "flight.ColorMatrixAdjustment: no backend for this target."

#end
