package flight;

#if hl

typedef HostMediaSessionCapability = flight._hl.HostMediaSessionCapability;

#elseif cpp

typedef HostMediaSessionCapability = flight._cpp.HostMediaSessionCapability;

#elseif (js && flight_esm)

typedef HostMediaSessionCapability = flight._js.HostMediaSessionCapability;

#elseif js

#error "flight.HostMediaSessionCapability on js requires flight_esm."

#else

#error "flight.HostMediaSessionCapability: no backend for this target."

#end
