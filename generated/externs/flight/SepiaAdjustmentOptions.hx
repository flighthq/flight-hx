package flight;

#if hl

typedef SepiaAdjustmentOptions = flight._hl.SepiaAdjustmentOptions;

#elseif cpp

typedef SepiaAdjustmentOptions = flight._cpp.SepiaAdjustmentOptions;

#elseif (js && flight_esm)

typedef SepiaAdjustmentOptions = flight._js.SepiaAdjustmentOptions;

#elseif js

#error "flight.SepiaAdjustmentOptions on js requires flight_esm."

#else

#error "flight.SepiaAdjustmentOptions: no backend for this target."

#end
