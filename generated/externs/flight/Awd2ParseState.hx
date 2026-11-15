package flight;

#if hl

typedef Awd2ParseState = flight._hl.Awd2ParseState;

#elseif cpp

typedef Awd2ParseState = flight._cpp.Awd2ParseState;

#elseif (js && flight_esm)

typedef Awd2ParseState = flight._js.Awd2ParseState;

#elseif js

#error "flight.Awd2ParseState on js requires flight_esm."

#else

#error "flight.Awd2ParseState: no backend for this target."

#end
