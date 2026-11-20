package flight;

#if hl

typedef RotationRateReading = flight._hl.RotationRateReading;

#elseif cpp

typedef RotationRateReading = flight._cpp.RotationRateReading;

#elseif (js && flight_esm)

typedef RotationRateReading = flight._js.RotationRateReading;

#elseif js

#error "flight.RotationRateReading on js requires flight_esm."

#else

#error "flight.RotationRateReading: no backend for this target."

#end
