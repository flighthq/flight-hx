package flight;

#if hl

typedef HasMaterialOptions = flight._hl.HasMaterialOptions;

#elseif cpp

typedef HasMaterialOptions = flight._cpp.HasMaterialOptions;

#elseif (js && flight_esm)

typedef HasMaterialOptions = flight._js.HasMaterialOptions;

#elseif js

#error "flight.HasMaterialOptions on js requires flight_esm."

#else

#error "flight.HasMaterialOptions: no backend for this target."

#end
