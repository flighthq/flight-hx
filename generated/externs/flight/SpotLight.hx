package flight;

#if hl

typedef SpotLight = flight._hl.SpotLight;

#elseif cpp

typedef SpotLight = flight._cpp.SpotLight;

#elseif (js && flight_esm)

typedef SpotLight = flight._js.SpotLight;

#elseif js

#error "flight.SpotLight on js requires flight_esm."

#else

#error "flight.SpotLight: no backend for this target."

#end
