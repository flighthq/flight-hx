package flight;

#if hl

typedef InvertAdjustmentOptions = flight._hl.InvertAdjustmentOptions;

#elseif cpp

typedef InvertAdjustmentOptions = flight._cpp.InvertAdjustmentOptions;

#elseif (js && flight_esm)

typedef InvertAdjustmentOptions = flight._js.InvertAdjustmentOptions;

#elseif js

#error "flight.InvertAdjustmentOptions on js requires flight_esm."

#else

#error "flight.InvertAdjustmentOptions: no backend for this target."

#end
