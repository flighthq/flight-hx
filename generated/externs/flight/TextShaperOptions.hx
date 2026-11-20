package flight;

#if hl

typedef TextShaperOptions = flight._hl.TextShaperOptions;

#elseif cpp

typedef TextShaperOptions = flight._cpp.TextShaperOptions;

#elseif (js && flight_esm)

typedef TextShaperOptions = flight._js.TextShaperOptions;

#elseif js

#error "flight.TextShaperOptions on js requires flight_esm."

#else

#error "flight.TextShaperOptions: no backend for this target."

#end
