package flight;

#if hl

typedef HostLifecycleCapability = flight._hl.HostLifecycleCapability;

#elseif cpp

typedef HostLifecycleCapability = flight._cpp.HostLifecycleCapability;

#elseif (js && flight_esm)

typedef HostLifecycleCapability = flight._js.HostLifecycleCapability;

#elseif js

#error "flight.HostLifecycleCapability on js requires flight_esm."

#else

#error "flight.HostLifecycleCapability: no backend for this target."

#end
