package flight;

#if hl

typedef Awd2GeometryEntry = flight._hl.Awd2GeometryEntry;

#elseif cpp

typedef Awd2GeometryEntry = flight._cpp.Awd2GeometryEntry;

#elseif (js && flight_esm)

typedef Awd2GeometryEntry = flight._js.Awd2GeometryEntry;

#elseif js

#error "flight.Awd2GeometryEntry on js requires flight_esm."

#else

#error "flight.Awd2GeometryEntry: no backend for this target."

#end
