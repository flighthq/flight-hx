package flight;

#if hl

typedef AmbientLightReading = flight._hl.AmbientLightReading;

#elseif cpp

typedef AmbientLightReading = flight._cpp.AmbientLightReading;

#elseif (js && flight_esm)

typedef AmbientLightReading = flight._js.AmbientLightReading;

#elseif js

#error "flight.AmbientLightReading on js requires flight_esm."

#else

#error "flight.AmbientLightReading: no backend for this target."

#end
