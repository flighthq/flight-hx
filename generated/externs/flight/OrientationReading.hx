package flight;

#if hl

typedef OrientationReading = flight._hl.OrientationReading;

#elseif cpp

typedef OrientationReading = flight._cpp.OrientationReading;

#elseif (js && flight_esm)

typedef OrientationReading = flight._js.OrientationReading;

#elseif js

#error "flight.OrientationReading on js requires flight_esm."

#else

#error "flight.OrientationReading: no backend for this target."

#end
