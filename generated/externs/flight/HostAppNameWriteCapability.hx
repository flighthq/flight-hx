package flight;

#if hl

typedef HostAppNameWriteCapability = flight._hl.HostAppNameWriteCapability;

#elseif cpp

typedef HostAppNameWriteCapability = flight._cpp.HostAppNameWriteCapability;

#elseif (js && flight_esm)

typedef HostAppNameWriteCapability = flight._js.HostAppNameWriteCapability;

#elseif js

#error "flight.HostAppNameWriteCapability on js requires flight_esm."

#else

#error "flight.HostAppNameWriteCapability: no backend for this target."

#end
