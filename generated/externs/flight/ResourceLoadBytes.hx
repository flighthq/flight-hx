package flight;

#if hl

typedef ResourceLoadBytes = flight._hl.ResourceLoadBytes;

#elseif cpp

typedef ResourceLoadBytes = flight._cpp.ResourceLoadBytes;

#elseif (js && flight_esm)

typedef ResourceLoadBytes = flight._js.ResourceLoadBytes;

#elseif js

#error "flight.ResourceLoadBytes on js requires flight_esm."

#else

#error "flight.ResourceLoadBytes: no backend for this target."

#end
