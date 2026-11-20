package flight;

#if hl

typedef HostProtocolUnregistrationCapability = flight._hl.HostProtocolUnregistrationCapability;

#elseif cpp

typedef HostProtocolUnregistrationCapability = flight._cpp.HostProtocolUnregistrationCapability;

#elseif (js && flight_esm)

typedef HostProtocolUnregistrationCapability = flight._js.HostProtocolUnregistrationCapability;

#elseif js

#error "flight.HostProtocolUnregistrationCapability on js requires flight_esm."

#else

#error "flight.HostProtocolUnregistrationCapability: no backend for this target."

#end
