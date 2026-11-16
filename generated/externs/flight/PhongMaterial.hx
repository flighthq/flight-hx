package flight;

#if hl

typedef PhongMaterial = flight._hl.PhongMaterial;

#elseif cpp

typedef PhongMaterial = flight._cpp.PhongMaterial;

#elseif (js && flight_esm)

typedef PhongMaterial = flight._js.PhongMaterial;

#elseif js

#error "flight.PhongMaterial on js requires flight_esm."

#else

#error "flight.PhongMaterial: no backend for this target."

#end
