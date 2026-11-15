package flight;

#if hl

typedef UnityParseOptions = flight._hl.UnityParseOptions;

#elseif cpp

typedef UnityParseOptions = flight._cpp.UnityParseOptions;

#elseif (js && flight_esm)

typedef UnityParseOptions = flight._js.UnityParseOptions;

#elseif js

#error "flight.UnityParseOptions on js requires flight_esm."

#else

#error "flight.UnityParseOptions: no backend for this target."

#end
