package flight;

#if hl

typedef DirectionalLight = flight._hl.DirectionalLight;

#elseif cpp

typedef DirectionalLight = flight._cpp.DirectionalLight;

#elseif (js && flight_esm)

typedef DirectionalLight = flight._js.DirectionalLight;

#elseif js

#error "flight.DirectionalLight on js requires flight_esm."

#else

#error "flight.DirectionalLight: no backend for this target."

#end
