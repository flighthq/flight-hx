package flight;

#if hl

typedef ProximityReading = flight._hl.ProximityReading;

#elseif cpp

typedef ProximityReading = flight._cpp.ProximityReading;

#elseif (js && flight_esm)

typedef ProximityReading = flight._js.ProximityReading;

#elseif js

#error "flight.ProximityReading on js requires flight_esm."

#else

#error "flight.ProximityReading: no backend for this target."

#end
