package flight;

#if hl

typedef SensorReading = flight._hl.SensorReading;

#elseif cpp

typedef SensorReading = flight._cpp.SensorReading;

#elseif (js && flight_esm)

typedef SensorReading = flight._js.SensorReading;

#elseif js

#error "flight.SensorReading on js requires flight_esm."

#else

#error "flight.SensorReading: no backend for this target."

#end
