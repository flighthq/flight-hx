package flight;

#if hl

typedef StarlingPexParseResult = flight._hl.StarlingPexParseResult;

#elseif cpp

typedef StarlingPexParseResult = flight._cpp.StarlingPexParseResult;

#elseif (js && flight_esm)

typedef StarlingPexParseResult = flight._js.StarlingPexParseResult;

#elseif js

#error "flight.StarlingPexParseResult on js requires flight_esm."

#else

#error "flight.StarlingPexParseResult: no backend for this target."

#end
