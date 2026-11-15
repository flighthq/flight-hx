package flight;

#if hl

typedef SpineParseResult = flight._hl.SpineParseResult;

#elseif cpp

typedef SpineParseResult = flight._cpp.SpineParseResult;

#elseif (js && flight_esm)

typedef SpineParseResult = flight._js.SpineParseResult;

#elseif js

#error "flight.SpineParseResult on js requires flight_esm."

#else

#error "flight.SpineParseResult: no backend for this target."

#end
