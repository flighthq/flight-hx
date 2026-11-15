package flight;

#if hl

typedef GrayscaleAdjustmentOptions = flight._hl.GrayscaleAdjustmentOptions;

#elseif cpp

typedef GrayscaleAdjustmentOptions = flight._cpp.GrayscaleAdjustmentOptions;

#elseif (js && flight_esm)

typedef GrayscaleAdjustmentOptions = flight._js.GrayscaleAdjustmentOptions;

#elseif js

#error "flight.GrayscaleAdjustmentOptions on js requires flight_esm."

#else

#error "flight.GrayscaleAdjustmentOptions: no backend for this target."

#end
