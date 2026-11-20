package flight;

#if hl

typedef HostIpcSendCapability = flight._hl.HostIpcSendCapability;

#elseif cpp

typedef HostIpcSendCapability = flight._cpp.HostIpcSendCapability;

#elseif (js && flight_esm)

typedef HostIpcSendCapability = flight._js.HostIpcSendCapability;

#elseif js

#error "flight.HostIpcSendCapability on js requires flight_esm."

#else

#error "flight.HostIpcSendCapability: no backend for this target."

#end
