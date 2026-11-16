package flight;

#if hl

typedef Awd2MeshInstanceEntry = flight._hl.Awd2MeshInstanceEntry;

#elseif cpp

typedef Awd2MeshInstanceEntry = flight._cpp.Awd2MeshInstanceEntry;

#elseif (js && flight_esm)

typedef Awd2MeshInstanceEntry = flight._js.Awd2MeshInstanceEntry;

#elseif js

#error "flight.Awd2MeshInstanceEntry on js requires flight_esm."

#else

#error "flight.Awd2MeshInstanceEntry: no backend for this target."

#end
