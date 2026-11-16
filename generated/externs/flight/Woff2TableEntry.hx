package flight;

#if hl

typedef Woff2TableEntry = flight._hl.Woff2TableEntry;

#elseif cpp

typedef Woff2TableEntry = flight._cpp.Woff2TableEntry;

#elseif (js && flight_esm)

typedef Woff2TableEntry = flight._js.Woff2TableEntry;

#elseif js

#error "flight.Woff2TableEntry on js requires flight_esm."

#else

#error "flight.Woff2TableEntry: no backend for this target."

#end
