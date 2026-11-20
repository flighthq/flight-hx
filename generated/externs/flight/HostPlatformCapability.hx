package flight;

#if hl

typedef HostPlatformCapability = flight._hl.HostPlatformCapability;

#elseif cpp

typedef HostPlatformCapability = flight._cpp.HostPlatformCapability;

#elseif (js && flight_esm)

typedef HostPlatformCapability = flight._js.HostPlatformCapability;

#elseif js

#error "flight.HostPlatformCapability on js requires flight_esm."

#else

#error "flight.HostPlatformCapability: no backend for this target."

#end
