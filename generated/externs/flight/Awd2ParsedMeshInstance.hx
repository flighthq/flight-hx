package flight;

#if hl

typedef Awd2ParsedMeshInstance = flight._hl.Awd2ParsedMeshInstance;

#elseif cpp

typedef Awd2ParsedMeshInstance = flight._cpp.Awd2ParsedMeshInstance;

#elseif (js && flight_esm)

typedef Awd2ParsedMeshInstance = flight._js.Awd2ParsedMeshInstance;

#elseif js

#error "flight.Awd2ParsedMeshInstance on js requires flight_esm."

#else

#error "flight.Awd2ParsedMeshInstance: no backend for this target."

#end
