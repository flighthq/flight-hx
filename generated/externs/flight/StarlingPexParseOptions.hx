package flight;

#if hl

typedef StarlingPexParseOptions = flight._hl.StarlingPexParseOptions;

#elseif cpp

typedef StarlingPexParseOptions = flight._cpp.StarlingPexParseOptions;

#elseif (js && flight_esm)

typedef StarlingPexParseOptions = flight._js.StarlingPexParseOptions;

#elseif js

#error "flight.StarlingPexParseOptions on js requires flight_esm."

#else

#error "flight.StarlingPexParseOptions: no backend for this target."

#end
