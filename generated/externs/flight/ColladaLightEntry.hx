package flight;

#if hl

typedef ColladaLightEntry = flight._hl.ColladaLightEntry;

#elseif cpp

typedef ColladaLightEntry = flight._cpp.ColladaLightEntry;

#elseif (js && flight_esm)

typedef ColladaLightEntry = flight._js.ColladaLightEntry;

#elseif js

#error "flight.ColladaLightEntry on js requires flight_esm."

#else

#error "flight.ColladaLightEntry: no backend for this target."

#end
