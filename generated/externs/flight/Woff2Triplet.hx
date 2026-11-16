package flight;

#if hl

typedef Woff2Triplet = flight._hl.Woff2Triplet;

#elseif cpp

typedef Woff2Triplet = flight._cpp.Woff2Triplet;

#elseif (js && flight_esm)

typedef Woff2Triplet = flight._js.Woff2Triplet;

#elseif js

#error "flight.Woff2Triplet on js requires flight_esm."

#else

#error "flight.Woff2Triplet: no backend for this target."

#end
