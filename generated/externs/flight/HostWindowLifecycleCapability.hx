package flight;

#if hl

typedef HostWindowLifecycleCapability = flight._hl.HostWindowLifecycleCapability;

#elseif cpp

typedef HostWindowLifecycleCapability = flight._cpp.HostWindowLifecycleCapability;

#elseif (js && flight_esm)

typedef HostWindowLifecycleCapability = flight._js.HostWindowLifecycleCapability;

#elseif js

#error "flight.HostWindowLifecycleCapability on js requires flight_esm."

#else

#error "flight.HostWindowLifecycleCapability: no backend for this target."

#end
