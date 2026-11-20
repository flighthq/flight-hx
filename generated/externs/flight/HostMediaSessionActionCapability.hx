package flight;

#if hl

typedef HostMediaSessionActionCapability = flight._hl.HostMediaSessionActionCapability;

#elseif cpp

typedef HostMediaSessionActionCapability = flight._cpp.HostMediaSessionActionCapability;

#elseif (js && flight_esm)

typedef HostMediaSessionActionCapability = flight._js.HostMediaSessionActionCapability;

#elseif js

#error "flight.HostMediaSessionActionCapability on js requires flight_esm."

#else

#error "flight.HostMediaSessionActionCapability: no backend for this target."

#end
