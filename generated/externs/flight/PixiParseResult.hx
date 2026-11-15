package flight;

#if hl

typedef PixiParseResult = flight._hl.PixiParseResult;

#elseif cpp

typedef PixiParseResult = flight._cpp.PixiParseResult;

#elseif (js && flight_esm)

typedef PixiParseResult = flight._js.PixiParseResult;

#elseif js

#error "flight.PixiParseResult on js requires flight_esm."

#else

#error "flight.PixiParseResult: no backend for this target."

#end
