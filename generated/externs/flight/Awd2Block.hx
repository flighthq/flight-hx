package flight;

#if hl

typedef Awd2Block = flight._hl.Awd2Block;

#elseif cpp

typedef Awd2Block = flight._cpp.Awd2Block;

#elseif (js && flight_esm)

typedef Awd2Block = flight._js.Awd2Block;

#elseif js

#error "flight.Awd2Block on js requires flight_esm."

#else

#error "flight.Awd2Block: no backend for this target."

#end
