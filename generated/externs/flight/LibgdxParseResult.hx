package flight;

#if hl

typedef LibgdxParseResult = flight._hl.LibgdxParseResult;

#elseif cpp

typedef LibgdxParseResult = flight._cpp.LibgdxParseResult;

#elseif (js && flight_esm)

typedef LibgdxParseResult = flight._js.LibgdxParseResult;

#elseif js

#error "flight.LibgdxParseResult on js requires flight_esm."

#else

#error "flight.LibgdxParseResult: no backend for this target."

#end
