package flight;

#if hl

typedef StandardPbrMaterial = flight._hl.StandardPbrMaterial;

#elseif cpp

typedef StandardPbrMaterial = flight._cpp.StandardPbrMaterial;

#elseif (js && flight_esm)

typedef StandardPbrMaterial = flight._js.StandardPbrMaterial;

#elseif js

#error "flight.StandardPbrMaterial on js requires flight_esm."

#else

#error "flight.StandardPbrMaterial: no backend for this target."

#end
