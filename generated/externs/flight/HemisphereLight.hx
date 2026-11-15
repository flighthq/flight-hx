package flight;

#if hl

typedef HemisphereLight = flight._hl.HemisphereLight;

#elseif cpp

typedef HemisphereLight = flight._cpp.HemisphereLight;

#elseif (js && flight_esm)

typedef HemisphereLight = flight._js.HemisphereLight;

#elseif js

#error "flight.HemisphereLight on js requires flight_esm."

#else

#error "flight.HemisphereLight: no backend for this target."

#end
