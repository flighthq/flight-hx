package flight;

#if hl

typedef NormalMaterial = flight._hl.NormalMaterial;

#elseif cpp

typedef NormalMaterial = flight._cpp.NormalMaterial;

#elseif (js && flight_esm)

typedef NormalMaterial = flight._js.NormalMaterial;

#elseif js

#error "flight.NormalMaterial on js requires flight_esm."

#else

#error "flight.NormalMaterial: no backend for this target."

#end
