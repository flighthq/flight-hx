package flight;

#if hl

typedef DirectionalLightOptions = flight._hl.DirectionalLightOptions;

#elseif cpp

typedef DirectionalLightOptions = flight._cpp.DirectionalLightOptions;

#elseif (js && flight_esm)

typedef DirectionalLightOptions = flight._js.DirectionalLightOptions;

#elseif js

#error "flight.DirectionalLightOptions on js requires flight_esm."

#else

#error "flight.DirectionalLightOptions: no backend for this target."

#end
