package flight;

#if hl

typedef HostScreenQueryCapability = flight._hl.HostScreenQueryCapability;

#elseif cpp

typedef HostScreenQueryCapability = flight._cpp.HostScreenQueryCapability;

#elseif (js && flight_esm)

typedef HostScreenQueryCapability = flight._js.HostScreenQueryCapability;

#elseif js

#error "flight.HostScreenQueryCapability on js requires flight_esm."

#else

#error "flight.HostScreenQueryCapability: no backend for this target."

#end
