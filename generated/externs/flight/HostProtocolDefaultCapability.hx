package flight;

#if hl

typedef HostProtocolDefaultCapability = flight._hl.HostProtocolDefaultCapability;

#elseif cpp

typedef HostProtocolDefaultCapability = flight._cpp.HostProtocolDefaultCapability;

#elseif (js && flight_esm)

typedef HostProtocolDefaultCapability = flight._js.HostProtocolDefaultCapability;

#elseif js

#error "flight.HostProtocolDefaultCapability on js requires flight_esm."

#else

#error "flight.HostProtocolDefaultCapability: no backend for this target."

#end
