package flight;

#if hl

typedef HostMenuHighlightCapability = flight._hl.HostMenuHighlightCapability;

#elseif cpp

typedef HostMenuHighlightCapability = flight._cpp.HostMenuHighlightCapability;

#elseif (js && flight_esm)

typedef HostMenuHighlightCapability = flight._js.HostMenuHighlightCapability;

#elseif js

#error "flight.HostMenuHighlightCapability on js requires flight_esm."

#else

#error "flight.HostMenuHighlightCapability: no backend for this target."

#end
