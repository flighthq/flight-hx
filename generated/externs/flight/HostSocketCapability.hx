package flight;

#if hl

typedef HostSocketCapability = flight._hl.HostSocketCapability;

#elseif cpp

typedef HostSocketCapability = flight._cpp.HostSocketCapability;

#elseif (js && flight_esm)

typedef HostSocketCapability = flight._js.HostSocketCapability;

#elseif js

#error "flight.HostSocketCapability on js requires flight_esm."

#else

#error "flight.HostSocketCapability: no backend for this target."

#end
