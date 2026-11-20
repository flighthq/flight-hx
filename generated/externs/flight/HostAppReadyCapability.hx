package flight;

#if hl

typedef HostAppReadyCapability = flight._hl.HostAppReadyCapability;

#elseif cpp

typedef HostAppReadyCapability = flight._cpp.HostAppReadyCapability;

#elseif (js && flight_esm)

typedef HostAppReadyCapability = flight._js.HostAppReadyCapability;

#elseif js

#error "flight.HostAppReadyCapability on js requires flight_esm."

#else

#error "flight.HostAppReadyCapability: no backend for this target."

#end
