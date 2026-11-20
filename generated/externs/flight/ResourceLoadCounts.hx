package flight;

#if hl

typedef ResourceLoadCounts = flight._hl.ResourceLoadCounts;

#elseif cpp

typedef ResourceLoadCounts = flight._cpp.ResourceLoadCounts;

#elseif (js && flight_esm)

typedef ResourceLoadCounts = flight._js.ResourceLoadCounts;

#elseif js

#error "flight.ResourceLoadCounts on js requires flight_esm."

#else

#error "flight.ResourceLoadCounts: no backend for this target."

#end
