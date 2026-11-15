package flight;

#if hl

typedef AmbientLight = flight._hl.AmbientLight;

#elseif cpp

typedef AmbientLight = flight._cpp.AmbientLight;

#elseif (js && flight_esm)

typedef AmbientLight = flight._js.AmbientLight;

#elseif js

#error "flight.AmbientLight on js requires flight_esm."

#else

#error "flight.AmbientLight: no backend for this target."

#end
