package flight;

#if hl

typedef SpotLightConeAngles = flight._hl.SpotLightConeAngles;

#elseif cpp

typedef SpotLightConeAngles = flight._cpp.SpotLightConeAngles;

#elseif (js && flight_esm)

typedef SpotLightConeAngles = flight._js.SpotLightConeAngles;

#elseif js

#error "flight.SpotLightConeAngles on js requires flight_esm."

#else

#error "flight.SpotLightConeAngles: no backend for this target."

#end
