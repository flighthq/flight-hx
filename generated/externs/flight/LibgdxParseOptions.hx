package flight;

#if hl

typedef LibgdxParseOptions = flight._hl.LibgdxParseOptions;

#elseif cpp

typedef LibgdxParseOptions = flight._cpp.LibgdxParseOptions;

#elseif (js && flight_esm)

typedef LibgdxParseOptions = flight._js.LibgdxParseOptions;

#elseif js

#error "flight.LibgdxParseOptions on js requires flight_esm."

#else

#error "flight.LibgdxParseOptions: no backend for this target."

#end
