package flight;

#if hl

typedef PointLight = flight._hl.PointLight;

#elseif cpp

typedef PointLight = flight._cpp.PointLight;

#elseif (js && flight_esm)

typedef PointLight = flight._js.PointLight;

#elseif js

#error "flight.PointLight on js requires flight_esm."

#else

#error "flight.PointLight: no backend for this target."

#end
