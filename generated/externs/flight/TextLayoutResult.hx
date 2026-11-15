package flight;

#if hl

typedef TextLayoutResult = flight._hl.TextLayoutResult;

#elseif cpp

typedef TextLayoutResult = flight._cpp.TextLayoutResult;

#elseif (js && flight_esm)

typedef TextLayoutResult = flight._js.TextLayoutResult;

#elseif js

#error "flight.TextLayoutResult on js requires flight_esm."

#else

#error "flight.TextLayoutResult: no backend for this target."

#end
