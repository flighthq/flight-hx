package flight;

#if hl

typedef CustomShaderMaterial = flight._hl.CustomShaderMaterial;

#elseif cpp

typedef CustomShaderMaterial = flight._cpp.CustomShaderMaterial;

#elseif (js && flight_esm)

typedef CustomShaderMaterial = flight._js.CustomShaderMaterial;

#elseif js

#error "flight.CustomShaderMaterial on js requires flight_esm."

#else

#error "flight.CustomShaderMaterial: no backend for this target."

#end
