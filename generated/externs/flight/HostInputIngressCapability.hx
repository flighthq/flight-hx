package flight;

#if hl

typedef HostInputIngressCapability = flight._hl.HostInputIngressCapability;

#elseif cpp

typedef HostInputIngressCapability = flight._cpp.HostInputIngressCapability;

#elseif (js && flight_esm)

typedef HostInputIngressCapability = flight._js.HostInputIngressCapability;

#elseif js

#error "flight.HostInputIngressCapability on js requires flight_esm."

#else

#error "flight.HostInputIngressCapability: no backend for this target."

#end
