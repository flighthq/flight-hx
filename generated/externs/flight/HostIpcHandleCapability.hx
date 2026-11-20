package flight;

#if hl

typedef HostIpcHandleCapability = flight._hl.HostIpcHandleCapability;

#elseif cpp

typedef HostIpcHandleCapability = flight._cpp.HostIpcHandleCapability;

#elseif (js && flight_esm)

typedef HostIpcHandleCapability = flight._js.HostIpcHandleCapability;

#elseif js

#error "flight.HostIpcHandleCapability on js requires flight_esm."

#else

#error "flight.HostIpcHandleCapability: no backend for this target."

#end
