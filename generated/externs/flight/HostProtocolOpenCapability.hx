package flight;

#if hl

typedef HostProtocolOpenCapability = flight._hl.HostProtocolOpenCapability;

#elseif cpp

typedef HostProtocolOpenCapability = flight._cpp.HostProtocolOpenCapability;

#elseif (js && flight_esm)

typedef HostProtocolOpenCapability = flight._js.HostProtocolOpenCapability;

#elseif js

#error "flight.HostProtocolOpenCapability on js requires flight_esm."

#else

#error "flight.HostProtocolOpenCapability: no backend for this target."

#end
