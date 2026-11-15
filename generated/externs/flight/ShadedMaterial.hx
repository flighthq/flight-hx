package flight;

#if hl

typedef ShadedMaterial = flight._hl.ShadedMaterial;

#elseif cpp

typedef ShadedMaterial = flight._cpp.ShadedMaterial;

#elseif (js && flight_esm)

typedef ShadedMaterial = flight._js.ShadedMaterial;

#elseif js

#error "flight.ShadedMaterial on js requires flight_esm."

#else

#error "flight.ShadedMaterial: no backend for this target."

#end
