package flight;

#if hl

typedef HostIpcMessageCapability = flight._hl.HostIpcMessageCapability;

#elseif cpp

typedef HostIpcMessageCapability = flight._cpp.HostIpcMessageCapability;

#elseif (js && flight_esm)

typedef HostIpcMessageCapability = flight._js.HostIpcMessageCapability;

#elseif js

#error "flight.HostIpcMessageCapability on js requires flight_esm."

#else

#error "flight.HostIpcMessageCapability: no backend for this target."

#end
