package flight;

#if hl

typedef ExposureAdjustment = flight._hl.ExposureAdjustment;

#elseif cpp

typedef ExposureAdjustment = flight._cpp.ExposureAdjustment;

#elseif (js && flight_esm)

typedef ExposureAdjustment = flight._js.ExposureAdjustment;

#elseif js

#error "flight.ExposureAdjustment on js requires flight_esm."

#else

#error "flight.ExposureAdjustment: no backend for this target."

#end
