package flight;

#if hl

typedef TintMaterialData = flight._hl.TintMaterialData;

#elseif cpp

typedef TintMaterialData = flight._cpp.TintMaterialData;

#elseif (js && flight_esm)

typedef TintMaterialData = flight._js.TintMaterialData;

#elseif js

#error "flight.TintMaterialData on js requires flight_esm."

#else

#error "flight.TintMaterialData: no backend for this target."

#end
