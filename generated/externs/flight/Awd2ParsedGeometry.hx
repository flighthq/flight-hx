package flight;

#if hl

typedef Awd2ParsedGeometry = flight._hl.Awd2ParsedGeometry;

#elseif cpp

typedef Awd2ParsedGeometry = flight._cpp.Awd2ParsedGeometry;

#elseif (js && flight_esm)

typedef Awd2ParsedGeometry = flight._js.Awd2ParsedGeometry;

#elseif js

#error "flight.Awd2ParsedGeometry on js requires flight_esm."

#else

#error "flight.Awd2ParsedGeometry: no backend for this target."

#end
