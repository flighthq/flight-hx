package flight;

#if hl

typedef HasMaterial = flight._hl.HasMaterial;

#elseif cpp

typedef HasMaterial = flight._cpp.HasMaterial;

#elseif (js && flight_esm)

typedef HasMaterial = flight._js.HasMaterial;

#elseif js

#error "flight.HasMaterial on js requires flight_esm."

#else

#error "flight.HasMaterial: no backend for this target."

#end
