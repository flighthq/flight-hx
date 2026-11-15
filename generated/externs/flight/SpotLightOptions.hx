package flight;

#if hl

typedef SpotLightOptions = flight._hl.SpotLightOptions;

#elseif cpp

typedef SpotLightOptions = flight._cpp.SpotLightOptions;

#elseif (js && flight_esm)

typedef SpotLightOptions = flight._js.SpotLightOptions;

#elseif js

#error "flight.SpotLightOptions on js requires flight_esm."

#else

#error "flight.SpotLightOptions: no backend for this target."

#end
