package flight;

#if hl

typedef ColorScaleBiasAdjustment = flight._hl.ColorScaleBiasAdjustment;

#elseif cpp

typedef ColorScaleBiasAdjustment = flight._cpp.ColorScaleBiasAdjustment;

#elseif (js && flight_esm)

typedef ColorScaleBiasAdjustment = flight._js.ColorScaleBiasAdjustment;

#elseif js

#error "flight.ColorScaleBiasAdjustment on js requires flight_esm."

#else

#error "flight.ColorScaleBiasAdjustment: no backend for this target."

#end
