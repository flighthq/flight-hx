package flight;

#if hl

typedef TextShaperCache = flight._hl.TextShaperCache;

#elseif cpp

typedef TextShaperCache = flight._cpp.TextShaperCache;

#elseif (js && flight_esm)

typedef TextShaperCache = flight._js.TextShaperCache;

#elseif js

#error "flight.TextShaperCache on js requires flight_esm."

#else

#error "flight.TextShaperCache: no backend for this target."

#end
