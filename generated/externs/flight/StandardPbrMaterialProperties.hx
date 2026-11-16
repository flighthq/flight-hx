package flight;

#if hl

typedef StandardPbrMaterialProperties = flight._hl.StandardPbrMaterialProperties;

#elseif cpp

typedef StandardPbrMaterialProperties = flight._cpp.StandardPbrMaterialProperties;

#elseif (js && flight_esm)

typedef StandardPbrMaterialProperties = flight._js.StandardPbrMaterialProperties;

#elseif js

#error "flight.StandardPbrMaterialProperties on js requires flight_esm."

#else

#error "flight.StandardPbrMaterialProperties: no backend for this target."

#end
