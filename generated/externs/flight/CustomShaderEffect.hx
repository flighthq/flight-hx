package flight;

#if hl

typedef CustomShaderEffect = flight._hl.CustomShaderEffect;

#elseif cpp

typedef CustomShaderEffect = flight._cpp.CustomShaderEffect;

#elseif (js && flight_esm)

typedef CustomShaderEffect = flight._js.CustomShaderEffect;

#elseif js

#error "flight.CustomShaderEffect on js requires flight_esm."

#else

#error "flight.CustomShaderEffect: no backend for this target."

#end
