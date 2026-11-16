package flight;

#if hl

typedef Awd2ParsedMaterial = flight._hl.Awd2ParsedMaterial;

#elseif cpp

typedef Awd2ParsedMaterial = flight._cpp.Awd2ParsedMaterial;

#elseif (js && flight_esm)

typedef Awd2ParsedMaterial = flight._js.Awd2ParsedMaterial;

#elseif js

#error "flight.Awd2ParsedMaterial on js requires flight_esm."

#else

#error "flight.Awd2ParsedMaterial: no backend for this target."

#end
