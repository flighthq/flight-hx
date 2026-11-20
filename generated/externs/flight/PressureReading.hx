package flight;

#if hl

typedef PressureReading = flight._hl.PressureReading;

#elseif cpp

typedef PressureReading = flight._cpp.PressureReading;

#elseif (js && flight_esm)

typedef PressureReading = flight._js.PressureReading;

#elseif js

#error "flight.PressureReading on js requires flight_esm."

#else

#error "flight.PressureReading: no backend for this target."

#end
