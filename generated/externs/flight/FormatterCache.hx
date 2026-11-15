package flight;

#if hl

typedef FormatterCache = flight._hl.FormatterCache;

#elseif cpp

typedef FormatterCache = flight._cpp.FormatterCache;

#elseif (js && flight_esm)

typedef FormatterCache = flight._js.FormatterCache;

#elseif js

#error "flight.FormatterCache on js requires flight_esm."

#else

#error "flight.FormatterCache: no backend for this target."

#end
