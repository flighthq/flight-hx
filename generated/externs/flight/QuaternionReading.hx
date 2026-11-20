package flight;

#if hl

typedef QuaternionReading = flight._hl.QuaternionReading;

#elseif cpp

typedef QuaternionReading = flight._cpp.QuaternionReading;

#elseif (js && flight_esm)

typedef QuaternionReading = flight._js.QuaternionReading;

#elseif js

#error "flight.QuaternionReading on js requires flight_esm."

#else

#error "flight.QuaternionReading: no backend for this target."

#end
