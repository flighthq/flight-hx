package flight;

#if hl

typedef NetResponseExplanation = flight._hl.NetResponseExplanation;

#elseif cpp

typedef NetResponseExplanation = flight._cpp.NetResponseExplanation;

#elseif (js && flight_esm)

typedef NetResponseExplanation = flight._js.NetResponseExplanation;

#elseif js

#error "flight.NetResponseExplanation on js requires flight_esm."

#else

#error "flight.NetResponseExplanation: no backend for this target."

#end
