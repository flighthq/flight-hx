package flight;

#if hl

typedef HostAppNameCapability = flight._hl.HostAppNameCapability;

#elseif cpp

typedef HostAppNameCapability = flight._cpp.HostAppNameCapability;

#elseif (js && flight_esm)

typedef HostAppNameCapability = flight._js.HostAppNameCapability;

#elseif js

#error "flight.HostAppNameCapability on js requires flight_esm."

#else

#error "flight.HostAppNameCapability: no backend for this target."

#end
