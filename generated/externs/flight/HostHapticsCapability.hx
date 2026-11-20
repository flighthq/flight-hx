package flight;

#if hl

typedef HostHapticsCapability = flight._hl.HostHapticsCapability;

#elseif cpp

typedef HostHapticsCapability = flight._cpp.HostHapticsCapability;

#elseif (js && flight_esm)

typedef HostHapticsCapability = flight._js.HostHapticsCapability;

#elseif js

#error "flight.HostHapticsCapability on js requires flight_esm."

#else

#error "flight.HostHapticsCapability: no backend for this target."

#end
