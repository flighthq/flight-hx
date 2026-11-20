package flight;

#if hl

typedef HostProtocolLaunchCapability = flight._hl.HostProtocolLaunchCapability;

#elseif cpp

typedef HostProtocolLaunchCapability = flight._cpp.HostProtocolLaunchCapability;

#elseif (js && flight_esm)

typedef HostProtocolLaunchCapability = flight._js.HostProtocolLaunchCapability;

#elseif js

#error "flight.HostProtocolLaunchCapability on js requires flight_esm."

#else

#error "flight.HostProtocolLaunchCapability: no backend for this target."

#end
