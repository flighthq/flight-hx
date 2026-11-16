package flight;

#if hl

typedef UnlitMaterial = flight._hl.UnlitMaterial;

#elseif cpp

typedef UnlitMaterial = flight._cpp.UnlitMaterial;

#elseif (js && flight_esm)

typedef UnlitMaterial = flight._js.UnlitMaterial;

#elseif js

#error "flight.UnlitMaterial on js requires flight_esm."

#else

#error "flight.UnlitMaterial: no backend for this target."

#end
