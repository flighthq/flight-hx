package flight;

#if hl

typedef UnityParseResult = flight._hl.UnityParseResult;

#elseif cpp

typedef UnityParseResult = flight._cpp.UnityParseResult;

#elseif (js && flight_esm)

typedef UnityParseResult = flight._js.UnityParseResult;

#elseif js

#error "flight.UnityParseResult on js requires flight_esm."

#else

#error "flight.UnityParseResult: no backend for this target."

#end
