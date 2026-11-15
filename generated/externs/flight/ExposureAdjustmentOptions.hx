package flight;

#if hl

typedef ExposureAdjustmentOptions = flight._hl.ExposureAdjustmentOptions;

#elseif cpp

typedef ExposureAdjustmentOptions = flight._cpp.ExposureAdjustmentOptions;

#elseif (js && flight_esm)

typedef ExposureAdjustmentOptions = flight._js.ExposureAdjustmentOptions;

#elseif js

#error "flight.ExposureAdjustmentOptions on js requires flight_esm."

#else

#error "flight.ExposureAdjustmentOptions: no backend for this target."

#end
