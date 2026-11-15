package flight;

#if hl

typedef AreaLight = flight._hl.AreaLight;

#elseif cpp

typedef AreaLight = flight._cpp.AreaLight;

#elseif (js && flight_esm)

typedef AreaLight = flight._js.AreaLight;

#elseif js

#error "flight.AreaLight on js requires flight_esm."

#else

#error "flight.AreaLight: no backend for this target."

#end
